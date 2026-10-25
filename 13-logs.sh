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

echo "proceding...."
dnf install nginx -y &>> $logs_file
validate $? "nginx installation"


dnf install mysql -y &>> $logs_file
validate $? "mysql client installation"

echo "Script execution completed at $(date +"%F %T")" &>> $logs_file
