#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then 
    echo "Please run this script with sudo access..."
    exit 1
fi

validate() {
    if [ $1 -ne 0 ]; then 
        echo "${2} failed..."
        exit 1
    else
        echo "${2} successful..."
    fi
}

echo "proceding...."
dnf install nginx -y
# if [ $? -ne 0 ]; then
#     echo "nginx installation failed..."
#     exit 1
# else
#     echo "nginx installation successful..."
# fi
validate $? "nginx installation"


dnf install mysql -y 
validate $? "mysql client installation"
# if [ $? -ne 0 ]; then
#     echo "mysql client installation failed..."
#     exit 1
# else
#     echo "mysql client installation successful..."
# fi

echo "Still proceeded"