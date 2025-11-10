function git_change_worktree
  set worktree (git worktree list | fzf)
  # BSD style `cut` does not have long-form arguments
  set path (echo "$worktree" | cut -f 1 -d ' ')

  if test -d "$path"
    cd $path
  end
end
