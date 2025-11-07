# Deploying Documentation to GitHub Pages

## Quick Deploy

Your documentation is ready to deploy! Everything is in the `/docs` folder.

### GitHub Pages Setup

1. **Push to GitHub**:
   ```bash
   git add docs/
   git commit -m "docs: add comprehensive documentation"
   git push origin main
   ```

2. **Enable GitHub Pages**:
   - Go to repository Settings
   - Navigate to "Pages" section
   - Under "Source", select:
     - Branch: `main`
     - Folder: `/docs`
   - Click "Save"

3. **Access Documentation**:
   - Your docs will be live at: `https://pegasora.github.io/HHDocs/`
   - Usually takes 1-2 minutes to deploy

## Local Preview

Before deploying, preview locally:

```bash
# Install docsify CLI globally (one time)
npm install -g docsify-cli

# Serve docs locally
docsify serve docs

# Open browser
open http://localhost:3000
```

## File Structure for GitHub Pages

```
docs/                          # GitHub Pages source folder
├── index.html                 # Docsify configuration
├── .nojekyll                  # Tells GitHub not to use Jekyll
├── _sidebar.md                # Sidebar navigation
├── README.md                  # Home page content
├── about.md                   # About page
├── lib/                       # Docsify CSS/JS files
├── user/                      # User documentation
├── developer/                 # Developer documentation
├── components/                # Component docs
├── guides/                    # Step-by-step guides
└── references/                # Additional resources
```

## Updating Documentation

1. **Edit Markdown files** in `/docs`
2. **Preview locally**: `docsify serve docs`
3. **Commit changes**: `git add docs/ && git commit -m "docs: update X"`
4. **Push**: `git push origin main`
5. **GitHub Pages auto-deploys** in 1-2 minutes

## Custom Domain (Optional)

To use a custom domain like `docs.hhmolds.com`:

1. Add `CNAME` file to `/docs`:
   ```bash
   echo "docs.hhmolds.com" > docs/CNAME
   ```

2. Configure DNS:
   - Add CNAME record pointing to `pegasora.github.io`

3. Update GitHub Pages settings with custom domain

## Troubleshooting

**404 Error**: 
- Ensure branch is `main` and folder is `/docs`
- Check `.nojekyll` file exists
- Wait 2-3 minutes for deployment

**Styles Not Loading**:
- Check `lib/` folder has all CSS files
- Verify `index.html` paths are relative

**Sidebar Not Showing**:
- Ensure `_sidebar.md` exists in `/docs`
- Check `loadSidebar: true` in `index.html`

---

✅ Your documentation is ready to deploy!
