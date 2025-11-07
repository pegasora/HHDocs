# API Reference

> **Complete API endpoint documentation**

## Chat Endpoint

### POST /api/chat

Stream agent responses.

**Request**:
```typescript
{
  messages: Message[],
  threadId?: string,
  resourceId?: string
}
```

**Response**: Server-Sent Events (SSE)

**Example**:
```typescript
const response = await fetch('/api/chat', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    messages: [
      { role: 'user', content: 'Hello' }
    ],
    threadId: 'thread-123',
    resourceId: 'user-456'
  })
});
```

## Thread Endpoints

### GET /api/threads

Fetch user's threads.

**Query**: `?resourceId={userId}`

**Response**:
```typescript
{
  threads: Thread[]
}
```

### POST /api/threads

Create new thread.

**Request**:
```typescript
{
  resourceId: string,
  title?: string
}
```

### GET /api/threads/history

Get thread messages.

**Query**: `?threadId={threadId}`

**Response**:
```typescript
{
  uiMessages: UIMessage[]
}
```

[← Agents & Tools](agents-tools.md) | [Next: Database →](database.md)
