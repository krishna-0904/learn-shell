#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell-logs"
logs_file="${logs_folder}/${0}.log"


if [ $user_id -ne 0 ]; then 
    echo "Please run this script with sudo access..."
    exit 1
fi

mkdir -p $logs_folder
echo "Script execution started at $(date +"%F %T")" &>> $logs_file

validate() {
    if [ $1 -ne 0 ]; then 
        echo "${2} failed..." | tee -a $logs_file
        exit 1
    else
        echo "${2} successful..." | tee -a $logs_file
    fi
}

for package in $@
do
    dnf list installed ${package} &>> $logs_file
    if [ $? -ne 0 ]; then 
        echo "Going to install: ${package}"
        dnf install ${package} -y &>> $logs_file
        validate $? "Installing ${package}"
    else 
        echo "${package} is already installed...skipping"
    fi
done