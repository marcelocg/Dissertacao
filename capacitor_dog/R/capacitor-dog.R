setwd("C:/Users/Matheus/VMS/crawler/repos/crawler/examples/wordpress/R/dog")
aux = read.csv("1414438523-capacity-cost.csv", header = FALSE, stringsAsFactors = FALSE)
execution = read.csv("1414438523-capacity-execution.csv", header = FALSE, stringsAsFactors = FALSE)


rows <- seq(2, nrow(aux), by=1)
cols <- seq(2, ncol(aux), by=1)


sla <- c()
heuristic <- c()
exec <- c()
cost <- c()
for (r in rows){
  for (c in cols){
    sla[length(sla)+1] <- aux[r, 1]
    heuristic[length(heuristic)+1] <- aux[1, c]
    cost[length(cost)+1] <- aux[r, c]
    exec[length(exec)+1] <- execution[r, c]
  }
}

capacity <- data.frame(heuristic, sla, exec, cost)

aux = read.csv("1414438523-cost-cost.csv", header = FALSE, stringsAsFactors = FALSE)
execution = read.csv("1414438523-cost-execution.csv", header = FALSE, stringsAsFactors = FALSE)
sla <- c()
heuristic <- c()
exec <- c()
cost <- c()
for (r in rows){
  for (c in cols){
    sla[length(sla)+1] <- aux[r, 1]
    heuristic[length(heuristic)+1] <- aux[1, c]
    cost[length(cost)+1] <- aux[r, c]
    exec[length(exec)+1] <- execution[r, c]
  }
}

cost <- data.frame(heuristic, sla, exec, cost)

write.table(capacity, "1414438523-capacity.csv", sep=",")
write.table(cost, "1414438523-cost.csv", sep=",")
