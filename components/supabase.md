# Supabase (Backend Platform)

> **PostgreSQL database and authentication**

## Overview

**Supabase** is an open-source Firebase alternative with PostgreSQL.

**Port**: 8000 (Kong API Gateway)  
**License**: Apache 2.0  
**Website**: https://supabase.com

## Services

- **PostgreSQL**: Database (port 5432)
- **Kong**: API Gateway (port 8000)
- **GoTrue**: Authentication
- **PostgREST**: Auto-generated API
- **Storage**: File storage
- **Realtime**: WebSocket updates

## Jarvis Tables

### profiles_nxt
User profiles and authentication.

### mastra_threads
Chat threads/sessions (Mastra auto-generated).

### mastra_messages
Chat messages (Mastra auto-generated).

### feedback_nxt
User feedback on responses.

## Access

**Studio UI**: http://localhost:8000  
**Direct DB**: `psql $DATABASE_URL`

[← ChromaDB](chromadb.md) | [Next: Docker →](docker.md)
