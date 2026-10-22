#/bin/bash

### special variables ###

echo "All args are passed to script: $@"
echo "Number of args passed to script: $*"
echo "First variable passed: $1"
echo "Script name: $0"
echo "Realpath: $(realpath $0)"
echo "Who is running current script: $USER"
echo "Directory of the current script: $PWD"
echo "Home directory of current user: $HOME"
echo "PID of current script: $$"
sleep 10 &
echo "PID of last background process: $!"
wait $! #scripts waits until $! process is completed
echo "Line number: $LINENO"
echo "previous command exit status: $?"
echo "Total time executed for this script: $SECONDS"