# Validate Steering Documents

**Usage**: `/validate-steering`

This command checks if your steering documents are up-to-date and aligned with your current project configuration.

## What It Checks

### 1. Steering Documents Existence
- ✅ `quality-standards.md` exists
- ✅ `architecture-principles.md` exists
- ⚠️ `testing-strategy.md` exists (optional but recommended)

### 2. Freshness Check
```
Checking steering document freshness...

quality-standards.md:
  Last modified: 2025-10-19
  Project changes since: 15 commits
  ⚠️ Warning: 15 commits since last update

Recommendation: Review and update if project standards have evolved
```

### 3. Consistency with Project

**Detects mismatches:**

#### TypeScript Projects
- ✅ Steering doc says "TypeScript strict mode" → `tsconfig.json` has `strict: true`
- ❌ Steering doc says "No 'any' types" → Found 'any' in `tsconfig.json` allowances
- ⚠️ Steering doc mentions "Jest" → `package.json` now uses Vitest

#### Python Projects
- ✅ Steering doc says "mypy strict" → `pyproject.toml` has strict settings
- ❌ Steering doc says "pytest required" → No pytest in dependencies
- ⚠️ Steering doc mentions "ruff" → Project now uses black

#### General
- Compare steering docs with CLAUDE.md (if exists)
- Check if new tools were added to package.json
- Detect if architecture patterns changed

### 4. Completeness Check

**Required sections in quality-standards.md:**
- [ ] Quality Gates defined
- [ ] Type Checking requirements
- [ ] Linting requirements
- [ ] Testing requirements
- [ ] Non-Negotiable Requirements

**Required sections in architecture-principles.md:**
- [ ] Architecture Style defined
- [ ] Layer Structure defined
- [ ] SOLID Principles mentioned
- [ ] Design Patterns listed
- [ ] Anti-Patterns to Avoid

### 5. Recommendation Engine

Based on analysis, suggests:
```
📋 Validation Results

✅ Steering documents exist
⚠️ Last updated 30 days ago (15 commits since)
❌ Mismatch found: package.json now uses Vitest, steering doc mentions Jest

Recommendations:
1. Update quality-standards.md to reflect Vitest usage
2. Review testing strategy - coverage requirements still accurate?
3. Consider adding testing-strategy.md for comprehensive test documentation

Run /setup-steering to update interactively
Or edit manually: .claude/workflows/spec-first/steering/
```

## Validation Process

### Step 1: Check Existence
```
🔍 Checking for steering documents...

✅ quality-standards.md found
✅ architecture-principles.md found
⚠️ testing-strategy.md not found (optional)
```

### Step 2: Analyze Freshness
```
📅 Checking document freshness...

quality-standards.md:
  Created: 2025-10-19
  Last modified: 2025-10-19
  Git commits since: 15
  Days since update: 30

Status: ⚠️ May need review (30 days old, 15 commits)
```

### Step 3: Detect Project Changes
```
🔬 Analyzing project changes...

package.json changes detected:
  + vitest (new dependency)
  + @testing-library/react (version updated)
  - jest (removed)

tsconfig.json changes:
  ✅ strict: true (matches steering doc)

CLAUDE.md changes:
  ℹ️ Architecture grade updated: A- → A+ (not reflected in steering)
```

### Step 4: Validate Consistency
```
🎯 Validating consistency...

Quality Standards:
  ✅ TypeScript requirements match project config
  ❌ Test framework mismatch: Doc says "Jest", project uses "Vitest"
  ✅ ESLint requirements match
  ⚠️ No coverage percentage specified

Architecture Principles:
  ✅ Clean Architecture grade: A-
  ⚠️ CLAUDE.md now claims A+, steering doc still says A-
  ✅ Layer structure documented
  ✅ SOLID principles listed
```

### Step 5: Generate Report
```
📊 Validation Report

Overall Status: ⚠️ Needs Attention

Issues Found: 2
Warnings: 3

Critical Issues:
  ❌ Test framework mismatch (Jest → Vitest)
  ❌ Architecture grade outdated (A- → A+)

Warnings:
  ⚠️ 30 days since last update
  ⚠️ No testing coverage percentage specified
  ⚠️ No testing-strategy.md (recommended)

Next Steps:
  1. Update quality-standards.md: Change Jest → Vitest
  2. Update architecture-principles.md: Update grade to A+
  3. Consider creating testing-strategy.md
  4. Run /validate-steering again after updates

Quick fix: /setup-steering --update
```

## Validation Modes

### Default Mode
```bash
/validate-steering
```
Full validation with detailed report.

### Quick Mode
```bash
/validate-steering --quick
```
Just shows status, no detailed analysis.

### Strict Mode
```bash
/validate-steering --strict
```
Treats warnings as errors.

### Auto-Fix Mode
```bash
/validate-steering --auto-fix
```
Attempts to fix common issues automatically (backs up first).

## When to Run

Run `/validate-steering`:
- **Monthly** - Regular maintenance
- **After major project changes** - New dependencies, tools, or standards
- **Before big refactorings** - Ensure steering docs reflect current state
- **After team discussions** - When quality standards evolve
- **When something feels off** - Specs don't match actual project

## Integration with Other Commands

`/spec` and `/implement` can optionally validate steering docs:

```
/spec Fix the transaction table alignment

⚠️ Steering documents are 45 days old. Run /validate-steering to check if they're still accurate.

Continue anyway? (yes/no):
```

## Example: Full Validation

```
$ /validate-steering

🔍 Validating Steering Documents...

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. Existence Check
   ✅ quality-standards.md (2.1 KB)
   ✅ architecture-principles.md (3.4 KB)
   ⚠️ testing-strategy.md missing (optional)

2. Freshness Check
   quality-standards.md
     Last modified: 30 days ago
     Commits since: 15
     Status: ⚠️ Review recommended

   architecture-principles.md
     Last modified: 30 days ago
     Commits since: 15
     Status: ⚠️ Review recommended

3. Project Changes Detected
   package.json:
     + vitest@1.0.0
     + @vitest/ui@1.0.0
     - jest@29.0.0
     - @types/jest@29.0.0

   CLAUDE.md:
     Architecture grade: A- → A+

4. Consistency Validation
   ❌ Test framework: Doc says "Jest", project uses "Vitest"
   ❌ Architecture grade: Doc says "A-", CLAUDE.md says "A+"
   ✅ TypeScript strict mode: Matches
   ✅ ESLint config: Matches

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 Summary

Status: ⚠️ Attention Needed
Issues: 2 critical, 3 warnings

Critical:
  1. Update test framework: Jest → Vitest
  2. Update architecture grade: A- → A+

Warnings:
  1. Documents 30 days old (review recommended)
  2. No coverage percentage in quality-standards.md
  3. Missing testing-strategy.md

Recommendations:
  • Run: /setup-steering --update
  • Or manually edit steering docs
  • Re-validate after changes

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Benefits

- ✅ Keeps steering documents aligned with project reality
- ✅ Prevents outdated standards from being enforced
- ✅ Catches configuration drift early
- ✅ Ensures team is using current tools and practices
- ✅ Maintains quality gate accuracy

## Related Commands

- `/setup-steering` - Update steering documents
- `/spec` - Create specification (uses steering docs)
- `/implement` - Implement task (uses steering docs)

---

**Keep your standards current!** Run `/validate-steering` regularly.
