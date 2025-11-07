# Mastra Framework

> **Agent orchestration and tool management**

## What is Mastra?

**Mastra** is an open-source framework for building AI agents with tool-calling capabilities.

**Version**: 0.23.3+  
**License**: MIT  
**Website**: https://mastra.ai

## Core Concepts

### Agents
Autonomous AI entities that use tools to accomplish tasks.

### Tools
Functions that agents can invoke.

### Memory
Conversation history management with PostgreSQL backend.

## Jarvis Integration

```typescript
// mastra/index.ts
import { Mastra } from "@mastra/core";
import { ChromaVector } from "@mastra/chroma";

const chromaVector = new ChromaVector({
  path: process.env.CHROMADB_URL,
});

export const mastra = new Mastra({
  vectors: { chromaVector },
});
```

## Key Features

1. **Tool Orchestration** - Automatic tool selection
2. **Memory Management** - PostgreSQL-backed conversations
3. **Streaming** - Real-time response streaming
4. **Type Safety** - Full TypeScript support

[← Jarvis](jarvis.md) | [Next: Ollama →](ollama.md)
