require "base64"

# encode = '=?utf-8?B?S2xvbmRpa2UgQnJhbmRzIEFjY291bnQgQ29uZmlybWF0aW9u?='
encode = "tylerflint@gmail.com"

match = /=\?utf-8\?B\?(.+)\?=/

if encode =~ match
  puts Base64.decode64($1)
else
  puts encode
end
