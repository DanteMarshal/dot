function fish_prompt --description 'Write out the prompt'
  set -l laststatus $status
  # Disable PWD shortening by default.
  set -q fish_prompt_pwd_dir_length; or set -lx fish_prompt_pwd_dir_length 0
  if test ! $laststatus -eq 0
    set_color -f red
    printf 'Exit Code: %s\n' $laststatus
    set_color --reset
  end
  set_color -f green; printf '%s' $USER;
  set_color --reset; printf ' @ ';
  set_color -f green; printf '%s' $(hostname);
  set_color --reset; printf ' : ';
  set_color -f yellow; printf '%s' $(prompt_pwd);
  if git rev-parse 2>/dev/null
    set -l git_branch $(command git symbolic-ref HEAD 2>/dev/null | string replace 'refs/heads/' ''; or command git describe --always HEAD 2>/dev/null;);
    set_color --reset; printf ' | ';
    set_color -f blue; printf '%s' "$git_branch";
  end
  set_color --reset; printf ' $ '
end
