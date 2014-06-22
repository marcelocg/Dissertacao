ssh $1 "sed -i -e 's/ENABLED=\"true\"/ENABLED=\"false\"/g' /etc/default/sysstat"
