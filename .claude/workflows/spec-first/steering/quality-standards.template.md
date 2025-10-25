# Quality Standards

> **Purpose**: Define the quality gates and requirements for this project
> **Copy this file**: `cp quality-standards.template.md quality-standards.md` and customize

## Quality Gates

Define what must pass after each implementation phase:

### Type Checking
```bash
# Command to run:
npm run typecheck

# Success criteria:
- 0 type errors
- Strict mode enabled
- No 'any' types allowed (except where explicitly documented)
```

### Linting
```bash
# Command to run:
npm run lint

# Success criteria:
- 0 errors
- 0 warnings
- Custom rules: [list any project-specific rules]
```

### Testing
```bash
# Command to run:
npm test

# Success criteria:
- 100% tests passing
- Minimum coverage: XX% (specify your threshold)
- All new features have tests
- All bug fixes have regression tests
```

### Build
```bash
# Command to run:
npm run build

# Success criteria:
- Build succeeds without errors
- Bundle size: < XXX KB (specify limit)
- No console warnings in production build
```

### Additional Quality Checks

Add any additional checks your project requires:

```bash
# Examples:
- npm run e2e          # E2E tests
- npm run security     # Security scanning
- npm run perf         # Performance tests
```

## Code Quality Standards

### Naming Conventions
- Functions: camelCase, descriptive verbs
- Components: PascalCase, noun phrases
- Constants: UPPER_SNAKE_CASE
- Types/Interfaces: PascalCase, no 'I' prefix

### File Organization
- One component per file
- Tests co-located with source: `__tests__/`
- Max file length: XXX lines

### Code Complexity
- Max function length: XX lines
- Max cyclomatic complexity: X
- Max nesting depth: X levels

## Documentation Requirements

- [ ] All public APIs documented
- [ ] Complex algorithms explained
- [ ] Non-obvious decisions documented
- [ ] README updated when needed

## Performance Standards

- Page load time: < X ms
- Time to interactive: < X ms
- Bundle size budget: < XXX KB
- Lighthouse score: > XX

## Accessibility Standards

- WCAG level: [AA/AAA]
- Screen reader compatible: Yes/No
- Keyboard navigation: Required/Optional
- Color contrast: WCAG AA minimum

## Security Standards

- No hardcoded secrets
- Dependencies: No known vulnerabilities
- Input validation: All user inputs
- Authentication: [Your requirements]

## Non-Negotiable Requirements

List requirements that can NEVER be compromised:

- [ ] Requirement 1
- [ ] Requirement 2
- [ ] Requirement 3

## Recommended But Optional

List standards that are encouraged but not enforced:

- Recommendation 1
- Recommendation 2

---

**Last Updated**: YYYY-MM-DD
**Applies To**: All tasks from this date forward
