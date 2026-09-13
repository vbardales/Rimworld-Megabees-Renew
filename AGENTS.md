# Workflow stage and task title

Whenever you change the top-level `stage` in `STATUS.md`, update the title of the
associated Codex task to that exact stage value in the same operation sequence,
before reporting completion. Use `set_thread_title` for task
`01a09ab2-e073-7c23-94c2-a8d2aaef121f` when that task is accessible.

Update the title when the state changes; do not create a scheduled automation or
polling monitor for this purpose. A title update must follow the validated state,
never change the state to match a title. If task tools are unavailable, report the
title update as pending rather than claiming it succeeded.
