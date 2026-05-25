---
name: open-in-modelbound
description: Open the current skill, rule, or context file in ModelBound for AI review, sync status, and team-library context.
---

# Open in ModelBound

1. Resolve the current file's relative path within the workspace.
2. Determine the asset type from the path:
   - `**/SKILL.md` → skill
   - `**/*.mdc` under `rules/` or `.cursor/rules/` → rule
   - `**/.cursor-plugin/plugin.json` → plugin manifest
3. Construct the URL `https://modelbound.co/open?type=<type>&path=<urlencoded-path>&repo=<git-remote>` and open it in the default browser.
4. If the user is not signed in, ModelBound will route through the sign-in flow and return to the requested asset.
