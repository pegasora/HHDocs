# About Jarvis AI Assistant

> **A comprehensive AI platform for injection molding operations at H&H Molds Inc.**

---

## Project Overview

The **Jarvis AI Assistant** project is a self-hosted, enterprise-grade AI platform designed specifically for H&H Molds Inc. to modernize and streamline injection molding operations through intelligent automation and knowledge management.

### Mission Statement

To provide H&H Molds Inc. with a **secure, local, and intelligent AI assistant** that:
- ✅ Preserves complete data privacy (100% self-hosted)
- ✅ Empowers technicians with instant access to knowledge
- ✅ Automates complex data analysis and reporting
- ✅ Reduces downtime through intelligent troubleshooting
- ✅ Maintains a comprehensive operational knowledge base

---

## Project History

### Origins (May 2025)
The project began as a summer internship initiative to explore how local AI could benefit manufacturing operations without compromising sensitive data.

**Initial Goals:**
- Set up self-hosted LLM infrastructure
- Build basic document retrieval system
- Prove feasibility of local AI for manufacturing

### Evolution (June - August 2025)
Rapid development and deployment phases:
- **June 2025**: Infrastructure setup (Ollama, Supabase, ChromaDB)
- **July 2025**: First production deployment with Python/Streamlit
- **August 2025**: Advanced features (voice control, logging, analytics)

### Modernization (September - October 2025)
Major architectural overhaul:
- **September 2025**: Migration from Streamlit to Next.js
- **October 2025**: ChatGPT-style UI redesign for better UX
- **November 2025**: Complete rewrite with Mastra framework

### Current State (November 2025)
- ✅ **Production-Ready**: Running 24/7 at H&H facility
- ✅ **Modern Stack**: Next.js 15, React 19, Mastra framework
- ✅ **Full Feature Set**: RAG, agents, tools, persistent chat
- ✅ **Scalable**: Designed for easy expansion and maintenance

---

## Technology Philosophy

### Why Self-Hosted?

**Data Privacy**: H&H Molds processes sensitive customer and proprietary data. Self-hosting ensures:
- ❌ No data leaves the facility
- ❌ No external API calls
- ❌ No cloud vendor lock-in
- ✅ Complete control over all data

**Cost Efficiency**: Commercial AI APIs charge per token:
- OpenAI: ~$0.01 per 1K tokens
- Anthropic Claude: ~$0.015 per 1K tokens
- **Local**: $0 per token after initial hardware investment

**Customization**: Full control to:
- Fine-tune models on proprietary data
- Customize agents for specific workflows
- Integrate with internal systems
- Deploy on existing infrastructure

### Why Open Source?

**Transparency**: Every component is open source:
- Ollama (LLM runtime)
- ChromaDB (vector database)
- Supabase (backend)
- Mastra (agent framework)
- Next.js (frontend)

**Community Support**: Benefit from:
- Active development communities
- Regular security updates
- Extensive documentation
- Community plugins and extensions

**Future-Proof**: Avoid vendor lock-in:
- No proprietary formats
- Standard protocols (PostgreSQL, HTTP, OpenAPI)
- Portable to any infrastructure
- Easy to migrate or extend

---

## System Capabilities

### Current Features

#### 🤖 **Intelligent Agents**
- Autonomous decision-making with tool calling
- Multi-step reasoning and planning
- Context-aware responses
- Automatic tool selection and chaining

#### 📚 **RAG Document Search**
- Semantic search across 900+ document chunks
- Support for PDFs, Word docs, text files, markdown
- Automatic document ingestion and processing
- Metadata filtering and source attribution

#### 💬 **Persistent Chat**
- Full conversation history
- Thread-based organization
- Session management
- User-specific chat storage

#### 🔐 **Authentication & Security**
- Supabase-based user management
- Role-based access control
- Secure session handling
- Audit logging

#### 📊 **Analytics & Monitoring**
- Usage tracking per user
- Performance metrics
- Error reporting
- Langfuse observability integration

### Planned Features

See [Future Roadmap](references/roadmap.md) for detailed plans.

**Short-term (Q1 2026)**:
- [ ] Press20 machine data integration
- [ ] Advanced analytics agent
- [ ] Real-time monitoring dashboards
- [ ] Mobile-responsive interface improvements

**Medium-term (Q2-Q3 2026)**:
- [ ] Voice input/output support
- [ ] Multi-language support
- [ ] Advanced defect prediction models
- [ ] Integration with ERP systems

**Long-term (2027+)**:
- [ ] Computer vision for quality inspection
- [ ] Predictive maintenance agents
- [ ] Process optimization AI
- [ ] Multi-facility deployment

---

## Architecture Principles

### Design Philosophy

**1. Modularity**
- Each component is independently deployable
- Clear separation of concerns
- Easy to swap or upgrade components

**2. Scalability**
- Horizontal scaling via Docker Compose
- Stateless frontend for load balancing
- Database connection pooling
- Efficient caching strategies

**3. Maintainability**
- Comprehensive documentation
- TypeScript for type safety
- Clear code organization
- Automated testing (in progress)

**4. Performance**
- Local LLM inference (no network latency)
- Vector search optimization
- Efficient context window management
- Response streaming for perceived speed

### Technical Stack Overview

| Layer | Technology | Purpose |
|-------|------------|---------|
| **Frontend** | Next.js 15 + React 19 | Modern, performant web UI |
| **UI Framework** | assistant-ui | Pre-built chat components |
| **Styling** | Tailwind CSS 4 | Utility-first CSS framework |
| **Agent Framework** | Mastra 0.23.3 | Agent orchestration & tools |
| **LLM Runtime** | Ollama | Local model inference |
| **Models** | qwen3:14b | Chat completion model |
| **Embeddings** | nomic-embed-text | 768-dim vector embeddings |
| **Vector DB** | ChromaDB 3.0.0 | Semantic search |
| **Database** | PostgreSQL (Supabase) | Relational data storage |
| **Auth** | Supabase Auth | User authentication |
| **Observability** | Langfuse | Tracing & analytics |
| **Orchestration** | Docker Compose | Container management |

---

## Team & Contributors

### Core Team

**Dawson Burgess**
- Role: Lead Developer & Architect
- Email: dburgess@uidaho.edu / intern@hhmoldsinc.com
- Responsibilities: System design, development, deployment, documentation

**H&H Molds Inc.**
- Organization: Manufacturing facility
- Location: Lewiston, Idaho
- Industry: Injection molding and mold-making

### Contributors

This project builds upon excellent work from the open-source community:
- [n8n.io](https://n8n.io) - Workflow automation foundation
- [Cole Medin](https://github.com/coleam00) - Local AI infrastructure guidance
- [Mastra Team](https://mastra.ai) - Agent framework
- [assistant-ui Team](https://www.assistant-ui.com) - Chat UI components
- [Ollama Team](https://ollama.com) - Local LLM runtime
- [Supabase Team](https://supabase.com) - Backend infrastructure
- [ChromaDB Team](https://www.trychroma.com) - Vector database

---

## Code Repository

### Primary Repository
**URL**: https://github.com/pegasora/local-ai

**Note**: This is a **private** repository accessible only to authorized H&H Molds personnel.

**Access**: Contact Gary or Dawson for repository access.

### Documentation Repository
**URL**: https://github.com/pegasora/HHDocs

**Live Docs**: https://pegasora.github.io/HHDocs/

This documentation is maintained separately for public reference and community contribution.

---

## Infrastructure & Deployment

### Current Deployment

**Location**: H&H Molds Inc. facility, Lewiston, ID

**Hardware**:
- **Workstation**: Ubuntu Server 22.04 LTS
- **CPU**: AMD Ryzen 9 5950X (16-core, 32-thread)
- **GPU**: NVIDIA RTX 3090 (24GB VRAM)
- **RAM**: 64GB DDR4
- **Storage**: 
  - 1TB NVMe SSD (system + containers)
  - 4TB HDD (/tank mount for data)

**Network**:
- **Access**: H&H Secure / H&H Quality WiFi
- **Remote**: Tailscale VPN for off-site access
- **Ports**: 8501 (Jarvis), 5678 (n8n), 8000 (Supabase)

### Performance Metrics

**Current Benchmarks** (as of November 2025):
- **Query Response Time**: 3-15 seconds (depending on complexity)
- **Uptime**: >99.5% (planned maintenance excluded)
- **Concurrent Users**: Supports 10+ simultaneous users
- **Document Search**: <1 second for 900+ chunks
- **Model Inference**: ~30 tokens/second on RTX 3090

---

## Contact & Support

### Getting Help

**For Users**:
- See [User FAQ](user/faq.md)
- Contact facility IT support
- Email: intern@hhmoldsinc.com

**For Developers**:
- See [Troubleshooting Guide](guides/troubleshooting.md)
- GitHub Issues: https://github.com/pegasora/local-ai/issues
- Email: dburgess@uidaho.edu

### Company Contact

**H&H Molds Inc.**
- **Website**: https://hhmoldsinc.com
- **Quality**: quality@hhmoldsinc.com
- **Management**: garyb@hhmoldsinc.com

---

## About H&H Molds Inc.

H&H Molds is a full-service mold-making and injection molding company providing total plastics services to a growing list of industries, including:
- Electronics
- Telecommunications
- Medical & Pharmaceutical
- Sports & Recreation
- Utilities & Agricultural
- Food & Dairy

**Company Values**:
- **Innovation**: Embracing new technologies like AI
- **Quality**: Industry-leading precision and reliability
- **Customer Focus**: Tailored solutions for every client
- **Sustainability**: Efficient processes, minimal waste

H&H Molds Inc. is committed to advancing injection molding opportunities for smaller companies looking to break into the market. This AI platform represents that commitment to innovation and technological excellence.

---

## License & Attribution

### Project License
This project is licensed under the **Apache License 2.0**.

See the [LICENSE](https://github.com/pegasora/local-ai/blob/main/LICENSE) file for full details.

### Third-Party Licenses
All dependencies maintain their respective open-source licenses:
- Next.js (MIT)
- React (MIT)
- Mastra (MIT)
- Ollama (MIT)
- Supabase (Apache 2.0)
- ChromaDB (Apache 2.0)

See individual component documentation for specific license information.

---

**Version**: 0.1.8  
**Last Updated**: November 7, 2025  
**Maintained By**: Dawson Burgess & H&H Molds Inc.
