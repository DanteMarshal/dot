function ssc --wraps=systemctl --description 'Alias for "sudo systemctl"'
    sudo systemctl $argv
end
