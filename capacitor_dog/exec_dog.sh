#!/bin/bash

authToken=`curl -L -c cookies.txt --silent 'http://cloud-capacitor.herokuapp.com' | grep '_token" type=' | sed 's;\(^.*\)value="\(.*\)".*;\2;g'`

#echo $authToken

#curl -L -c cookies.txt -b cookies.txt --silent --data 'sla=20000&graph_mode=capacity&workloadlist[]=600&workloadlist[]=700&workload_approach=optimistic&configuration_approach=conservative&commit=Execute' --data-urlencode authenticity_token=$authToken 'http://cloud-capacitor.herokuapp.com/eval_performance'

#curl -L -c cookies.txt -b cookies.txt --silent --data 'sla=50000&graph_mode=cost&workloadlist[]=100&workloadlist[]=200&workloadlist[]=300&workloadlist[]=400&workloadlist[]=500&workloadlist[]=600&workloadlist[]=700&workloadlist[]=800&workloadlist[]=900&workloadlist[]=1000&workload_approach=random&configuration_approach=random&commit=Execute' --data-urlencode authenticity_token=$authToken 'http://cloud-capacitor.herokuapp.com/eval_performance' >> opa.html

declare -a graph=("capacity" "cost")
declare -a wkl_app=("optimistic" "conservative" "pessimistic" "random")
declare -a cfg_app=("optimistic" "conservative" "pessimistic" "random")
declare -a slas=(10000 20000 30000 40000 50000 60000 70000 80000 90000 100000)
workload='workloadlist[]=100&workloadlist[]=200&workloadlist[]=300&workloadlist[]=400&workloadlist[]=500&workloadlist[]=600&workloadlist[]=700&workloadlist[]=800&workloadlist[]=900&workloadlist[]=1000'
now=$(date +%s)
header="sla,OO,OC,OP,OR,CO,CC,CP,CR,PO,PC,PP,PC,RO,RC,RP,RR"

for graph_mode in "${graph[@]}"
do
	echo "$header" > "results/$now-$graph_mode-execution.csv"
	echo "$header" > "results/$now-$graph_mode-cost.csv"

	for sla in "${slas[@]}"
	do
		line="$sla"
		line_cost="$sla"
   		for workload_approach in "${wkl_app[@]}"
   		do
	   		for configuration_approach in "${cfg_app[@]}"
	   		do
			   name="results/$now-$graph_mode-$sla-$workload_approach-$configuration_approach.html"
			   param="sla=$sla&graph_mode=$graph_mode&$workload&workload_approach=$workload_approach&configuration_approach=$configuration_approach&commit=Execute"
			   curl -L -c cookies.txt -b cookies.txt --silent --data "$param"  --data-urlencode authenticity_token=$authToken 'http://cloud-capacitor.herokuapp.com/eval_performance' >> "$name"
			   exec_num=`cat $name |grep 'Number'| sed 's;^.* \([0-9].*\);\1;g'`
			   line="$line,$exec_num"
			   exec_cost=`cat $name |grep 'total '| sed 's;^.* \([0-9].*\);\1;g'`
			   line_cost="$line_cost,$exec_cost"

			   sed -i 's;\/assets;..\/assets;g' $name
		   	done
	   	done
		echo "$line" >> "results/$now-$graph_mode-execution.csv"
		echo "$line_cost" >> "results/$now-$graph_mode-cost.csv"
   	done
done
