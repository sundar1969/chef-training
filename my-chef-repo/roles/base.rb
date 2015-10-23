name "base"
description "Base Server Role"
run_list "recipe[email_handler]", "recipe[motd]", "recipe[users]"
