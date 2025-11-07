# ChromaDB (Vector Database)

> **Vector embeddings and semantic search**

## Overview

**ChromaDB** is an open-source vector database optimized for similarity search.

**Version**: 3.0.0  
**Port**: 9999 (internal: 8000)  
**License**: Apache 2.0  
**Website**: https://www.trychroma.com

## Configuration

- **URL**: http://10.0.0.76:9999
- **Data Volume**: /tank/chromadb
- **Collection**: documents
- **Documents**: 942 chunks
- **Dimensions**: 768
- **Distance**: Cosine similarity

## Usage in Jarvis

```typescript
// Mastra integration
const chromaVector = new ChromaVector({
  path: "http://10.0.0.76:9999"
});

// Query
const results = await chromaVector.query({
  indexName: "documents",
  queryVector: embedding,
  topK: 5
});
```

## Features

1. **Fast Search** - <1 second for 900+ chunks
2. **HNSW Indexing** - Efficient similarity search
3. **Metadata Filtering** - Filter by file_id, file_title
4. **OpenTelemetry** - Observability integration

[← Ollama](ollama.md) | [Next: Supabase →](supabase.md)
