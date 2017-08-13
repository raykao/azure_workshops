#! /bin/bash

connectionString = $(az storage account show-connection-string -n <storage_name> -g linuxtraining --query 'connectionString' -o tsv)

if [[ $current_env_conn_string == "" ]]; then  
    echo "Couldn't retrieve the connection string."
else
    az storage share create --name linuxtraining --quota 2048 --connection-string $connectionString 1>/dev/null
fi

# sudo mount -t cifs //<storage_name>.file.core.windows.net/linuxtraining [mount point] -o vers=3.0,username=<account_name>,password=<account_key>,dir_mode=0777,file_mode=0777,sec=ntlmssp