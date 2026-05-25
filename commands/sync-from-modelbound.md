---
name: sync-from-modelbound
description: Pull the latest versions of skills, rules, and MCP configurations from a ModelBound project into the current workspace.
---

# Sync from ModelBound

1. Read the project identifier from `.modelbound/project.json` (create it on first run by asking the user which ModelBound project to bind to).
2. Call the `modelbound.list_assets` MCP tool to enumerate skills, rules, and MCP configs in the bound project.
3. For each asset:
   - Compare the remote `updated_at` and content hash with the local file.
   - If the remote is newer, show a unified diff and ask the user to accept, skip, or open the diff in the editor.
4. Never overwrite local changes without explicit confirmation.
5. After syncing, run `/skill-health-lens` to confirm nothing regressed.

This command is read-mostly. To push local changes, use the ModelBound Git integration (the auto-tracking webhook handles pushes on commit).
