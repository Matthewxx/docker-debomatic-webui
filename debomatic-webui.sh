#!/bin/bash
myip=$(hostname -i)
sed -i "s/localhost/$myip/g" user.config
coffee debomatic-webui -c user.config
