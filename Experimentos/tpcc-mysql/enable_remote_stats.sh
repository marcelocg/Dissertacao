ssh $1 "sed -i -e 's/ENABLED=\"false\"/ENABLED=\"true\"/g' /etc/default/sysstat"
