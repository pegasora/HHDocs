# Using Jarvis

> **Complete guide to using Jarvis AI Assistant effectively**

---

## Table of Contents

1. [Interface Overview](#interface-overview)
2. [Basic Usage](#basic-usage)
3. [Advanced Features](#advanced-features)
4. [Chat Management](#chat-management)
5. [Understanding Responses](#understanding-responses)
6. [Best Practices](#best-practices)

---

## Interface Overview

### Main Components

When you first open Jarvis, you'll see three main areas:

```
┌─────────────────────────────────────────────────────────────┐
│  [Sidebar]  │           Main Chat Area                      │
│             │                                               │
│  Threads    │  ┌─────────────────────────────────────┐     │
│  List       │  │  Previous Messages                  │     │
│             │  │                                     │     │
│  • Thread 1 │  │  User: How do I fix flash?         │     │
│  • Thread 2 │  │  Jarvis: Flash defects are...      │     │
│  • Thread 3 │  │                                     │     │
│             │  └─────────────────────────────────────┘     │
│             │                                               │
│  [New Chat] │  ┌─────────────────────────────────────┐     │
│             │  │  Your question...              [Send]│     │
│             │  └─────────────────────────────────────┘     │
└─────────────────────────────────────────────────────────────┘
```

### Sidebar Elements

**User Profile** (top)
- Your name
- Logout button

**Thread List** (middle)
- All your previous conversations
- Click to switch threads
- Recent conversations first

**Actions** (bottom)
- **New Chat** button - Start fresh conversation
- Thread options (rename, delete)

### Main Chat Area

**Message History**
- Scrollable conversation history
- User messages (right/blue)
- Jarvis responses (left/gray)
- Tool execution indicators

**Input Composer**
- Text input field
- Send button (or press Enter)
- Character counter (coming soon)
- File attachment (coming soon)

---

## Basic Usage

### Asking Questions

Simply type your question and press Enter or click Send.

**Examples**:

```
What causes short shots in injection molding?

Show me the quality control procedures

How do I reduce cycle time on Part #5678?

What's the recommended temperature for ABS plastic?
```

### Question Types Jarvis Handles

#### 1. **Knowledge Base Questions**
Questions about H&H documentation and procedures.

**Example**:
```
User: What is the mold maintenance schedule?
Jarvis: According to the maintenance guide, molds should be 
inspected every 50,000 shots for wear and cleaned monthly...
[Source: mold-maintenance.pdf]
```

#### 2. **Technical Questions**
Injection molding theory, defects, troubleshooting.

**Example**:
```
User: Why am I getting sink marks?
Jarvis: Sink marks typically occur due to:
1. Insufficient packing pressure
2. Inadequate cooling time
3. Thick wall sections...
[Sources: defect-guide.pdf, troubleshooting.md]
```

#### 3. **Procedural Questions**
Step-by-step instructions for tasks.

**Example**:
```
User: How do I change the oil on Press 20?
Jarvis: Here's the oil change procedure for Press 20:
1. Power down the press and lock out
2. Allow hydraulic system to cool (30 min)
3. Drain old oil from reservoir...
[Source: press20-maintenance.pdf]
```

#### 4. **Reference Lookups**
Quick facts, formulas, specifications.

**Example**:
```
User: What's the clamp force formula?
Jarvis: Clamp Force (tons) = Projected Area (in²) × 
Injection Pressure (psi) ÷ 2000
[Source: engineering-reference.pdf]
```

---

## Advanced Features

### Using RAG Search

**What is RAG?**
Retrieval-Augmented Generation - Jarvis searches your documents and uses them to answer.

**How it works**:
1. You ask a question
2. Jarvis searches 900+ document chunks
3. Finds most relevant content
4. Synthesizes answer with sources

**When RAG is used**:
- Questions about H&H documentation
- Procedural questions
- Technical references
- Policy questions

**RAG Response Format**:
```
[Jarvis searches documents...]

Answer: [Comprehensive response based on retrieved content]

Sources:
- document-name.pdf (page 5)
- procedure-guide.md (section 3)
```

### Viewing Sources

When Jarvis cites sources, you can:
1. **Ask for more details**: "Show me more from that document"
2. **Request full document**: "Get the full contents of mold-maintenance.pdf"
3. **Ask follow-ups**: "What else does it say about cleaning?"

### Multi-Turn Conversations

Jarvis remembers your conversation context.

**Example**:
```
User: What causes flash defects?
Jarvis: Flash occurs when material escapes from the mold cavity...

User: How do I fix it?
Jarvis: [Remembers we're talking about flash] To fix flash defects:
1. Increase clamp force...

User: What about sink marks?
Jarvis: [New topic] Sink marks are different from flash. They occur when...
```

### Asking for Lists

Request structured information:

```
User: List all documents about quality control
Jarvis: Here are the quality control documents:
1. quality-procedures.pdf
2. inspection-checklist.md
3. QC-standards.pdf
...
```

### Requesting Specific Formats

Ask for information in different formats:

```
User: Give me a step-by-step guide for mold cleaning
Jarvis: **Mold Cleaning Procedure**
Step 1: Prepare workspace and tools...
Step 2: Remove mold from press...

User: Summarize the safety procedures in bullet points
Jarvis: **Safety Procedures Summary**
• Always wear PPE
• Lock out equipment before maintenance...
```

---

## Chat Management

### Creating New Chats

**When to create a new chat**:
- Starting a completely different topic
- Want a fresh context (Jarvis forgets previous conversation)
- Organizing conversations by project/part

**How**:
1. Click "New Chat" button in sidebar
2. Jarvis creates a new thread
3. Previous chat is saved automatically

### Switching Between Chats

**How**:
1. Click any chat in the sidebar
2. Jarvis loads that conversation
3. Continue where you left off

**Tip**: Recent chats appear at the top

### Renaming Chats

Give chats descriptive names:

**How**:
1. Hover over chat in sidebar
2. Click edit icon (pencil)
3. Type new name: "Part 5678 Troubleshooting"
4. Press Enter

**Auto-naming**: Jarvis will auto-generate titles based on first message

### Deleting Chats

Remove old or irrelevant conversations:

**How**:
1. Hover over chat in sidebar
2. Click delete icon (trash)
3. Confirm deletion

**Warning**: Deleted chats cannot be recovered!

### Organizing Conversations

**Best Practices**:
- ✅ One chat per part/project
- ✅ Rename for easy finding
- ✅ Delete test chats regularly
- ✅ Keep important chats pinned (coming soon)

---

## Understanding Responses

### Response Structure

Typical Jarvis response format:

```
[Optional: Tool execution indicator]
"Searching documents for 'flash defects'..."

[Main Answer]
Detailed response to your question based on retrieved context.

[Sources (when applicable)]
Sources:
- defect-guide.pdf
- troubleshooting-manual.md

[Follow-up suggestions (optional)]
You might also want to ask about: ...
```

### Reading Tool Indicators

When Jarvis uses tools, you'll see indicators:

**Document Search**:
```
🔍 Searching knowledge base for "mold maintenance"...
```

**File Access**:
```
📄 Retrieving contents of "quality-procedures.pdf"...
```

**Weather (example)**:
```
🌤️ Fetching weather for Lewiston, ID...
```

### Interpreting Sources

Sources tell you where information came from:

**Format**:
```
Sources:
- [filename.ext] - Document name
```

**What to do**:
- ✅ Trust sourced answers (verified from docs)
- ⚠️ Be cautious with unsourced answers (general knowledge)
- ❓ Ask for sources if not provided: "Where did you find that?"

### When Jarvis Doesn't Know

Jarvis will honestly say when it doesn't have information:

```
User: What's the winning lottery numbers?
Jarvis: I don't have access to lottery information. I'm specialized 
in injection molding operations for H&H Molds.
```

**If Jarvis can't find information**:
1. Rephrase your question
2. Be more specific
3. Ask if the document exists: "Do you have docs about X?"
4. Contact support if document is missing

---

## Best Practices

### Writing Effective Questions

#### ✅ DO:

**Be Specific**:
```
❌ "Fix defects"
✅ "How do I fix sink marks on Part #5678?"
```

**Provide Context**:
```
❌ "Temperature too high"
✅ "Part #5678 is showing burn marks. Current barrel temp is 450°F. Is this too high for ABS?"
```

**Use Proper Terminology**:
```
❌ "Plastic holes"
✅ "Sink marks" or "Voids"
```

**Ask Follow-ups**:
```
✅ "Can you explain step 3 in more detail?"
✅ "What if that doesn't work?"
✅ "Are there any alternatives?"
```

#### ❌ DON'T:

**Don't be vague**:
```
❌ "Problems"
❌ "It's broken"
❌ "Help"
```

**Don't ask multiple unrelated questions at once**:
```
❌ "What causes flash and how do I maintain molds and what's the cycle time for ABS?"
✅ Ask one at a time
```

**Don't expect real-time data** (yet):
```
❌ "What's Press 20 doing right now?"
❌ "Show me live production data"
```

### Getting Better Answers

**Technique 1: Progressive Refinement**
```
User: Tell me about flash defects
Jarvis: [General information]

User: Specifically for thin-wall parts under 0.5mm
Jarvis: [More targeted information]

User: On Part #5678
Jarvis: [Most specific guidance]
```

**Technique 2: Ask for Clarification**
```
User: What's a reasonable cycle time?
Jarvis: Cycle time varies by part...

User: For a 50g ABS part with 2mm wall thickness
Jarvis: For those parameters, expect 20-25 seconds...
```

**Technique 3: Request Examples**
```
User: How do I document a defect?
Jarvis: [Explanation]

User: Can you show me an example?
Jarvis: [Example defect report]
```

### Common Patterns

**Troubleshooting Pattern**:
```
1. "I'm seeing [defect] on [part]"
2. "What are the possible causes?"
3. "How do I check for [specific cause]?"
4. "How do I fix [specific cause]?"
```

**Learning Pattern**:
```
1. "Explain [concept]"
2. "Can you give an example?"
3. "How does this apply to [specific situation]?"
4. "What are best practices for [concept]?"
```

**Document Discovery Pattern**:
```
1. "What documents do you have about [topic]?"
2. "Show me [specific document]"
3. "Summarize [document]"
4. "Find information about [specific detail] in [document]"
```

---

## Tips for Power Users

### Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| **Enter** | Send message |
| **Shift+Enter** | New line in message |
| **Ctrl+K** | Focus search (coming soon) |
| **Ctrl+N** | New chat (coming soon) |

### Saving Useful Responses

**Method 1: Copy-Paste**
1. Select Jarvis response text
2. Copy (Ctrl+C / Cmd+C)
3. Paste into your notes

**Method 2: Bookmark Chats**
- Rename chat with descriptive name
- Keep in sidebar for easy reference
- Return anytime to review

**Method 3: Take Screenshots**
- Use browser screenshot tool
- Capture useful procedures
- Share with team members

### Sharing with Team

**How to share Jarvis answers**:
1. Copy the response text
2. Include the sources
3. Share via email/Slack
4. Credit: "According to Jarvis (source: [doc])"

**What NOT to share**:
- ❌ Login credentials
- ❌ Sensitive customer data
- ❌ Unverified information (without sources)

---

## Troubleshooting Usage Issues

### Issue: Jarvis Gives Wrong Information

**What to do**:
1. Ask for sources: "Where did you find that?"
2. Cross-reference with original documents
3. Report incorrect info to support
4. Rephrase and ask again

### Issue: Response Too Long/Short

**Too long**:
```
User: Give me a brief summary instead
User: Just the key points please
```

**Too short**:
```
User: Can you explain in more detail?
User: What else should I know about this?
```

### Issue: Can't Find Document

**Steps**:
```
1. User: List all documents about [topic]
2. Check if document exists
3. Try different search terms
4. Contact support if missing
```

### Issue: Jarvis Seems Confused

**Reset context**:
1. Start a new chat
2. Be more specific
3. Provide more context
4. Ask simpler questions first

---

## Getting Help

### In-Chat Help

Try asking:
```
"What can you help me with?"
"How do I use RAG search?"
"Show me example questions"
```

### External Resources

- **User Guide**: This document
- **FAQ**: [Frequently Asked Questions](faq.md)
- **Tips**: [Tips & Best Practices](tips.md)
- **Support**: intern@hhmoldsinc.com

---

## What's Next?

Explore more features:

1. **[Chat Interface Details](chat-interface.md)** - Deep dive into UI
2. **[RAG Search Guide](rag-search.md)** - Master document search
3. **[Tips & Tricks](tips.md)** - Pro user techniques
4. **[FAQ](faq.md)** - Common questions answered

---

[← Accessing Jarvis](accessing-jarvis.md) | [Next: Chat Interface →](chat-interface.md)
