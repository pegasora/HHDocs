# Troubleshooting Guide

> **Solutions to common problems**

## Service Issues

### Supabase Won't Start

**Symptoms**: Containers keep restarting

**Solutions**:
1. Check .env has all required variables
2. Add POOLER_DB_POOL_SIZE=5
3. Delete volumes and restart: `docker volume rm supabase_*`
4. Check logs: `docker compose logs supabase-db`

### Ollama Not Responding

**Symptoms**: Queries timeout or fail

**Solutions**:
1. Check Ollama is running: `docker ps | grep ollama`
2. Test API: `curl http://localhost:11434/api/tags`
3. Restart: `docker restart ollama`
4. Pull models again: `docker exec -it ollama ollama pull qwen3:14b`

### ChromaDB Connection Failed

**Symptoms**: RAG queries fail

**Solutions**:
1. Test connection: `curl http://10.0.0.76:9999/api/v1/heartbeat`
2. Check CHROMADB_URL in .env.local
3. Restart ChromaDB: `docker restart chroma-server`
4. Check data volume: `ls -la /tank/chromadb`

## Application Issues

### Can't Log In

**Solutions**:
1. Verify user exists in Supabase
2. Check profiles_nxt table has matching entry
3. Clear browser cache and cookies
4. Try incognito mode
5. Check browser console for errors

### Messages Not Persisting

**Solutions**:
1. Verify DATABASE_URL is correct
2. Check mastra_threads and mastra_messages tables exist
3. Ensure threadId and resourceId are passed to API
4. Check browser console for [THREADS] logs

### Slow Responses

**Causes**:
- Multiple concurrent users
- Large context window
- Complex tool chains
- GPU memory full

**Solutions**:
1. Reduce context window (lastMessages: 10)
2. Restart Ollama to clear GPU memory
3. Check GPU usage: `nvidia-smi`
4. Consider upgrading hardware

## Development Issues

### Hot Reload Not Working

**Solutions**:
1. Restart dev server
2. Clear Next.js cache: `rm -rf .next`
3. Reinstall node_modules: `rm -rf node_modules && npm install`

### TypeScript Errors

**Solutions**:
1. Run type check: `npm run type-check`
2. Update dependencies: `npm update`
3. Check tsconfig.json settings

### Build Failures

**Solutions**:
1. Check for TypeScript errors
2. Clear build cache: `rm -rf .next`
3. Verify all dependencies installed
4. Check Node version: `node --version`

## Getting More Help

- Check [Developer Docs](../developer/architecture.md)
- See [AGENTS.md](/AGENTS.md)
- GitHub Issues: https://github.com/pegasora/local-ai/issues
- Email: dburgess@uidaho.edu

[← Guides](installation.md) | [Next: Upgrading →](upgrading.md)
