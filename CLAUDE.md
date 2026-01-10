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

## Key Patterns

- Use **Context7 MCP** for up-to-date documentation when adding or modifying configurations and tools.
- Prefer **vim-style keybindings** in all tools that support them to maintain muscle memory consistency.
