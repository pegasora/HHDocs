# Architecture Overview

> **Comprehensive system architecture and design principles for Jarvis AI Assistant**

---

## Table of Contents

1. [High-Level Architecture](#high-level-architecture)
2. [System Components](#system-components)
3. [Data Flow](#data-flow)
4. [Technology Stack](#technology-stack)
5. [Infrastructure](#infrastructure)
6. [Security Architecture](#security-architecture)
7. [Scalability & Performance](#scalability--performance)

---

## High-Level Architecture

Jarvis follows a **modern microservices architecture** with clear separation of concerns:

```
┌─────────────────────────────────────────────────────────────┐
│                      USER BROWSER                            │
│                   (Chrome/Firefox/Edge)                       │
└────────────────────────┬────────────────────────────────────┘
                         │ HTTP
                         ↓
┌─────────────────────────────────────────────────────────────┐
│                   FRONTEND LAYER (Next.js 15)                │
│  ┌──────────────┐  ┌───────────────┐  ┌──────────────────┐ │
│  │  Pages &     │  │  Components   │  │  API Routes      │ │
│  │  Layouts     │  │  (assistant-ui)│  │  (/api/*)        │ │
│  └──────────────┘  └───────────────┘  └──────────────────┘ │
└────────────────────────┬────────────────────────────────────┘
                         │ REST API / Server Actions
                         ↓
┌─────────────────────────────────────────────────────────────┐
│                  AGENT ORCHESTRATION LAYER                   │
│                   (Mastra Framework 0.23.3)                  │
│  ┌───────────────────────────────────────────────────────┐  │
│  │  Test Agent (Primary Router)                          │  │
│  │    ├─ Instructions: System prompts & behavior         │  │
│  │    ├─ Model: Ollama qwen3:14b                        │  │
│  │    ├─ Tools: weatherTool, ragQueryTool, etc.         │  │
│  │    └─ Memory: PostgreSQL-backed conversation history  │  │
│  └───────────────────────────────────────────────────────┘  │
└────────────────────────┬────────────────────────────────────┘
                         │ Tool Calls
                         ↓
┌─────────────────────────────────────────────────────────────┐
│                      TOOLS LAYER                             │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────┐  │
│  │  RAG Query   │  │  Weather API │  │  File Access     │  │
│  │  Tool        │  │  Tool        │  │  Tools           │  │
│  └──────────────┘  └──────────────┘  └──────────────────┘  │
└─────────────┬──────────────────┬──────────────┬─────────────┘
              │                  │              │
              ↓                  ↓              ↓
┌──────────────────┐  ┌────────────────┐  ┌────────────────┐
│   ChromaDB       │  │   Ollama LLM   │  │  Supabase      │
│  (Vector DB)     │  │   Server       │  │  (PostgreSQL)  │
│                  │  │                │  │                │
│  • 942 chunks    │  │  • qwen3:14b   │  │  • Users       │
│  • 768-dim       │  │  • nomic-embed │  │  • Sessions    │
│  • Cosine sim    │  │  • Local GPU   │  │  • Messages    │
└──────────────────┘  └────────────────┘  └────────────────┘
```

---

## System Components

### 1. Frontend Layer (Next.js 15 + React 19)

**Purpose**: User interface and client-side logic

**Key Technologies**:
- **Framework**: Next.js 15.5.4 (App Router)
- **UI Library**: React 19.2.0
- **Chat Components**: assistant-ui 0.11.35+
- **Styling**: Tailwind CSS 4.x
- **Type Safety**: TypeScript 5.x

**Directory Structure**:
```
jarvis/app/
├── (auth)/           # Public routes
│   └── login/        # Login page
├── (protected)/      # Authenticated routes
│   ├── page.tsx      # Main chat interface
│   ├── assistant.tsx # Chat UI component
│   └── usage/        # Analytics dashboard
└── api/              # API routes
    ├── chat/         # Main agent endpoint
    ├── threads/      # Thread management
    └── auth/         # User management
```

**Responsibilities**:
- ✅ Render chat UI with assistant-ui components
- ✅ Handle user authentication
- ✅ Manage client-side state (threads, messages)
- ✅ Stream responses from backend
- ✅ Provide analytics dashboard

---

### 2. API Layer (Next.js API Routes)

**Purpose**: Backend endpoints for frontend-backend communication

**Key Endpoints**:

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/api/chat` | POST | Stream agent responses |
| `/api/threads` | GET/POST | Fetch/create threads |
| `/api/threads/history` | GET | Load thread messages |
| `/api/auth/users` | GET | Fetch user list |
| `/api/feedback` | POST | Submit feedback |

**Authentication**:
- Uses Supabase session tokens
- Validates user on each request
- Returns 401 if unauthorized

**Response Format**:
- Streaming: Server-Sent Events (SSE)
- Standard: JSON
- Error: { error: string, details?: any }

---

### 3. Agent Orchestration Layer (Mastra)

**Purpose**: AI agent logic, tool routing, and conversation management

**Framework**: Mastra 0.23.3+

**Agent Architecture**:

```typescript
// Simplified agent structure
export const testAgent = new Agent({
  name: "test-agent",
  instructions: `
    You are Jarvis, an AI assistant for H&H Molds Inc.
    ...agent behavior instructions...
  `,
  model: ollama("qwen3:14b"),
  tools: {
    weatherTool,
    ragQueryTool,
    listDocumentsTool,
    getFileContentsTool,
  },
  memory: new Memory({
    storage: new PostgresStore({
      connectionString: process.env.DATABASE_URL,
    }),
    options: {
      lastMessages: 15,  // Context window
      threads: { generateTitle: true },
    },
  }),
});
```

**Key Responsibilities**:
- ✅ Parse user queries
- ✅ Select appropriate tools
- ✅ Chain multiple tool calls
- ✅ Manage conversation context
- ✅ Generate responses
- ✅ Persist messages to database

---

### 4. Tools Layer

**Purpose**: Specialized functions that agents can invoke

**Current Tools**:

#### A. RAG Query Tool (`ragQueryTool`)

**File**: `mastra/tools/rag-query-tool.ts`

**Purpose**: Semantic search over injection molding documentation

**Implementation**:
```typescript
export const ragQueryTool = createTool({
  id: "ragQueryTool",
  description: "Search documents using semantic similarity",
  inputSchema: z.object({
    queryText: z.string(),
    topK: z.number().optional().default(5),
  }),
  execute: async ({ context, mastra }) => {
    // 1. Generate embedding
    const { embedding } = await embed({
      model: ollama.textEmbeddingModel("nomic-embed-text:latest"),
      value: context.queryText,
    });
    
    // 2. Query ChromaDB
    const results = await mastra.vectors.chromaVector.query({
      indexName: "documents",
      queryVector: embedding,
      topK: context.topK,
    });
    
    // 3. Format and return
    return { relevantContext, sources };
  },
});
```

**Data Flow**:
```
User Query
    ↓
Generate Embedding (768-dim via Ollama)
    ↓
ChromaDB Vector Search (cosine similarity)
    ↓
Top K Results (with scores + metadata)
    ↓
Format Context String
    ↓
Return to Agent
```

#### B. Weather Tool (`weatherTool`)

**File**: `mastra/tools/weather-tool.ts`

**Purpose**: Fetch real-time weather data

**API**: wttr.in (free weather service)

#### C. List Documents Tool (`listDocumentsTool`)

**Purpose**: Browse available documents in knowledge base

#### D. Get File Contents Tool (`getFileContentsTool`)

**Purpose**: Retrieve full document contents

---

### 5. Storage Layer

#### A. ChromaDB (Vector Database)

**Version**: 3.0.0

**Purpose**: Store and query document embeddings

**Configuration**:
- **URL**: http://10.0.0.76:9999
- **Collection**: `documents`
- **Embedding Dimension**: 768
- **Distance Metric**: Cosine similarity
- **Index Type**: HNSW

**Schema**:
```json
{
  "ids": ["uuid"],
  "embeddings": [[...768 floats]],
  "metadatas": [{
    "file_id": "/path/to/file.md",
    "file_title": "filename"
  }],
  "documents": ["chunk text content"]
}
```

**Performance**:
- 942 document chunks
- <1 second query time
- 99.9% uptime

#### B. Supabase PostgreSQL

**Version**: PostgreSQL 15 (via Supabase)

**Purpose**: Relational data storage

**Tables**:

**`profiles_nxt`** - User profiles
```sql
CREATE TABLE profiles_nxt (
  id UUID PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
```

**`mastra_threads`** - Chat sessions (Mastra auto-generated)
```sql
CREATE TABLE mastra_threads (
  id UUID PRIMARY KEY,
  resourceId VARCHAR(255),  -- User ID
  title VARCHAR(255),
  metadata JSONB,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP
);
```

**`mastra_messages`** - Chat messages (Mastra auto-generated)
```sql
CREATE TABLE mastra_messages (
  id UUID PRIMARY KEY,
  threadId UUID REFERENCES mastra_threads(id),
  role VARCHAR(50),  -- 'user' | 'assistant' | 'tool'
  content TEXT,
  toolCalls JSONB,
  createdAt TIMESTAMP
);
```

**`feedback_nxt`** - User feedback
```sql
CREATE TABLE feedback_nxt (
  id UUID PRIMARY KEY,
  message_id UUID,
  user_id UUID,
  rating VARCHAR(50),  -- 'positive' | 'negative'
  feedback_text TEXT,
  created_at TIMESTAMP
);
```

---

## Data Flow

### Query Execution Flow

```
┌─────────────────────────────────────────────────────────────┐
│ 1. USER SENDS MESSAGE                                       │
│    Input: "What causes short shots?"                        │
└──────────────────────┬──────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────────────┐
│ 2. FRONTEND CAPTURES                                        │
│    • ThreadPrimitive.Composer gets input                    │
│    • transport.fetch() adds threadId + resourceId           │
│    • POST to /api/chat                                      │
└──────────────────────┬──────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────────────┐
│ 3. API ROUTE PROCESSES                                      │
│    • Extract { messages, threadId, resourceId }             │
│    • Get agent: mastra.getAgent("testAgent")                │
│    • Call agent.stream(messages, { memory: {...} })         │
└──────────────────────┬──────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────────────┐
│ 4. AGENT PROCESSES                                          │
│    • Analyze query intent                                   │
│    • Decide: "This needs RAG search"                        │
│    • Invoke ragQueryTool                                    │
└──────────────────────┬──────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────────────┐
│ 5. RAG TOOL EXECUTES                                        │
│    • Generate query embedding (768-dim)                     │
│    • Query ChromaDB with embedding                          │
│    • Receive top 5 relevant chunks                          │
│    • Return formatted context to agent                      │
└──────────────────────┬──────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────────────┐
│ 6. AGENT SYNTHESIZES                                        │
│    • Combine retrieved context with query                   │
│    • Generate response using qwen3:14b                      │
│    • Stream tokens back to API route                        │
└──────────────────────┬──────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────────────┐
│ 7. RESPONSE STREAMING                                       │
│    • API route converts to UIMessageStream                  │
│    • Frontend receives SSE stream                           │
│    • UI updates in real-time                                │
│    • Message saved to PostgreSQL automatically              │
└─────────────────────────────────────────────────────────────┘
```

### Message Persistence Flow

```
User Message
    ↓
Frontend (assistant-ui runtime)
    ↓
POST /api/chat with { threadId, resourceId, messages }
    ↓
agent.stream() with memory: { thread: threadId, resource: resourceId }
    ↓
Mastra Memory Interceptor
    ↓
Auto-save to PostgreSQL (mastra_messages table)
    ↓
Update mastra_threads.updatedAt timestamp
```

---

## Technology Stack

### Production Stack

| Layer | Component | Version | License |
|-------|-----------|---------|---------|
| **Frontend** | Next.js | 15.5.4 | MIT |
| **UI** | React | 19.2.0 | MIT |
| **Chat UI** | assistant-ui | 0.11.35+ | MIT |
| **Styling** | Tailwind CSS | 4.x | MIT |
| **Agent Framework** | Mastra | 0.23.3+ | MIT |
| **LLM Runtime** | Ollama | Latest | MIT |
| **Chat Model** | qwen3:14b | Latest | Apache 2.0 |
| **Embeddings** | nomic-embed-text | Latest | Apache 2.0 |
| **Vector DB** | ChromaDB | 3.0.0 | Apache 2.0 |
| **Database** | PostgreSQL | 15 | PostgreSQL |
| **Backend** | Supabase | 2.78.0 | Apache 2.0 |
| **Observability** | Langfuse | 3.38.6 | MIT |
| **Orchestration** | Docker Compose | Latest | Apache 2.0 |

### Development Tools

| Tool | Purpose |
|------|---------|
| TypeScript 5.x | Static type checking |
| ESLint 9 | Code linting |
| Prettier 3.6.2 | Code formatting |
| pnpm/npm | Package management |

---

## Infrastructure

### Deployment Architecture

```
┌─────────────────────────────────────────────────────────┐
│                Ubuntu Server 22.04 LTS                   │
│  Hardware: AMD Ryzen 9 5950X + RTX 3090 24GB + 64GB RAM │
└───────────────────────┬─────────────────────────────────┘
                        │
                        ↓
┌─────────────────────────────────────────────────────────┐
│               Docker Compose Orchestration               │
└───┬────┬────┬────┬────┬────┬────┬────┬────┬────┬───┬───┘
    │    │    │    │    │    │    │    │    │    │   │
    ↓    ↓    ↓    ↓    ↓    ↓    ↓    ↓    ↓    ↓   ↓
┌────────────────────────────────────────────────────────┐
│  Jarvis  Ollama ChromaDB Supabase n8n Langfuse ...    │
│  :8501   :11434  :9999   :8000   :5678 :3001          │
└────────────────────────────────────────────────────────┘
```

### Docker Services

**Jarvis (Next.js)**:
- Port: 8501
- Volumes: ./jarvis:/app
- Environment: DATABASE_URL, OLLAMA_BASE_URL, etc.

**Ollama**:
- Port: 11434
- GPU: NVIDIA RTX 3090
- Models: qwen3:14b, nomic-embed-text:latest
- Volume: ollama_storage:/root/.ollama

**ChromaDB**:
- Port: 9999 (internal: 8000)
- Volume: /tank/chromadb:/data
- Telemetry: OpenTelemetry + Zipkin

**Supabase Stack**:
- Kong (API Gateway): 8000
- PostgreSQL: 5432
- Storage: 8000/storage
- Auth: Built-in

**Langfuse**:
- Port: 3001
- Database: Dedicated PostgreSQL
- ClickHouse: Analytics storage

---

## Security Architecture

### Authentication Flow

```
User Login
    ↓
Select from profiles_nxt table
    ↓
Generate Supabase session token
    ↓
Store in localStorage
    ↓
Include in all API requests
    ↓
Validate on server (useAuth hook)
```

### Data Privacy

✅ **100% Local Processing**
- All LLM inference happens on local GPU
- No data sent to external APIs
- No cloud dependencies

✅ **Network Isolation**
- Only accessible on H&H internal network
- Tailscale VPN for remote access
- No public internet exposure

✅ **User Isolation**
- Threads scoped to resourceId (user ID)
- Cannot access other users' chats
- Row-level security (coming soon)

---

## Scalability & Performance

### Current Capacity

**Concurrent Users**: 10+ simultaneous  
**Query Throughput**: ~4 queries/second  
**Response Time**: 3-15 seconds (avg 8s)  
**Uptime**: >99.5%

### Scaling Strategies

#### Horizontal Scaling
- Add more Ollama GPU instances
- Load balance across multiple backends
- Distribute ChromaDB across shards

#### Vertical Scaling
- Upgrade to more powerful GPU (RTX 4090, A100)
- Increase RAM for larger models
- NVMe SSD for faster vector search

#### Optimization
- Implement response caching
- Pre-compute frequent embeddings
- Batch similar queries
- Optimize context window size

---

## Monitoring & Observability

### Langfuse Integration

**Traces Captured**:
- Agent invocations
- Tool calls
- Response times
- Error rates
- Token usage

**Metrics Dashboard**:
- Average response time
- Tool usage distribution
- User activity patterns
- Error frequency

### Health Checks

```bash
# Check all services
docker compose -p localai ps

# Check Ollama
curl http://localhost:11434/api/tags

# Check ChromaDB
curl http://10.0.0.76:9999/api/v1/heartbeat

# Check Supabase
curl http://localhost:8000/health
```

---

## Next Steps

- [Quick Start Guide](quick-start.md) - Set up development environment
- [Project Structure](project-structure.md) - Explore codebase organization
- [Technology Stack](tech-stack.md) - Deep dive into tech choices
- [Development Workflow](workflow.md) - Best practices for development

---

[← Developer Docs](quick-start.md) | [Next: Quick Start →](quick-start.md)
