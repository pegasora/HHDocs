# Docker Setup

> **Container orchestration and management**

## Services

All components run in Docker containers orchestrated by Docker Compose.

## Container List

| Service | Port(s) | Purpose |
|---------|---------|---------|
| jarvis | 8501 | Next.js app |
| ollama | 11434 | LLM runtime |
| chroma-server | 9999 | Vector DB |
| supabase-kong | 8000 | API gateway |
| supabase-db | 5432, 6543 | PostgreSQL |
| langfuse | 3001 | Observability |
| n8n | 5678 | Workflows |

## Commands

```bash
# Start all services
python start_services.py --profile cpu

# Check status
docker compose -p localai ps

# View logs
docker compose -p localai logs -f [service]

# Restart service
docker restart [container-name]

# Stop all
docker compose -p localai down
```

## Profiles

- **cpu**: CPU-only inference
- **gpu-nvidia**: NVIDIA GPU acceleration
- **none**: No Ollama (use external)

[← Supabase](supabase.md) | [Back to Components](jarvis.md)
