# Agents & Tools Development

> **How to create and modify agents and tools**

## Creating an Agent

### 1. Create Agent File

```typescript
// mastra/agents/myAgent.ts
import { Agent } from "@mastra/core";
import { ollama } from "ollama-ai-provider-v2";
import { Memory } from "@mastra/memory";
import { PostgresStore } from "@mastra/pg";

export const myAgent = new Agent({
  name: "my-agent",
  instructions: `
    You are a helpful assistant that...
    [Define behavior here]
  `,
  model: ollama("qwen3:14b"),
  tools: { 
    // Add tools here
  },
  memory: new Memory({
    storage: new PostgresStore({
      connectionString: process.env.DATABASE_URL,
    }),
    options: {
      lastMessages: 15,
    },
  }),
});
```

### 2. Register Agent

```typescript
// mastra/index.ts
import { myAgent } from "./agents/myAgent";

export const mastra = new Mastra({
  agents: { myAgent },
  // ...
});
```

## Creating a Tool

### 1. Define Tool

```typescript
// mastra/tools/my-tool.ts
import { createTool } from "@mastra/core/tools";
import { z } from "zod";

export const myTool = createTool({
  id: "myTool",
  description: "What this tool does",
  inputSchema: z.object({
    param1: z.string().describe("Description"),
    param2: z.number().optional(),
  }),
  outputSchema: z.object({
    result: z.string(),
    status: z.enum(["success", "error"]),
  }),
  execute: async ({ context }) => {
    const { param1, param2 } = context;
    
    try {
      // Tool logic here
      return {
        result: "Success",
        status: "success",
      };
    } catch (error) {
      return {
        result: error.message,
        status: "error",
      };
    }
  },
});
```

### 2. Add to Agent

```typescript
import { myTool } from "../tools/my-tool";

export const myAgent = new Agent({
  //...
  tools: { myTool, ...otherTools },
});
```

[← Workflow](workflow.md) | [Next: API Reference →](api-reference.md)
