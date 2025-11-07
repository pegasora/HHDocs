# Environment Setup

> **Detailed environment configuration guide**

## Required Environment Variables

### Supabase

```bash
POSTGRES_PASSWORD=<secure-password>
JWT_SECRET=<random-32-char-string>
ANON_KEY=<supabase-anon-key>
SERVICE_ROLE_KEY=<supabase-service-key>
DASHBOARD_USERNAME=admin
DASHBOARD_PASSWORD=<secure-password>
POOLER_TENANT_ID=<random-string>
```

### n8n

```bash
N8N_ENCRYPTION_KEY=<random-32-char-string>
N8N_USER_MANAGEMENT_JWT_SECRET=<random-32-char-string>
```

### Langfuse

```bash
CLICKHOUSE_PASSWORD=<secure-password>
MINIO_ROOT_PASSWORD=<secure-password>
LANGFUSE_SALT=<random-32-char-string>
NEXTAUTH_SECRET=<random-32-char-string>
ENCRYPTION_KEY=<random-32-char-string>
```

### Jarvis (.env.local)

```bash
DATABASE_URL=postgresql://postgres:password@localhost:6543/postgres
SUPABASE_URL=http://localhost:8000
SUPABASE_ANON_KEY=<your-anon-key>
CHROMADB_URL=http://10.0.0.76:9999
OLLAMA_BASE_URL=http://localhost:11434
```

## Generating Secrets

```bash
# Generate random string
openssl rand -base64 32

# Or use
uuidgen
```

[← Installation](installation.md) | [Next: Ingestion →](ingestion.md)
