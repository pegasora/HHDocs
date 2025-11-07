# RAG Search Guide

> **Master document search with Retrieval-Augmented Generation**

## What is RAG?

**RAG (Retrieval-Augmented Generation)** combines:
- 🔍 **Search**: Find relevant documents
- 🤖 **AI Generation**: Synthesize answers from sources
- 📚 **Knowledge Base**: 900+ injection molding document chunks

## How RAG Works

1. **You ask a question**
2. **Jarvis generates embedding** (768-dimensional vector)
3. **ChromaDB searches** for similar documents (cosine similarity)
4. **Top 5 chunks retrieved** with relevance scores
5. **Jarvis synthesizes answer** using retrieved context
6. **Response includes sources** for verification

## Best RAG Queries

✅ "What causes short shots?"  
✅ "Show me mold maintenance procedures"  
✅ "How do I troubleshoot flash defects?"  
✅ "Find quality control documentation"  

[← Chat Interface](chat-interface.md) | [Next: Tips →](tips.md)
