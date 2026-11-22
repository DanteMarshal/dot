function scu --wraps=systemctl --description 'Alias for "systemctl --user"'
    systemctl --user $argv
end
