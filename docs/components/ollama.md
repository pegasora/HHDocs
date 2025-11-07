# Ollama (Local LLM Runtime)

> **Local language model inference server**

## Overview

**Ollama** runs large language models locally without external API dependencies.

**Port**: 11434  
**License**: MIT  
**Website**: https://ollama.com

## Models

### qwen3:14b (Chat)
- **Parameters**: 14 billion
- **Context**: 32K tokens
- **Speed**: ~30 tokens/sec (RTX 3090)
- **Size**: ~8GB
- **Use**: Chat completion

### nomic-embed-text:latest (Embeddings)
- **Dimensions**: 768
- **Speed**: Fast on GPU
- **Size**: ~275MB
- **Use**: Text embeddings for RAG

## Usage

```bash
# Pull models
docker exec -it ollama ollama pull qwen3:14b
docker exec -it ollama ollama pull nomic-embed-text:latest

# List models
docker exec -it ollama ollama list

# Test
curl http://localhost:11434/api/generate \
  -d '{"model":"qwen3:14b","prompt":"Hello"}'
```

## Configuration

GPU acceleration enabled by default (NVIDIA).

[← Mastra](mastra.md) | [Next: ChromaDB →](chromadb.md)
