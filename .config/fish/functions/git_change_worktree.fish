function git_change_worktree
  set worktree (git worktree list | fzf)
  set path (echo "$worktree" | cut --fields 1 --delimiter ' ')

  if test -d "$path"
    cd $path
  end
end
