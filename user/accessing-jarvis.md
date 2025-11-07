# Accessing Jarvis

> **How to access the Jarvis AI Assistant platform**

---

## Network Requirements

To access Jarvis, you **MUST** be connected to one of the following networks:

### ✅ Approved Networks

1. **H&H Secure** (WiFi)
   - Primary network for facility access
   - Recommended for best performance

2. **H&H Quality** (WiFi)
   - Secondary network option
   - Quality department network

3. **Wired Ethernet**
   - Plug directly into facility network
   - Best performance and stability

4. **Tailscale VPN** (Remote Access)
   - For authorized remote workers
   - Requires VPN setup (contact IT)

### ❌ Will NOT Work

- Guest WiFi networks
- External internet (outside facility)
- Personal hotspots or mobile data

---

## Access URL

### Primary Access

Open your web browser and navigate to:

```
http://10.0.0.76:8501
```

**💡 Tip**: Bookmark this URL for quick access!

### Alternative Access (via Tailscale)

If connecting remotely via Tailscale VPN:

```
http://[tailscale-hostname]:8501
```

Contact IT for your specific Tailscale hostname.

---

## Browser Compatibility

### ✅ Supported Browsers

Jarvis works best on modern browsers:

| Browser | Minimum Version | Recommended |
|---------|----------------|-------------|
| **Chrome** | 100+ | ✅ Best |
| **Firefox** | 100+ | ✅ Good |
| **Edge** | 100+ | ✅ Good |
| **Safari** | 15+ | ⚠️ OK (some features limited) |

### ⚠️ Not Recommended

- Internet Explorer (deprecated)
- Very old browser versions
- Mobile browsers (support coming soon)

---

## Login Process

### Step 1: Navigate to Jarvis

1. Open your browser
2. Go to `http://10.0.0.76:8501`
3. Wait for the page to load (5-10 seconds)

### Step 2: Select Your Profile

1. You'll see a login page with user selection
2. Find your name in the dropdown list
3. Click on your name

### Step 3: Click Login

1. Click the "Login" button
2. Wait for authentication (2-3 seconds)
3. You'll be redirected to the main chat interface

**Note**: No password required for internal facility access.

---

## First-Time Setup

### Creating Your Account

If you don't see your name in the user list:

1. **Contact**: Dawson or IT department
2. **Provide**: Your full name and email (can be personal)
3. **Wait**: Account creation takes <5 minutes
4. **Refresh**: Reload the login page

### Account Information

Your account includes:
- ✅ Your name (display name)
- ✅ Email address (for identification only)
- ✅ Unique user ID (auto-generated)
- ✅ Chat history (auto-saved per session)

---

## Troubleshooting Access Issues

### Issue 1: "Cannot Connect" or Page Won't Load

**Possible Causes**:
- Not on approved network
- Server is down
- Browser cache issues

**Solutions**:
1. Verify you're on H&H Secure/Quality WiFi
2. Try refreshing the page (Ctrl+R or Cmd+R)
3. Clear browser cache and try again
4. Try a different browser
5. Contact IT if problem persists

### Issue 2: "Your Name Not in List"

**Solutions**:
1. Make sure you have an account (contact Dawson/IT)
2. Refresh the page to reload user list
3. Try logging out and back in
4. Clear browser cookies and retry

### Issue 3: Login Button Doesn't Work

**Solutions**:
1. Make sure JavaScript is enabled in your browser
2. Disable browser extensions temporarily
3. Try incognito/private browsing mode
4. Clear browser cache and cookies
5. Contact IT if issue continues

### Issue 4: Page Loads But Shows Errors

**Solutions**:
1. Check if Jarvis is undergoing maintenance (check Slack/email)
2. Wait 1-2 minutes and refresh
3. Try accessing from a different device
4. Contact IT with screenshot of error

---

## Access Hours

### Availability

Jarvis runs **24/7** with these exceptions:

**Regular Maintenance**:
- **When**: First Sunday of each month
- **Time**: 2:00 AM - 4:00 AM
- **Duration**: ~2 hours
- **Notice**: Announced 1 week in advance

**Emergency Maintenance**:
- **Notice**: As soon as possible
- **Duration**: Varies
- **Updates**: Posted to Slack/email

###Stay Updated

Maintenance notifications sent via:
- 📧 Email to all users
- 💬 Facility Slack channel
- 📋 Posted at login page (when applicable)

---

## Security & Privacy

### Your Data is Safe

- ✅ **All data stays local** - Nothing sent to external servers
- ✅ **Encrypted connections** - HTTPS coming soon
- ✅ **User isolation** - Your chats are private to you
- ✅ **Audit logging** - All access is logged (not content, just metadata)

### Best Practices

1. **Log out when done** (especially on shared computers)
2. **Don't share account** - Each person should have their own
3. **Report suspicious activity** - Contact IT immediately
4. **Keep browser updated** - For latest security patches

---

## Mobile Access

### Current Status

Mobile access is **limited** but functional:

**Works**:
- ✅ Reading previous chats
- ✅ Sending simple queries
- ✅ Viewing responses

**Limited**:
- ⚠️ UI not optimized for small screens
- ⚠️ Some features may not display correctly
- ⚠️ Touch interactions not fully optimized

**Recommended**:
- 💻 Use desktop/laptop for best experience
- 📱 Mobile optimization coming in Q1 2026

---

## Need Help?

### Quick Support

**For Access Issues**:
- Email: intern@hhmoldsinc.com
- Slack: #jarvis-support channel
- In-person: Find Dawson or IT staff

**For Technical Issues**:
- See [Troubleshooting Guide](../guides/troubleshooting.md)
- Check [FAQ](faq.md)

---

## What's Next?

Once you're logged in:

1. **Take a Tour** - [Chat Interface Guide](chat-interface.md)
2. **Start Chatting** - [Using Jarvis](using-jarvis.md)
3. **Learn Best Practices** - [Tips & Tricks](tips.md)

---

[← Getting Started](getting-started.md) | [Next: Using Jarvis →](using-jarvis.md)
