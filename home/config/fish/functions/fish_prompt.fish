function fish_prompt --description 'Write out the prompt'
  set -l laststatus $status
  # Disable PWD shortening by default.
  set -q fish_prompt_pwd_dir_length; or set -lx fish_prompt_pwd_dir_length 0
  if test ! $laststatus -eq 0
    set_color --reset -u -f red; printf 'Exit code'
    set_color --reset -d; printf ':'
    set_color --reset -o -f white; printf '%s\n' $laststatus;
  end
  set_color --reset -o -f green; printf '%s' $USER;
  set_color --reset -d; printf '@';
  set_color --reset -o -f green; printf '%s' $(hostname);
  set_color --reset -d; printf ':';
  set_color --reset -o -f yellow; printf '%s' $(prompt_pwd);
  if git rev-parse 2>/dev/null
    set -l git_branch $(command git symbolic-ref HEAD 2>/dev/null | string replace 'refs/heads/' ''; or command git describe --always HEAD 2>/dev/null;);
    set -l git_changes (command git status --porcelain --untracked-files=all)
    set -l git_s_count (count (string match -r '^[^ ?].*' -- $git_changes))
    set -l git_u_count (count (string match -r '^.[^ ].*' -- $git_changes))
    set_color --reset -d; printf '<';
    set_color --reset -f blue; printf '%s' "$git_branch";
    set_color --reset -d; printf '|';
    set_color --reset -f blue; printf '%d' $git_s_count;
    set_color --reset -d; printf ',';
    set_color --reset -f blue; printf '%d' $git_u_count;
    set_color --reset -d; printf '>';
  end
  set_color --reset -d; printf '$'
  set_color normal
end
