# Development Workflow

> **Best practices for developing Jarvis**

## Development Cycle

1. **Create Feature Branch**
2. **Make Changes**
3. **Test Locally**
4. **Lint & Format**
5. **Commit with Clear Message**
6. **Open Pull Request**

## Code Standards

### TypeScript
- Strict mode enabled
- No `any` types
- Proper error handling
- JSDoc comments for public APIs

### React
- Functional components only
- Hooks for state management
- Server Components where possible
- Client Components only when needed

### Styling
- Tailwind CSS utilities
- No inline styles
- Responsive-first
- Dark mode support

## Testing

```bash
# Lint
npm run lint

# Format
npm run prettier:fix

# Type check
npx tsc --noEmit

# Build (checks for errors)
npm run build
```

## Commit Messages

Follow Conventional Commits:

```
feat: add new weather tool
fix: resolve thread loading issue
docs: update API reference
chore: update dependencies
```

[← Tech Stack](tech-stack.md) | [Next: Agents & Tools →](agents-tools.md)
