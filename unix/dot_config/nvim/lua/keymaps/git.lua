-- Preview hunk
-- A hunk is a contiguous block of changes in a file — essentially, a section
-- of lines that have been added, removed, or modified.
km.n {
  key = '<leader>gp',
  action = ':Gitsigns preview_hunk<CR>',
  desc = 'Preview Hunk',
}

-- Toggle current line blame
km.n {
  key = '<leader>gt',
  action = ':Gitsigns toggle_current_line_blame<CR>',
  desc = 'Toggle Current Line Blame',
}

-- Open Lazygit
km.n {
  key = '<leader>gl',
  action = ':LazyGit<CR>',
  desc = 'Open Lazygit',
}
