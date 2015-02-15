name "starter"
description "An example Chef role"
run_list "recipe[httpd]"
override_attributes({
  "starter_name" => " ",
})
