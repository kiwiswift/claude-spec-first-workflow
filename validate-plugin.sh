#!/bin/bash

# Specification-First Workflow Plugin Validator
# Validates the plugin structure and required files

set -e

echo "🔍 Validating Specification-First Workflow Plugin..."
echo ""

ERRORS=0
WARNINGS=0

# Colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to check file exists
check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} $1"
    else
        echo -e "${RED}✗${NC} $1 (missing)"
        ((ERRORS++))
    fi
}

# Function to check directory exists
check_dir() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}✓${NC} $1/"
    else
        echo -e "${RED}✗${NC} $1/ (missing)"
        ((ERRORS++))
    fi
}

# Function to warn if file missing
warn_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} $1"
    else
        echo -e "${YELLOW}⚠${NC} $1 (recommended)"
        ((WARNINGS++))
    fi
}

echo "📁 Checking Plugin Structure..."
check_dir ".claude"
check_dir ".claude/workflows"
check_dir ".claude/workflows/spec-first"
check_dir ".claude/workflows/spec-first/commands"
check_dir ".claude/workflows/spec-first/templates"
check_dir ".claude/workflows/spec-first/steering"
echo ""

echo "📋 Checking Required Files..."
check_file ".claude/workflows/spec-first/manifest.json"
check_file ".claude/workflows/spec-first/commands/spec.md"
check_file ".claude/workflows/spec-first/commands/implement.md"
check_file ".claude/workflows/spec-first/commands/spec-and-implement.md"
check_file ".claude/workflows/spec-first/commands/setup-steering.md"
check_file ".claude/workflows/spec-first/commands/validate-steering.md"
echo ""

echo "📝 Checking Templates..."
check_file ".claude/workflows/spec-first/templates/task-specification.md"
check_file ".claude/workflows/spec-first/templates/implementation-summary.md"
check_file ".claude/workflows/spec-first/templates/phase-summary.md"
check_file ".claude/workflows/spec-first/templates/commit-message.md"
echo ""

echo "🎯 Checking Steering Templates..."
check_file ".claude/workflows/spec-first/steering/quality-standards.template.md"
check_file ".claude/workflows/spec-first/steering/architecture-principles.template.md"
check_file ".claude/workflows/spec-first/steering/testing-strategy.template.md"
warn_file ".claude/workflows/spec-first/steering/quality-standards.md"
warn_file ".claude/workflows/spec-first/steering/architecture-principles.md"
echo ""

echo "📚 Checking Documentation..."
check_file "README.md"
check_file "LICENSE"
check_file "INSTALL.md"
warn_file "CHANGELOG.md"
warn_file "CONTRIBUTING.md"
warn_file "QUICK-START.md"
echo ""

echo "📦 Checking Package Files..."
check_file "package.json"
echo ""

echo "🔍 Validating manifest.json..."
if [ -f ".claude/workflows/spec-first/manifest.json" ]; then
    # Check if it's valid JSON
    if python3 -c "import json; json.load(open('.claude/workflows/spec-first/manifest.json'))" 2>/dev/null; then
        echo -e "${GREEN}✓${NC} manifest.json is valid JSON"
        
        # Check required fields
        if grep -q '"name"' .claude/workflows/spec-first/manifest.json && \
           grep -q '"version"' .claude/workflows/spec-first/manifest.json && \
           grep -q '"commands"' .claude/workflows/spec-first/manifest.json; then
            echo -e "${GREEN}✓${NC} manifest.json has required fields"
        else
            echo -e "${RED}✗${NC} manifest.json missing required fields (name, version, commands)"
            ((ERRORS++))
        fi
    else
        echo -e "${RED}✗${NC} manifest.json is not valid JSON"
        ((ERRORS++))
    fi
fi
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}🎉 All checks passed!${NC}"
    echo -e "${GREEN}✨ Plugin structure is valid${NC}"
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠️  $WARNINGS warning(s)${NC}"
    echo -e "${GREEN}✅ Plugin structure is valid${NC}"
    echo -e "${YELLOW}💡 Consider addressing warnings for best experience${NC}"
    exit 0
else
    echo -e "${RED}❌ $ERRORS error(s)${NC}"
    if [ $WARNINGS -gt 0 ]; then
        echo -e "${YELLOW}⚠️  $WARNINGS warning(s)${NC}"
    fi
    echo -e "${RED}🔧 Please fix errors before using the plugin${NC}"
    exit 1
fi
