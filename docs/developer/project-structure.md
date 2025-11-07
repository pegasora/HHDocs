# Project Structure

> **Complete codebase organization and file layout**

## Repository Root

```
local-ai/
├── jarvis/                 # Main Next.js application
├── old_models/             # Legacy implementations (archived)
├── docs/                   # This documentation
├── docker-compose.yml      # Service orchestration
├── start_services.py       # Service startup script
├── .env.example           # Environment template
├── AGENTS.md              # Agent development guide
├── README.md              # Project overview
└── CHANGELOG.md           # Version history
```

## Jarvis Application Structure

```
jarvis/
├── app/                    # Next.js 15 App Router
│   ├── (auth)/            # Public routes
│   │   └── login/         # Login page
│   ├── (protected)/       # Authenticated routes
│   │   ├── page.tsx       # Main chat page
│   │   ├── assistant.tsx  # Chat UI component
│   │   └── usage/         # Analytics dashboard
│   ├── api/               # API routes
│   │   ├── chat/          # Agent endpoint
│   │   ├── threads/       # Thread management
│   │   └── auth/          # User management
│   ├── layout.tsx         # Root layout
│   └── globals.css        # Global styles
│
├── components/            # React components
│   ├── assistant-ui/     # Chat UI components
│   │   ├── thread.tsx    # Message display
│   │   └── thread-list.tsx
│   └── ui/               # shadcn/ui components
│
├── mastra/               # Agent framework
│   ├── agents/           # Agent definitions
│   │   └── testAgent.ts  # Primary agent
│   ├── tools/            # Tool implementations
│   │   ├── weather-tool.ts
│   │   ├── rag-tool.ts
│   │   ├── listDocuments-tool.ts
│   │   └── getContents-tool.ts
│   └── index.ts          # Mastra config
│
├── lib/                  # Utilities
│   ├── auth.ts          # Auth helpers
│   └── utils.ts         # General utilities
│
├── hooks/               # React hooks
│   ├── use-auth.ts
│   └── use-threads-context.tsx
│
├── package.json         # Dependencies
├── tsconfig.json        # TypeScript config
└── next.config.ts       # Next.js config
```

[← Quick Start](quick-start.md) | [Next: Tech Stack →](tech-stack.md)
