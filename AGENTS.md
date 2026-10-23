# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Before You Start

**Always consult Context7 MCP before making changes.** When adding or modifying tool configurations, use Context7 to query the official documentation of the tools involved. This ensures configurations follow current best practices and use up-to-date APIs.

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

- Prefer **vim-style keybindings** in all tools that support them to maintain muscle memory consistency.
