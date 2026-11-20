display_help_sh(is_requested) := if is_requested == "true" { "just --usage " + quote(recipe_name()) + "; exit;" } else { "" }
display_help_py(is_requested) := if is_requested == "true" { "import subprocess; import sys; sys.exit(subprocess.call(['just', '--usage', " + quote(recipe_name()) + "]))" } else { "" }
