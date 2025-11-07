# Developer Quick Start

> **Get up and running with Jarvis development in 10 minutes**

---

## Prerequisites Checklist

✅ **Git** 2.x+  
✅ **Node.js** 18.x or 20.x LTS  
✅ **Docker** & Docker Compose  
✅ **Python** 3.12+  
✅ **Code Editor** (VS Code recommended)

---

## Quick Setup

### 1. Clone & Configure (3 min)

```bash
git clone https://github.com/pegasora/local-ai.git
cd local-ai
cp .env.example .env
# Edit .env with your values
```

### 2. Start Services (3 min)

```bash
python start_services.py --profile cpu
```

### 3. Setup Jarvis (4 min)

```bash
cd jarvis
npm install
# Create .env.local with database credentials
npm run dev
```

✅ **Done!** Open http://localhost:8501

---

See [Architecture](architecture.md) for system overview.

[← Dev Docs](architecture.md) | [Next: Project Structure →](project-structure.md)
