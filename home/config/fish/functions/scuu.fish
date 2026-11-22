function scuu --wraps=systemctl --description 'Run systemctl --user as another user'
    if not set -q argv[1]
        echo 'Usage: scuu USER [SYSTEMCTL_ARGS...]' >&2
        return 2
    end

    set -l user $argv[1]
    set -e argv[1]
    sudo systemctl --user --machine="$user@.host" $argv
end
