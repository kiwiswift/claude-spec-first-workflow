# Steering Documents

This directory contains project-specific configuration and standards that guide the Specification-First workflow.

## What Are Steering Documents?

Steering documents define project-specific requirements, standards, and conventions that the workflow should follow. They override generic defaults and ensure consistency across your project.

## Required Steering Documents

Create these files to customize the workflow for your project:

1. **`quality-standards.md`** - Quality gates and requirements
2. **`architecture-principles.md`** - Architecture standards and patterns
3. **`testing-strategy.md`** - Testing requirements and conventions
4. **`documentation-standards.md`** - Documentation requirements
5. **`commit-conventions.md`** - Git commit message standards

## Optional Steering Documents

Add these as needed:

- **`performance-standards.md`** - Performance requirements
- **`security-requirements.md`** - Security standards
- **`accessibility-standards.md`** - Accessibility requirements
- **`code-style-guide.md`** - Language-specific style preferences
- **`review-checklist.md`** - Code review requirements

## How They Work

When running `/spec` or `/implement`, Claude will:

1. **Read all steering documents** in this directory
2. **Apply project-specific standards** from these documents
3. **Validate against your requirements** instead of generic defaults
4. **Suggest improvements** based on your guidelines

## Creating Steering Documents

Use the templates provided in this directory as starting points:

```bash
cp quality-standards.template.md quality-standards.md
cp architecture-principles.template.md architecture-principles.md
# Edit the files to match your project
```

## Example: Quality Standards

Instead of generic quality standards, you might specify:

```markdown
## Quality Gates (TypeScript/React Project)

After each phase:
- ✅ TypeScript: 0 errors (strict mode)
- ✅ ESLint: 0 errors, 0 warnings (custom ruleset)
- ✅ Tests: 100% passing, >80% coverage
- ✅ Playwright E2E: All critical paths passing
- ✅ Bundle size: <500KB (production build)
```

Or for a Python/FastAPI project:

```markdown
## Quality Gates (Python/FastAPI Project)

After each phase:
- ✅ mypy: 0 type errors (strict mode)
- ✅ ruff: 0 linting errors
- ✅ pytest: 100% passing, >90% coverage
- ✅ Security: bandit scan passes
```

## Project-Specific Example

For this project (TrackSmart), see:
- `quality-standards.md` - Our quality requirements
- `architecture-principles.md` - Clean Architecture compliance
- `testing-strategy.md` - Test coverage and patterns

## Tips

1. **Start minimal**: Begin with just quality-standards.md and architecture-principles.md
2. **Be specific**: Include actual commands, thresholds, and examples
3. **Reference existing docs**: Link to your project's existing documentation
4. **Update as needed**: Steering docs should evolve with your project
5. **Keep it practical**: Focus on what you actually enforce, not aspirations

## Validation

Claude will validate specifications and implementations against these documents and will:
- ✅ Suggest improvements based on your standards
- ✅ Ensure quality gates match your requirements
- ✅ Follow your architecture principles
- ✅ Use your commit conventions
