# Testing & Debugging

> **Testing strategies and debugging techniques**

## Manual Testing

### 1. Local Testing

```bash
# Start dev server
cd jarvis
npm run dev

# Open browser
open http://localhost:8501

# Test scenarios:
- Log in
- Create new chat
- Send messages
- Test tools
- Check persistence
```

### 2. API Testing

```bash
# Test chat endpoint
curl -X POST http://localhost:8501/api/chat \
  -H "Content-Type: application/json" \
  -d '{"messages":[{"role":"user","content":"Hello"}]}'

# Test threads endpoint
curl http://localhost:8501/api/threads?resourceId=user-id
```

## Debugging

### Browser DevTools

1. Open DevTools (F12)
2. Check Console for errors
3. Look for log prefixes:
   - `[ASSISTANT]` - Chat runtime
   - `[THREADS]` - Thread management
   - `[CHAT API]` - API calls

### Server Logs

```bash
# Dev server output
npm run dev
# Watch terminal for errors

# Docker logs
docker compose -p localai logs -f ollama
docker compose -p localai logs -f chroma-server
```

### Common Debug Points

```typescript
// Add logging in API route
console.log("[CHAT API] Request:", { threadId, resourceId });

// Add logging in tool
console.log("[TOOL] Executing:", context);
console.log("[TOOL] Result:", result);

// Add logging in agent
console.log("[AGENT] Tool selected:", toolName);
```

## Error Handling

### Frontend Errors

```typescript
try {
  const response = await fetch('/api/chat', {...});
  if (!response.ok) throw new Error('API Error');
} catch (error) {
  console.error('[CHAT] Error:', error);
  // Show user-friendly error
}
```

### Backend Errors

```typescript
try {
  const result = await tool.execute({ context });
  return result;
} catch (error) {
  console.error('[TOOL] Error:', error);
  return { error: error.message };
}
```

[← Adding Features](adding-features.md) | [Next: Deployment →](deployment.md)
