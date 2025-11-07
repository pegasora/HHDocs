# Jarvis AI Assistant Documentation

> **Comprehensive documentation for the Jarvis AI Assistant platform at H&H Molds Inc.**

![Version](https://img.shields.io/badge/version-0.1.8-blue)
![Status](https://img.shields.io/badge/status-production-green)
![License](https://img.shields.io/badge/license-Apache%202.0-orange)

---

## Welcome! 👋

Welcome to the official documentation for **Jarvis AI Assistant** - a self-hosted, privacy-first AI platform built specifically for H&H Molds Inc. to assist with injection molding operations.

This documentation is designed for **two audiences**:

### 👤 **For Users**
If you're a technician, operator, engineer, or manager looking to use Jarvis for daily operations, start here:
- **[Getting Started](user/getting-started.md)** - Quick introduction and first steps
- **[Accessing Jarvis](user/accessing-jarvis.md)** - How to log in and access the system
- **[Using Jarvis](user/using-jarvis.md)** - Complete usage guide

### 💻 **For Developers**
If you're maintaining, extending, or contributing to the Jarvis platform, start here:
- **[Architecture Overview](developer/architecture.md)** - System design and components
- **[Quick Start](developer/quick-start.md)** - Get up and running in 10 minutes
- **[Development Workflow](developer/workflow.md)** - Best practices for development

---

## What is Jarvis?

**Jarvis** is a self-hosted AI assistant that combines:

✅ **Local LLMs** via Ollama (complete data privacy)  
✅ **RAG Document Search** with ChromaDB vector database  
✅ **Intelligent Agents** powered by Mastra framework  
✅ **Modern Chat UI** built with Next.js 15 and assistant-ui  
✅ **Persistent Conversations** using Supabase PostgreSQL  
✅ **Production-Ready Infrastructure** with Docker orchestration

### Key Features

- 🤖 **Autonomous AI Agents** with tool-calling capabilities
- 📚 **Semantic Document Search** across 900+ knowledge base chunks
- 💬 **Full Chat History** with threading and session management
- 🔐 **User Authentication** and role-based access
- 📊 **Usage Analytics** and performance monitoring
- 🌐 **Multi-Tool Integration** (weather, files, calculations, and more)

---

## Quick Links

### 🚀 Getting Started
- [User Quick Start](user/getting-started.md)
- [Developer Quick Start](developer/quick-start.md)
- [Installation Guide](guides/installation.md)

### 📖 Documentation Sections
- [User Documentation](user/getting-started.md) - End-user guides
- [Developer Documentation](developer/architecture.md) - Technical documentation
- [Components](components/jarvis.md) - Individual component docs
- [Guides](guides/installation.md) - Step-by-step tutorials
- [References](references/glossary.md) - Additional resources

### 🔗 External Resources
- [GitHub Repository](https://github.com/pegasora/local-ai)
- [Mastra Documentation](https://mastra.ai/docs)
- [assistant-ui Documentation](https://www.assistant-ui.com/docs)
- [Ollama Documentation](https://ollama.com/docs)

---

## How to Use This Documentation

This documentation site is built with [Docsify](https://docsify.js.org/), a lightweight documentation generator.

### Navigation
- **Sidebar** (left): Browse all documentation pages
- **Search** (top): Search for specific topics or keywords
- **Anchors**: Click headers to get direct links to sections

### Running Locally
To preview this documentation locally:

```bash
# Install docsify CLI globally
npm install -g docsify-cli

# Serve the docs
docsify serve docs

# Open http://localhost:3000
```

### Editing Documentation
All documentation is written in Markdown (.md files). To contribute:

1. Edit the relevant `.md` file in the `docs/` folder
2. Preview changes locally with `docsify serve docs`
3. Submit changes via pull request

See [Contributing Guide](references/contributing.md) for details.

---

## Documentation Structure

```
docs/
├── index.html              # Docsify configuration
├── _sidebar.md             # Sidebar navigation
├── README.md               # This file
├── about.md                # Project overview
│
├── user/                   # User documentation
│   ├── getting-started.md
│   ├── accessing-jarvis.md
│   ├── using-jarvis.md
│   ├── chat-interface.md
│   ├── rag-search.md
│   ├── tips.md
│   └── faq.md
│
├── developer/              # Developer documentation
│   ├── architecture.md
│   ├── quick-start.md
│   ├── project-structure.md
│   ├── tech-stack.md
│   ├── workflow.md
│   ├── agents-tools.md
│   ├── api-reference.md
│   ├── database.md
│   ├── adding-features.md
│   ├── testing.md
│   └── deployment.md
│
├── components/             # Component-specific docs
│   ├── jarvis.md
│   ├── mastra.md
│   ├── ollama.md
│   ├── chromadb.md
│   ├── supabase.md
│   ├── langfuse.md
│   ├── n8n.md
│   └── docker.md
│
├── guides/                 # Step-by-step guides
│   ├── installation.md
│   ├── environment-setup.md
│   ├── ingestion.md
│   ├── creating-agents.md
│   ├── creating-tools.md
│   ├── memory-threads.md
│   ├── troubleshooting.md
│   └── upgrading.md
│
└── references/             # Additional resources
    ├── glossary.md
    ├── external-links.md
    ├── changelog.md
    ├── roadmap.md
    └── contributing.md
```

---

## Support & Contact

### Getting Help
- **Issues**: [GitHub Issues](https://github.com/pegasora/local-ai/issues)
- **Discussions**: [GitHub Discussions](https://github.com/pegasora/local-ai/discussions)
- **Email**: dburgess@uidaho.edu

### Team
- **Developer**: Dawson Burgess
- **Organization**: H&H Molds Inc.
- **Location**: Lewiston, Idaho

---

## License

This project is licensed under the **Apache License 2.0**.

Built with ❤️ for H&H Molds Inc.

**Version**: 0.1.8  
**Last Updated**: November 7, 2025
