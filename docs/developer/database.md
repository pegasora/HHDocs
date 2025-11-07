# Database Schema

> **Complete database structure and tables**

## Mastra Tables (Auto-Generated)

### mastra_threads

```sql
CREATE TABLE mastra_threads (
  id UUID PRIMARY KEY,
  resourceId VARCHAR(255),  -- User ID
  title VARCHAR(255),
  metadata JSONB,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP
);
```

### mastra_messages

```sql
CREATE TABLE mastra_messages (
  id UUID PRIMARY KEY,
  threadId UUID REFERENCES mastra_threads(id),
  role VARCHAR(50),  -- 'user' | 'assistant' | 'tool'
  content TEXT,
  toolCalls JSONB,
  createdAt TIMESTAMP
);
```

## Custom Tables

### profiles_nxt

```sql
CREATE TABLE profiles_nxt (
  id UUID PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
```

### feedback_nxt

```sql
CREATE TABLE feedback_nxt (
  id UUID PRIMARY KEY,
  message_id UUID,
  user_id UUID,
  rating VARCHAR(50),  -- 'positive' | 'negative'
  feedback_text TEXT,
  created_at TIMESTAMP
);
```

## Accessing Database

```bash
# Via Supabase Studio
open http://localhost:8000

# Via psql
psql $DATABASE_URL

# Via Node.js
import { createClient } from '@supabase/supabase-js';
const supabase = createClient(url, key);
```

[← API Reference](api-reference.md) | [Next: Adding Features →](adding-features.md)
