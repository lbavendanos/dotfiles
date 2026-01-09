# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Repository Overview

Personal dotfiles repository for macOS development environment. Manages terminal tools, shell configuration, and editor settings with vim-style keybindings and a consistent Kanagawa Dragon theme.

## Structure

- `.config/` - Tool configurations (XDG Base Directory spec)
- `.zshrc` - Shell config: aliases, PATH, plugins, functions
- `themes/` - Color palette references

## Theme Configuration

This repository uses **Kanagawa Dragon** as the unified color theme. When configuring any tool that supports theming, you MUST consult the color palette in:

**`themes/kanagawa-dragon.md`**

Always use colors from this reference to maintain visual consistency.

## Documentation Lookup

When you need up-to-date documentation for any library or tool, use **Context7 MCP**:

1. `mcp__context7__resolve-library-id` - Resolve library name to Context7 ID
2. `mcp__context7__query-docs` - Query documentation with specific questions

Use Context7 especially when configuring new tools, working with APIs, or troubleshooting version-specific issues.
