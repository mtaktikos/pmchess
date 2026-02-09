# GitHub Support Ticket Template

## For: Orphaned Agent Sessions in Deleted Repositories

Copy and customize this template when contacting GitHub Support about orphaned agent sessions.

---

**Subject:** Request to Clean Up Orphaned GitHub Copilot Agent Sessions

**Description:**

Hello GitHub Support Team,

I am experiencing an issue with GitHub Copilot Agent sessions that are stuck in my "Agents/Recent sessions" list. These sessions are associated with repositories that have been deleted and cannot be closed or initialized through the normal UI.

**Affected GitHub Account:**
- Username: [YOUR_USERNAME_HERE]

**Orphaned Sessions Details:**

1. Repository: mtaktikis/ABC-conjunction-math-papers
   - Status: Repository deleted
   - Session Status: Cannot be initialized or closed
   - Approximate deletion date: [DATE_IF_KNOWN]

2. Repository: mtaktikos/TogaII
   - Status: Repository deleted
   - Session Status: Cannot be initialized or closed
   - Approximate deletion date: [DATE_IF_KNOWN]

**Problem Description:**

When I view my agent sessions at github.com → Copilot → Agents → Recent sessions, I see the above sessions listed. When I attempt to:
- Initialize the session: It fails because the repository no longer exists
- Close the session: The close button doesn't work or is not available

**Expected Behavior:**

Sessions associated with deleted repositories should either:
1. Be automatically cleaned up when the repository is deleted, or
2. Provide a force-close option in the UI, or
3. Be marked as invalid/archived and hidden from the active sessions list

**Request:**

Please manually clean up these orphaned agent sessions from my account so they no longer appear in my "Recent sessions" list.

**Additional Context:**

This appears to be a known limitation where agent session metadata persists after repository deletion. I have documented this issue and created reference materials at:
https://github.com/mtaktikos/pmchess/blob/copilot/fix-open-sessions-deleted-repos/GITHUB_AGENTS_SESSIONS.md

**Screenshots:**
[ATTACH SCREENSHOT OF RECENT SESSIONS SHOWING STUCK SESSIONS]

Thank you for your assistance.

Best regards,
[YOUR_NAME]

---

## Tips for Filling Out This Template

1. **Replace placeholders:**
   - `[YOUR_USERNAME_HERE]` - Your actual GitHub username
   - `[DATE_IF_KNOWN]` - When you deleted the repository (if you remember)
   - `[YOUR_NAME]` - Your name

2. **Add screenshots:**
   - Take a screenshot of the "Agents/Recent sessions" page showing the stuck sessions
   - Highlight or circle the problematic sessions
   - Attach to the support ticket

3. **Where to submit:**
   - Go to: https://support.github.com
   - Select: "Copilot" or "General" category
   - Choose: "Contact support" or "Submit a request"
   - Paste and customize this template

4. **Follow up:**
   - Note your ticket number
   - Expect response within 24-48 hours (usually)
   - Check your email for updates

## Alternative: Twitter/X

If you prefer public channels:
```
@GitHubSupport I have orphaned GitHub Copilot Agent sessions for deleted 
repositories (mtaktikis/ABC-conjunction-math-papers and mtaktikos/TogaII) 
that cannot be closed. Can these be cleaned up? Ticket #[NUMBER_IF_YOU_HAVE_ONE]
```

## Alternative: GitHub Community

Post in GitHub Community Discussions:
- URL: https://github.com/orgs/community/discussions
- Category: Copilot
- Title: "Orphaned Agent Sessions After Repository Deletion"
- Body: Customize the template above

---

**Note:** Keep this template saved for future reference if the same issue occurs with other deleted repositories.
