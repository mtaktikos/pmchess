# FAQ: Orphaned GitHub Agent Sessions

## Quick Answers

### Q: I have agent sessions stuck for deleted repos. What should I do?

**A:** Wait 7-30 days for automatic cleanup, or contact GitHub Support for manual removal. See [GITHUB_AGENTS_SESSIONS.md](GITHUB_AGENTS_SESSIONS.md) for details.

### Q: Can I close these sessions myself?

**A:** Not directly through the UI when the repository is deleted. The close button doesn't work because the repository reference is invalid.

### Q: Is this a bug in my repository's code?

**A:** No. This is an infrastructure issue in GitHub's Agents system. It cannot be fixed by modifying code in individual repositories.

### Q: Will these stuck sessions cause problems?

**A:** Generally no. They're just orphaned metadata. They won't consume resources or affect your ability to use GitHub Agents on other repositories.

### Q: How can I prevent this in the future?

**A:** Before deleting any repository:
1. Check "Agents/Recent sessions" for active sessions
2. Close or complete all sessions for that repository
3. Wait for sessions to show "Closed" status
4. Only then delete the repository

### Q: Who can fix this issue permanently?

**A:** Only GitHub can fix this by:
- Implementing automatic cleanup for deleted repository sessions
- Adding force-close functionality in the UI
- Providing session management APIs

### Q: Should I report this to GitHub?

**A:** Yes! The more users report it, the higher priority it becomes:
- GitHub Support: https://support.github.com
- Include: username, deleted repo names, screenshots

### Q: Are my two specific stuck sessions (ABC-conjunction-math-papers and TogaII) normal?

**A:** Yes, this is the expected behavior when repositories are deleted with active/pending agent sessions. These are orphaned sessions that will eventually be cleaned up.

## Immediate Action

**For mtaktikis/ABC-conjunction-math-papers and mtaktikos/TogaII sessions:**

Since these repositories are already deleted, your options are:

1. **Wait it out** - Sessions should auto-cleanup in 7-30 days
2. **Contact support** - File a ticket at https://support.github.com requesting manual cleanup
3. **Ignore them** - They're harmless and just cosmetic clutter in your sessions list

**Recommended**: Contact GitHub Support with this information:
- Username: mtaktikos/mtaktikis
- Deleted repos: ABC-conjunction-math-papers, TogaII
- Issue: Orphaned agent sessions cannot be closed or initialized
- Request: Manual cleanup of these sessions

---

**More Details**: See [GITHUB_AGENTS_SESSIONS.md](GITHUB_AGENTS_SESSIONS.md)
