# Installation Guide

> **Complete installation instructions for Jarvis AI Assistant**

## System Requirements

### Minimum Requirements
- **CPU**: 4 cores (8 threads recommended)
- **RAM**: 16GB (32GB recommended)
- **Storage**: 100GB available
- **GPU**: Optional but highly recommended (8GB+ VRAM)
- **OS**: Ubuntu 22.04 LTS, macOS 12+, or Windows 11 with WSL2

### Recommended for Production
- **CPU**: AMD Ryzen 9 / Intel i9 (16+ cores)
- **RAM**: 64GB
- **Storage**: 500GB NVMe SSD + 2TB HDD
- **GPU**: NVIDIA RTX 3090 / 4090 (24GB VRAM)
- **Network**: Gigabit Ethernet

## Installation Steps

### 1. Install Dependencies

**Ubuntu/Debian**:
```bash
sudo apt update
sudo apt install -y git python3.12 python3-pip nodejs npm docker.io docker-compose
```

**macOS**:
```bash
brew install git python@3.12 node docker docker-compose
```

### 2. Clone Repository

```bash
git clone https://github.com/pegasora/local-ai.git
cd local-ai
```

### 3. Configure Environment

```bash
cp .env.example .env
# Edit .env with your values
nano .env
```

### 4. Start Services

```bash
# CPU only
python start_services.py --profile cpu

# NVIDIA GPU
python start_services.py --profile gpu-nvidia
```

### 5. Install Jarvis

```bash
cd jarvis
npm install
# Configure .env.local
npm run build
npm run start
```

### 6. Access Application

Open http://localhost:8501

[See Full Guide](environment-setup.md) →
