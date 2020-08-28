#!/bin/bash
#
# Kudos: https://stackoverflow.com/a/47716485

# Prepare variables
TABLE=$1
SQL_EXISTS=$(printf 'SHOW TABLES LIKE "%s"' "$TABLE")
SQL_IS_EMPTY=$(printf 'SELECT 1 FROM %s LIMIT 1' "$TABLE")

# Credentials
USERNAME=$2    
PASSWORD=$3
HOSTNAME=$4
DATABASE=$5

echo "Checking if table <$TABLE> exists ..."

# Check if table exists
if [[ $(/usr/bin/mysql -h ${HOSTNAME} -u ${USERNAME} -p${PASSWORD} -e "$SQL_EXISTS" ${DATABASE}) ]]
then
    echo "Table exists ..."

    # Check if table has records    
    if [[ $(/usr/bin/mysql -h ${HOSTNAME} -u ${USERNAME} -p${PASSWORD} -e "$SQL_IS_EMPTY" ${DATABASE}) ]]
    then
        echo "Table has records ..."
    else
        echo "Table is empty ..."
        echo "You need to handel this manually ..."
    fi
else
    echo "Table not exists ..."
    echo "Initializing ..."
    /usr/bin/mysql -h ${HOSTNAME} -u ${USERNAME} -p${PASSWORD} ${DATABASE} < /opt/schemas/001-create-schema.sql
    /usr/bin/mysql -h ${HOSTNAME} -u ${USERNAME} -p${PASSWORD} ${DATABASE}  < /opt/schemas/002-create-admin-user.sql
fi