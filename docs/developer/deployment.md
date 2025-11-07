# Deployment Guide

> **Production deployment instructions**

## Production Checklist

- [ ] All environment variables configured
- [ ] SSL/TLS certificates ready (if public)
- [ ] Firewall rules configured
- [ ] Backup strategy in place
- [ ] Monitoring configured
- [ ] Documentation updated

## Deployment Steps

### 1. Prepare Environment

```bash
# Clone repository
git clone https://github.com/pegasora/local-ai.git
cd local-ai

# Configure environment
cp .env.example .env
# Edit .env with production values
```

### 2. Build Production Assets

```bash
cd jarvis
npm install
npm run build
```

### 3. Start Services

```bash
# Production mode
python start_services.py --profile gpu-nvidia --environment public
```

### 4. Configure Reverse Proxy (Optional)

For HTTPS access:

```nginx
# Caddy config
jarvis.yourdomain.com {
    reverse_proxy localhost:8501
}
```

### 5. Enable Monitoring

- Configure Langfuse for observability
- Set up health checks
- Enable error tracking

## Maintenance

### Updates

```bash
# Pull latest code
git pull origin main

# Rebuild
cd jarvis && npm install && npm run build

# Restart
docker compose -p localai restart jarvis
```

### Backups

```bash
# Backup database
docker exec supabase-db pg_dump -U postgres > backup.sql

# Backup ChromaDB
tar -czf chromadb-backup.tar.gz /tank/chromadb
```

[← Testing](testing.md) | [Back to Developer Docs](architecture.md)
