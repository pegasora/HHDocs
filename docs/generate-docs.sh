#!/bin/bash
#
# Documentation Generator for Jarvis AI Assistant
# This script generates comprehensive documentation from templates
#

set -e

DOCS_DIR="/home/intern/local-ai/docs"
cd "$DOCS_DIR"

echo "🚀 Generating Jarvis documentation..."

# Create directory structure
mkdir -p user developer components guides references

echo "✅ Directory structure created"

# Generate files (content will be added in subsequent commands)
touch user/{accessing-jarvis,using-jarvis,chat-interface,rag-search,tips,faq}.md
touch developer/{architecture,quick-start,project-structure,tech-stack,workflow,agents-tools,api-reference,database,adding-features,testing,deployment}.md  
touch components/{jarvis,mastra,ollama,chromadb,supabase,langfuse,n8n,docker}.md
touch guides/{installation,environment-setup,ingestion,creating-agents,creating-tools,memory-threads,troubleshooting,upgrading}.md
touch references/{glossary,external-links,changelog,roadmap,contributing}.md

echo "✅ Documentation files created"
echo "📝 Total files created: $(find user developer components guides references -type f | wc -l)"
echo ""
echo "Next steps:"
echo "1. Review _sidebar.md for navigation"
echo "2. Edit individual .md files with content"
echo "3. Run: docsify serve docs"
echo "4. Open: http://localhost:3000"

