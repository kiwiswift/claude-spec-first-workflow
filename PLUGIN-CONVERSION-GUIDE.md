# Converting to Claude Code Plugin

This guide explains how to convert this workflow into a reusable Claude Code Plugin that can be shared across repositories.

## Why Convert to a Plugin?

✅ **Reusability**: Use the same workflow across all your projects
✅ **Shareability**: Team members can install and use it
✅ **Maintainability**: Update once, apply everywhere
✅ **Versioning**: Track workflow improvements over time
✅ **Distribution**: Share with the community

## Current Structure (Local Workflow)

```
.claude/workflows/spec-first/
├── manifest.json              # Plugin metadata (ready!)
├── commands/                  # Slash commands
│   ├── spec.md
│   ├── implement.md
│   └── spec-and-implement.md
├── templates/                 # Document templates
│   ├── task-specification.md
│   ├── implementation-summary.md
│   ├── phase-summary.md
│   └── commit-message.md
├── docs/                      # Documentation
│   ├── README.md
│   ├── QUICK-START.md
│   └── PLUGIN-CONVERSION-GUIDE.md  # This file
└── .gitignore                 # (to be created)
```

## Step 1: Prepare for Plugin Distribution

### Create .gitignore

```bash
cd .claude/workflows/spec-first
cat > .gitignore << 'EOF'
# Plugin-specific ignores
.DS_Store
*.log
node_modules/
.env

# Keep the structure clean
_drafts/
EOF
```

### Update manifest.json

The `manifest.json` is already plugin-ready! Just update the author field:

```json
{
  "name": "spec-first-workflow",
  "version": "1.0.0",
  "description": "Specification-first development workflow for bugs, refactorings, and features",
  "author": "Your Name <your.email@example.com>",  // <- Update this
  "claude_code_version": ">=1.0.0",
  ...
}
```

## Step 2: Create Plugin Repository

### Option A: Standalone Repository

```bash
# Create new repository
mkdir claude-spec-first-workflow
cd claude-spec-first-workflow

# Copy workflow files
cp -r /path/to/project/.claude/workflows/spec-first/* .

# Initialize git
git init
git add .
git commit -m "Initial commit: Spec-First Workflow v1.0.0"

# Add remote and push
git remote add origin https://github.com/yourusername/claude-spec-first-workflow.git
git push -u origin main

# Tag the release
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0
```

### Option B: Monorepo (Multiple Plugins)

```bash
# Create plugins repository
mkdir claude-plugins
cd claude-plugins

# Create plugin subdirectory
mkdir -p plugins/spec-first-workflow
cp -r /path/to/project/.claude/workflows/spec-first/* plugins/spec-first-workflow/

# Initialize git
git init
git add .
git commit -m "Add spec-first-workflow plugin v1.0.0"
```

## Step 3: Package the Plugin

### Create Distribution Package

```bash
cd claude-spec-first-workflow  # or plugins/spec-first-workflow

# Create tarball
tar -czf spec-first-workflow-v1.0.0.tar.gz \
  --exclude='.git*' \
  --exclude='*.log' \
  --exclude='_drafts' \
  .

# Verify contents
tar -tzf spec-first-workflow-v1.0.0.tar.gz

# Create checksum
shasum -a 256 spec-first-workflow-v1.0.0.tar.gz > spec-first-workflow-v1.0.0.tar.gz.sha256
```

## Step 4: Publish Plugin

### Option 1: GitHub Releases (Recommended)

```bash
# Create release on GitHub
gh release create v1.0.0 \
  --title "Spec-First Workflow v1.0.0" \
  --notes "Initial release of specification-first development workflow" \
  spec-first-workflow-v1.0.0.tar.gz \
  spec-first-workflow-v1.0.0.tar.gz.sha256
```

### Option 2: npm Package (If Claude Code supports)

```bash
# Create package.json
cat > package.json << 'EOF'
{
  "name": "@yourusername/claude-spec-first-workflow",
  "version": "1.0.0",
  "description": "Specification-first development workflow for Claude Code",
  "main": "manifest.json",
  "keywords": ["claude-code", "workflow", "specification", "development"],
  "author": "Your Name",
  "license": "MIT",
  "repository": {
    "type": "git",
    "url": "https://github.com/yourusername/claude-spec-first-workflow"
  },
  "files": [
    "manifest.json",
    "commands/",
    "templates/",
    "README.md",
    "QUICK-START.md"
  ]
}
EOF

# Publish to npm
npm publish --access public
```

### Option 3: Claude Code Plugin Registry (Future)

When Claude Code has an official plugin registry:

```bash
# Install Claude Code CLI
npm install -g @anthropic/claude-code-cli

# Authenticate
claude-code login

# Publish plugin
claude-code publish
```

## Step 5: Installation Instructions

### For Users (Current Method - Manual)

```bash
# In your project directory
cd .claude/workflows

# Clone the plugin
git clone https://github.com/yourusername/claude-spec-first-workflow.git spec-first

# Create symlinks to commands
cd ../commands
ln -sf ../workflows/spec-first/commands/spec.md spec.md
ln -sf ../workflows/spec-first/commands/implement.md implement.md
ln -sf ../workflows/spec-first/commands/spec-and-implement.md spec-and-implement.md
```

### For Users (Future - CLI)

```bash
# When Claude Code CLI is available
claude-code install spec-first-workflow

# Or with npm
npm install -g @yourusername/claude-spec-first-workflow
claude-code plugin link @yourusername/claude-spec-first-workflow
```

## Step 6: Version Management

### Semantic Versioning

Follow [Semver](https://semver.org):
- **Major (X.0.0)**: Breaking changes to workflow
- **Minor (1.X.0)**: New features, backward compatible
- **Patch (1.0.X)**: Bug fixes, documentation updates

### Release Process

```bash
# Update version in manifest.json
# Update CHANGELOG.md with changes
# Commit changes
git add manifest.json CHANGELOG.md
git commit -m "chore: bump version to 1.1.0"

# Tag release
git tag -a v1.1.0 -m "Release v1.1.0: Add XYZ feature"
git push origin main --tags

# Create GitHub release
gh release create v1.1.0 \
  --title "Spec-First Workflow v1.1.0" \
  --notes-file CHANGELOG.md \
  spec-first-workflow-v1.1.0.tar.gz
```

## Step 7: Documentation for Plugin Users

### Create INSTALL.md

```markdown
# Installation

## Prerequisites
- Claude Code v1.0.0 or higher

## Installation Steps

1. Clone this repository into your project's `.claude/workflows/` directory:
   \`\`\`bash
   cd .claude/workflows
   git clone https://github.com/yourusername/claude-spec-first-workflow.git spec-first
   \`\`\`

2. Create symlinks to make commands accessible:
   \`\`\`bash
   cd ../commands
   ln -sf ../workflows/spec-first/commands/spec.md spec.md
   ln -sf ../workflows/spec-first/commands/implement.md implement.md
   ln -sf ../workflows/spec-first/commands/spec-and-implement.md spec-and-implement.md
   \`\`\`

3. Verify installation:
   \`\`\`bash
   ls -la .claude/commands/
   # Should show symlinks to spec.md, implement.md, spec-and-implement.md
   \`\`\`

4. Start using:
   \`\`\`
   /spec
   \`\`\`

## Updating

\`\`\`bash
cd .claude/workflows/spec-first
git pull origin main
\`\`\`
```

## Step 8: Add LICENSE

Choose an appropriate license:

```bash
# MIT License (recommended for maximum compatibility)
cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2025 Your Name

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
```

## Step 9: Testing the Plugin

### Create Test Repository

```bash
# Create test project
mkdir test-project
cd test-project
mkdir -p .claude/workflows .claude/commands

# Install plugin
cd .claude/workflows
git clone /path/to/claude-spec-first-workflow spec-first

# Create symlinks
cd ../commands
ln -sf ../workflows/spec-first/commands/spec.md spec.md
ln -sf ../workflows/spec-first/commands/implement.md implement.md
ln -sf ../workflows/spec-first/commands/spec-and-implement.md spec-and-implement.md

# Test commands
# Open Claude Code and try /spec
```

## Step 10: Community & Support

### Add CONTRIBUTING.md

```markdown
# Contributing

We welcome contributions! Here's how:

## Reporting Issues
- Use GitHub Issues
- Include Claude Code version
- Include reproduction steps

## Submitting Changes
1. Fork the repository
2. Create feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing feature'`
4. Push branch: `git push origin feature/amazing-feature`
5. Open Pull Request

## Development
1. Make changes to commands/ or templates/
2. Update version in manifest.json
3. Test with a real project
4. Update documentation
5. Submit PR
```

### Add CHANGELOG.md

```markdown
# Changelog

## [1.0.0] - 2025-10-19

### Added
- Initial release
- `/spec` command for specification creation
- `/implement` command for implementation
- `/spec-and-implement` command for full workflow
- Comprehensive templates for all document types
- Full documentation and examples

### Tested
- Successfully used on TASK-20251018-BULKOPS001
- Achieved 95% performance improvement
- Maintained 100% test pass rate
```

## Quick Checklist

- [ ] Update `manifest.json` with your details
- [ ] Create standalone repository
- [ ] Add LICENSE file
- [ ] Add INSTALL.md
- [ ] Add CONTRIBUTING.md
- [ ] Add CHANGELOG.md
- [ ] Create git tags for versions
- [ ] Create GitHub release
- [ ] Test installation in fresh project
- [ ] Write blog post / announcement
- [ ] Share with community

## Future Enhancements

When Claude Code plugin system matures:

1. **Auto-installation**: `claude-code install spec-first-workflow`
2. **Auto-updates**: `claude-code update spec-first-workflow`
3. **Plugin marketplace**: Browse and install from web UI
4. **Plugin dependencies**: Depend on other plugins
5. **Plugin hooks**: React to project events
6. **Plugin configuration**: Per-project customization

## Support

For questions or issues:
- GitHub Issues: https://github.com/yourusername/claude-spec-first-workflow/issues
- Email: your.email@example.com
- Twitter: @yourusername

---

**Ready to share your workflow with the world?** Follow these steps and make development better for everyone! 🚀
