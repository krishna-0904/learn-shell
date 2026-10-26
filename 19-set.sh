#!/bin/bash
set -e
user_id=$(id -u)
logs_folder="/var/log/shell-logs"
logs_file="${logs_folder}/${0}.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

trap 'echo "Error at $LINENO", command: "$BASH_COMMAND"' ERR

if [ $user_id -ne 0 ]; then 
    echo "Please run this script with sudo access..."
    exit 1
fi

mkdir -p $logs_folder
echo "Script execution started at $(date +"%F %T")" &>> $logs_file



for package in $@
do
    dnf list installed ${package} &>> $logs_file
    if [ $? -ne 0 ]; then 
        echo "Going to install: ${package}"
        dnf install ${package} -y &>> $logs_file
    else 
        echo -e "${package} is already installed...${Y}SKIPPING${N}"
    fi
done

echo "Script execution completed at $(date +"%F %T")" &>> $logs_file

