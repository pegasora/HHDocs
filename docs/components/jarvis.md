# Jarvis (Next.js Application)

> **The main Jarvis frontend application**

## Overview

Jarvis is built with **Next.js 15.5.4** using the App Router architecture with React 19 and TypeScript.

## Architecture

- **Framework**: Next.js 15 (App Router)
- **Runtime**: React 19 Server Components
- **Port**: 8501
- **Hot Reload**: Turbopack (fast refresh)

## Directory Structure

```
jarvis/
├── app/              # Next.js App Router
├── components/       # React components
├── mastra/          # Agent framework
├── lib/             # Utilities
├── hooks/           # React hooks
└── package.json     # Dependencies
```

## Key Features

1. **Server Components** - Improved performance
2. **API Routes** - Backend endpoints
3. **Streaming Responses** - Real-time updates
4. **TypeScript** - Full type safety
5. **Tailwind CSS** - Utility-first styling

## Development

```bash
cd jarvis
npm install
npm run dev  # Start at http://localhost:8501
```

[← Components](mastra.md) | [Next: Mastra →](mastra.md)
