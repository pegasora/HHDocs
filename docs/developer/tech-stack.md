# Technology Stack

> **Deep dive into technologies powering Jarvis**

## Frontend Stack

### Next.js 15.5.4
- **App Router** - React Server Components
- **API Routes** - Backend endpoints
- **Streaming** - Server-Sent Events for responses
- **Turbopack** - Fast development builds

### React 19.2.0
- **Server Components** - Improved performance
- **Suspense** - Loading states
- **Hooks** - State management

### assistant-ui 0.11.35
- **Pre-built chat components**
- **Message threading**
- **Tool execution display**
- **Markdown rendering**

### Tailwind CSS 4.x
- **Utility-first CSS**
- **Custom design system**
- **Responsive design**
- **Dark mode support**

## Backend Stack

### Mastra 0.23.3
- **Agent orchestration**
- **Tool management**
- **Memory system**
- **PostgreSQL integration**

### Ollama (Latest)
- **Local LLM inference**
- **Model management**
- **GPU acceleration**
- **OpenAI-compatible API**

## Models

### qwen3:14b
- **Parameters**: 14 billion
- **Context**: 32K tokens
- **Speed**: ~30 tokens/sec on RTX 3090
- **Use**: Chat completion

### nomic-embed-text:latest
- **Dimensions**: 768
- **Use**: Text embeddings for RAG
- **Performance**: Fast on GPU

## Storage

### ChromaDB 3.0.0
- **Vector database**
- **HNSW indexing**
- **Cosine similarity**
- **OpenTelemetry support**

### PostgreSQL 15 (Supabase)
- **Relational database**
- **Row-level security**
- **Real-time subscriptions**
- **Built-in auth**

[← Project Structure](project-structure.md) | [Next: Workflow →](workflow.md)
