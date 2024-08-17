# Data Types
# String[5]: 5 = Max Number Of Characters
# String[5,10]: = Characters Between 5 & 10
# Float
# Integer
# Array
# Hash
# Regexp: Regular Expression
# Undef: Undefined Value
# Variant[String, Integer]: String or Integer
# Enum['yes', 'no']: yes or no
# Optional[String]: String or Undef

$username = 'arnoldokoth'
# Type Validation
if $username =~ String[4,20] {
    notify {"Hello, ${username}": }
}