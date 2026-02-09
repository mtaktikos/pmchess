# GitHub Agents Sessions - Deleted Repository Issue

## Problem Description

GitHub Copilot Agents may leave orphaned sessions when repositories are deleted. These sessions appear under "Agents/Recent sessions" but cannot be initialized or closed normally because the repositories no longer exist.

### Known Affected Repositories (Examples)
- mtaktikis/ABC-conjunction-math-papers (deleted)
- mtaktikos/TogaII (deleted)

## Is This a Bug?

**Yes**, this is a known limitation in GitHub's Agents feature. When a repository is deleted while an agent session is active or pending, the session metadata persists in GitHub's system but cannot be properly cleaned up through the normal UI.

## Important Note

**This issue cannot be fixed by modifying code in individual repositories like pmchess.** The problem exists in GitHub's infrastructure and requires a fix from GitHub itself or manual intervention through GitHub support.

## Workarounds

### Option 1: Wait for Automatic Cleanup
GitHub's system typically cleans up orphaned sessions automatically after some time (usually 7-30 days). The sessions should eventually disappear from your "Recent sessions" list.

### Option 2: Contact GitHub Support
If orphaned sessions persist and cause issues:

1. Go to https://support.github.com
2. Create a support ticket
3. Provide the following information:
   - Your GitHub username
   - The names of the deleted repositories with stuck sessions
   - Screenshot of the "Agents/Recent sessions" showing the stuck sessions
   - Request manual cleanup of orphaned agent sessions

### Option 3: Browser Cache Clear (Sometimes Works)
Sometimes the orphaned sessions are cached locally:

1. Clear your browser cache for github.com
2. Log out of GitHub
3. Log back in
4. Check if sessions are still visible

### Option 4: Use GitHub API (Advanced)
If GitHub provides an API endpoint for managing agent sessions (check current documentation), you may be able to clean them up programmatically.

## Prevention Tips

To avoid this issue in the future:

1. **Close active agent sessions before deleting repositories**
   - Go to "Agents/Recent sessions"
   - Manually close or complete all sessions for a repository
   - Wait for sessions to fully terminate (status shows "Closed" or "Completed")
   - Only then delete the repository

2. **Check for active sessions**
   - Before deleting any repository, verify no active agent sessions exist
   - Look in GitHub UI under Copilot → Agents → Recent sessions

3. **Archive instead of delete**
   - Consider archiving repositories instead of deleting them
   - This preserves session data and allows proper cleanup
   - You can delete after ensuring all sessions are closed

## Technical Background

GitHub Agents create session metadata that includes:
- Repository reference
- Branch information
- Agent state
- Session history

When a repository is deleted, these references become invalid, but the session metadata may persist in GitHub's database, creating "orphaned" sessions that cannot be accessed or cleaned up through normal UI operations.

## Status

This is an **infrastructure-level issue** in GitHub's Agents system, not a code bug in individual repositories. 

**Action Items for GitHub (Not Repository Owners):**
- Implement automatic cleanup of sessions for deleted repositories
- Add UI option to force-close orphaned sessions
- Improve error handling when repository references become invalid
- Provide API endpoints for session management

## Related Resources

- GitHub Copilot Documentation: https://docs.github.com/en/copilot
- GitHub Support: https://support.github.com
- GitHub Community Discussions: https://github.com/orgs/community/discussions

## Acknowledgment

This documentation was created in response to issue reports about orphaned agent sessions in deleted repositories (mtaktikis/ABC-conjunction-math-papers and mtaktikos/TogaII).

---

**Last Updated**: February 9, 2026  
**Status**: Known limitation - awaiting GitHub infrastructure fix
