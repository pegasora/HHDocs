# Chat Interface Guide

> **Detailed guide to the Jarvis chat interface**

---

## Interface Layout

### Desktop View

```
┌───────────────────────────────────────────────────────────────┐
│ ┌─────────────┐                                               │
│ │   SIDEBAR   │            CHAT HEADER                        │
│ │             │   🤖 Jarvis AI Assistant                      │
│ │  User Info  │                                               │
│ │  ┌───────┐  │ ─────────────────────────────────────────────│
│ │  │ John  │  │                                               │
│ │  │Dawson │  │          MESSAGE HISTORY                      │
│ │  └───────┘  │                                               │
│ │  [Logout]   │   ┌──────────────────────────────────┐       │
│ │             │   │ User: How do I fix flash?        │       │
│ │  THREADS    │   └──────────────────────────────────┘       │
│ │  ┌────────┐ │                                               │
│ │  │Thread 1│ │   ┌──────────────────────────────────┐       │
│ │  │Thread 2│ │   │ 🔍 Searching documents...        │       │
│ │  │Thread 3│ │   │                                  │       │
│ │  └────────┘ │   │ Jarvis: Flash defects occur...   │       │
│ │             │   │ ...detailed answer...             │       │
│ │  [New Chat] │   │                                  │       │
│ │             │   │ Sources:                         │       │
│ │             │   │ - defect-guide.pdf               │       │
│ │             │   └──────────────────────────────────┘       │
│ │             │                                               │
│ │             │ ─────────────────────────────────────────────│
│ │             │                                               │
│ │             │          INPUT COMPOSER                       │
│ │             │   ┌──────────────────────────────────┐       │
│ │             │   │ Your question...            [Send]│       │
│ │             │   └──────────────────────────────────┘       │
└───────────────────────────────────────────────────────────────┘
```

---

## Sidebar Components

### User Profile Section

**Location**: Top of sidebar

**Elements**:
- **Avatar**: Your initials or profile picture
- **Name**: Your display name (from Supabase)
- **Logout Button**: End your session

**Actions**:
- Click **Logout** to sign out
- Profile settings (coming soon)

### Thread List

**Location**: Middle of sidebar

**What you see**:
- List of all your conversations
- Most recent at the top
- Thread title (auto-generated or custom)
- Last message timestamp

**Thread Item Structure**:
```
┌─────────────────────────┐
│ 🗨️ Part 5678 Issues    │  ← Title
│ 2 hours ago             │  ← Timestamp
└─────────────────────────┘
```

**Interactions**:
- **Click** thread to switch to it
- **Hover** to see actions:
  - ✏️ Rename
  - 🗑️ Delete

### New Chat Button

**Location**: Bottom of sidebar

**Purpose**: Start a fresh conversation

**What happens**:
1. Creates new thread
2. Clears message history
3. Resets context
4. Auto-generates ID

**Shortcut**: Ctrl+N (coming soon)

---

## Main Chat Area

### Chat Header

**Elements**:
- **Jarvis Icon**: 🤖
- **Title**: "Jarvis AI Assistant"
- **Status Indicator**: ● Online (green)

### Message Display

#### User Messages

**Appearance**:
- Aligned right
- Blue background
- Your name/avatar
- Timestamp (on hover)

```
                    ┌─────────────────────────┐
                    │ How do I fix flash?     │ 
                    │                         │
                    │ John - 2:15 PM          │
                    └─────────────────────────┘
```

#### Jarvis Messages

**Appearance**:
- Aligned left
- Gray/white background
- Jarvis avatar (🤖)
- Timestamp
- Source citations (when applicable)

```
┌──────────────────────────────────────┐
│ 🤖 Jarvis                            │
│                                      │
│ Flash defects occur when material    │
│ escapes from the mold cavity...      │
│                                      │
│ Common causes:                       │
│ 1. Insufficient clamp force          │
│ 2. Mold damage or wear               │
│ 3. Excessive injection pressure      │
│                                      │
│ Sources:                             │
│ • defect-guide.pdf                   │
│ • troubleshooting.md                 │
│                                      │
│ 2:15 PM                              │
└──────────────────────────────────────┘
```

#### Tool Execution Messages

Shows when Jarvis uses tools:

```
┌──────────────────────────────────────┐
│ 🔍 Searching knowledge base...       │
│ Found 5 relevant documents           │
└──────────────────────────────────────┘
```

```
┌──────────────────────────────────────┐
│ 📄 Retrieving file contents...       │
│ Loaded: quality-procedures.pdf       │
└──────────────────────────────────────┘
```

### Message Features

#### Markdown Rendering

Jarvis responses support rich text:

**Bold**: `**text**` → **text**  
**Italic**: `*text*` → *text*  
**Code**: `` `code` `` → `code`  
**Lists**: Automatic formatting  
**Links**: Clickable URLs (coming soon)

#### Code Blocks

```python
# Example code in responses
def calculate_clamp_force(area, pressure):
    return (area * pressure) / 2000
```

#### Tables

| Parameter | Value | Unit |
|-----------|-------|------|
| Temperature | 450 | °F |
| Pressure | 15000 | PSI |

#### Source Citations

Clickable source references:

```
Sources:
📄 defect-guide.pdf (page 12)
📄 troubleshooting.md (section 3)
```

**Actions**:
- Click to request full document
- Hover to see preview (coming soon)

---

## Input Composer

### Text Input Field

**Features**:
- **Placeholder**: "Your question..."
- **Auto-resize**: Grows with text (up to 5 lines)
- **Character limit**: 2000 characters (indicator coming soon)

**Keyboard Shortcuts**:
- **Enter**: Send message
- **Shift+Enter**: New line
- **Ctrl+A**: Select all text
- **Ctrl+Z**: Undo typing

### Send Button

**Location**: Right side of input

**States**:
- **Enabled**: Blue, clickable (when text entered)
- **Disabled**: Gray (when input empty)
- **Loading**: Spinner (while Jarvis thinks)

**Actions**:
- Click to send
- Disabled during response generation

### File Attachment (Coming Soon)

**Future feature**:
- 📎 Attachment button
- Upload PDFs, images, text files
- Attach to message for context

---

## Interactive Elements

### Feedback Buttons

Each Jarvis message has feedback options:

```
┌──────────────────────────────────────┐
│ Jarvis response...                   │
│                                      │
│ [👍 Helpful] [👎 Not Helpful]        │
└──────────────────────────────────────┘
```

**How it works**:
1. Click 👍 if answer was helpful
2. Click 👎 if not helpful
3. Optional: Provide feedback text
4. Feedback sent to analytics

**Why provide feedback**:
- Helps improve Jarvis
- Identifies missing documentation
- Improves answer quality

### Copy Button

**Location**: Top-right of each Jarvis message

**Action**: Click to copy full response to clipboard

**Use cases**:
- Save answers for later
- Share with team members
- Document procedures

### Regenerate Button (Coming Soon)

**Purpose**: Ask Jarvis to try answering again

**When to use**:
- Response was unclear
- Want different phrasing
- Jarvis seems confused

---

## Visual Indicators

### Status Indicators

**Jarvis is thinking**:
```
● Typing... [animated dots]
```

**Tool execution**:
```
🔍 Searching documents...
```

**Error state**:
```
⚠️ Something went wrong
```

### Loading States

**Message sending**:
- Input disabled
- Send button shows spinner
- Your message appears immediately

**Response streaming**:
- Jarvis message appears
- Text streams in token-by-token
- Cursor blinks at end

**Tool execution**:
- Tool indicator shown
- May take 1-5 seconds
- Progress indicator (for long operations)

---

## Responsive Behavior

### Scroll Behavior

**Auto-scroll**:
- Automatically scrolls to latest message
- Stays at bottom during response
- Scroll up to read history

**Manual scroll**:
- Scroll up to disable auto-scroll
- "Jump to bottom" button appears
- Click to return to latest

### Window Resizing

**Sidebar**:
- Collapsible on small screens
- Hamburger menu (≡) to toggle
- Swipe gestures on mobile

**Chat area**:
- Responsive width
- Maintains readability
- Optimized for 1024px+ screens

---

## Accessibility Features

### Keyboard Navigation

**Tab order**:
1. Sidebar buttons
2. Thread list
3. Input field
4. Send button

**Screen reader support**:
- ARIA labels on all interactive elements
- Message roles announced
- Focus indicators

### Visual Accessibility

**High contrast mode** (coming soon):
- Increased contrast ratios
- Larger text options
- Color-blind friendly

**Font sizing**:
- Browser zoom supported (Ctrl +/-)
- Maintains layout integrity
- Readable at 200% zoom

---

## Tips & Tricks

### Efficient Navigation

**Quick thread switching**:
1. Use Ctrl+K to open search (coming soon)
2. Type thread name
3. Enter to switch

**Keyboard-first workflow**:
1. Tab to input (anywhere on page)
2. Type question
3. Enter to send
4. No mouse needed!

### Message Management

**Reading long responses**:
- Scroll within message
- Copy sections separately
- Ask for summary: "Can you summarize that?"

**Referencing previous messages**:
```
User: You mentioned clamp force earlier...
Jarvis: [Recalls previous discussion]
```

### Customization (Coming Soon)

**Theme options**:
- Light mode (default)
- Dark mode
- High contrast

**Layout options**:
- Sidebar position (left/right)
- Message density (compact/comfortable)
- Font size

---

## Mobile View (Beta)

### Current State

Mobile access is **functional but not optimized**.

**What works**:
- ✅ Login
- ✅ Read messages
- ✅ Send messages
- ✅ Switch threads

**Limitations**:
- ⚠️ Sidebar overlay (not side-by-side)
- ⚠️ Small touch targets
- ⚠️ Long messages hard to read
- ⚠️ No swipe gestures yet

**Recommended**:
- Use desktop/laptop for best experience
- Tablet (iPad) works reasonably well
- Phone: usable but not optimal

---

## Common Issues

### Issue: Messages Not Sending

**Check**:
1. Input field has text
2. Network connection active
3. Jarvis service is running
4. Try refreshing page

### Issue: Can't See Full Response

**Solutions**:
- Scroll within message box
- Click "Show more" if truncated
- Ask Jarvis to continue: "Keep going"

### Issue: Thread List Not Loading

**Solutions**:
1. Refresh page
2. Log out and log back in
3. Clear browser cache
4. Contact support

---

## What's Next?

Continue learning:

1. **[RAG Search](rag-search.md)** - Master document search
2. **[Tips & Best Practices](tips.md)** - Pro user techniques
3. **[FAQ](faq.md)** - Common questions

---

[← Using Jarvis](using-jarvis.md) | [Next: RAG Search →](rag-search.md)
