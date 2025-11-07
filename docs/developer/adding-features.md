# Adding Features

> **Guide to adding new features to Jarvis**

## Planning a Feature

### 1. Define Requirements
- What problem does it solve?
- Who will use it?
- What are the success criteria?

### 2. Design Approach
- Which components need changes?
- Database schema changes needed?
- New tools or agents required?

### 3. Implementation Plan
1. Backend changes (agents, tools, API)
2. Frontend changes (UI, components)
3. Testing strategy
4. Documentation updates

## Example: Adding a New Tool

### Step 1: Create Tool

```typescript
// mastra/tools/calculator-tool.ts
import { createTool } from "@mastra/core/tools";
import { z } from "zod";

export const calculatorTool = createTool({
  id: "calculatorTool",
  description: "Perform basic math calculations",
  inputSchema: z.object({
    expression: z.string().describe("Math expression to evaluate"),
  }),
  outputSchema: z.object({
    result: z.number(),
  }),
  execute: async ({ context }) => {
    const result = eval(context.expression); // Note: unsafe, use math library
    return { result };
  },
});
```

### Step 2: Add to Agent

```typescript
// mastra/agents/testAgent.ts
import { calculatorTool } from "../tools/calculator-tool";

export const testAgent = new Agent({
  // ...existing config
  tools: { 
    calculatorTool,  // Add here
    weatherTool,
    ragQueryTool,
    // ...other tools
  },
});
```

### Step 3: Update Instructions

```typescript
instructions: `
  You are Jarvis...
  
  Use calculatorTool when users ask math questions.
  
  Available tools:
  - calculatorTool: Perform calculations
  - ragQueryTool: Search documents
  ...
`,
```

### Step 4: Test

```bash
# Restart server
npm run dev

# Test in UI
User: "What's 2 + 2?"
Jarvis: [Uses calculatorTool] The result is 4.
```

### Step 5: Document

Update relevant docs:
- `/docs/developer/agents-tools.md` - Add tool documentation
- `/docs/references/changelog.md` - Note the addition
- Update `AGENTS.md` if significant

[← Database](database.md) | [Next: Testing →](testing.md)
