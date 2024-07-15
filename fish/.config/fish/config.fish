set -U fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set __fish_git_prompt_show_informative_status 1
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showuntrackedfiles 1


bind \ch h
bind -k nul workspace

starship init fish | source
