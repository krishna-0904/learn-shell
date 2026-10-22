#/bin/bash

### special variables ###

echo "All args are passed to script: $@"
echo "Number of args passed to script: $#"
echo "First variable passed: $1"
echo "Script name: $0"
echo "Realpath: $(realpath $0)"
echo "Who is running current script: $USER"