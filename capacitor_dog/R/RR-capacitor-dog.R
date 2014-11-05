setwd("M:/users/matheus/crawler/dog")
aux = read.csv("1414458286-capacity-cost.csv", header = FALSE, stringsAsFactors = FALSE)
execution = read.csv("1414458286-capacity-execution.csv", header = FALSE, stringsAsFactors = FALSE)


rows <- seq(2, nrow(aux), by=1)
cols <- seq(2, ncol(aux), by=1)

sla <- c()
heuristic <- c()
exec <- c()
cost <- c()
num <- c()
for (r in rows){
  for (c in cols){
    sla[length(sla)+1] <- aux[r, 1]
    heuristic[length(heuristic)+1] <- "RR"
    num[length(num)+1] <- c - 1
    cost[length(cost)+1] <- mean(as.numeric(aux[r,2:c]))
    exec[length(exec)+1] <- mean(as.numeric(execution[r,2:c]))
  }
}

capacity <- data.frame(heuristic, sla, exec, cost, num)

aux = read.csv("1414458286-cost-cost.csv", header = FALSE, stringsAsFactors = FALSE)
execution = read.csv("1414458286-cost-execution.csv", header = FALSE, stringsAsFactors = FALSE)
sla <- c()
heuristic <- c()
exec <- c()
cost <- c()
num <- c()
for (r in rows){
  for (c in cols){
    sla[length(sla)+1] <- aux[r, 1]
    heuristic[length(heuristic)+1] <- "RR"
    num[length(num)+1] <- c - 1
    cost[length(cost)+1] <- mean(as.numeric(aux[r,2:c]))
    exec[length(exec)+1] <- mean(as.numeric(execution[r,2:c]))
  }
}

cost <- data.frame(heuristic, sla, exec, cost, num)

write.table(capacity, "1414458286-capacity.csv", sep=",")
write.table(cost, "1414458286-cost.csv", sep=",")


require(ggplot2)
capacity = read.csv("1414458286-capacity.csv", header = TRUE, stringsAsFactors = FALSE)
capacity$sla <- factor(capacity$sla, order=TRUE)
#capacity$num <- factor(capacity$num, order=TRUE)
capacity$heuristic <- factor(capacity$heuristic, order=TRUE)

cost = read.csv("1414458286-cost.csv", header = TRUE, stringsAsFactors = FALSE)
cost$sla <- factor(cost$sla, order=TRUE)
#cost$num <- factor(cost$num, order=TRUE)
cost$heuristic <- factor(cost$heuristic, order=TRUE)

graph_base <- capacity

pdf("RR-capacitor.pdf", width = 9.5, height = 6)

ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = exec), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("Executions") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Graph - RR")


ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = cost), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("U$/Hour") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Graph - RR")


graph_base <- subset(graph_base, num <= 250)

ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = exec), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("Executions") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Graph - RR")


ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = cost), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("U$/Hour") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Graph - RR")


graph_base <- subset(graph_base, num <= 150)

ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = exec), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("Executions") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Graph - RR")


ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = cost), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("U$/Hour") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Graph - RR")

graph_base <- subset(graph_base, num <= 100)

ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = exec), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("Executions") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Graph - RR")


ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = cost), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("U$/Hour") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Graph - RR")

graph_base <- subset(graph_base, num <= 50)

ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = exec), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("Executions") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Graph - RR")


ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = cost), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("U$/Hour") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Graph - RR")


graph_base <- cost

ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = exec), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("Executions") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Cost - RR")


ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = cost), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("U$/Hour") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Cost - RR")


graph_base <- subset(graph_base, num <= 250)

ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = exec), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("Executions") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Cost - RR")


ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = cost), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("U$/Hour") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Cost - RR")


graph_base <- subset(graph_base, num <= 150)

ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = exec), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("Executions") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Cost - RR")


ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = cost), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("U$/Hour") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Cost - RR")

graph_base <- subset(graph_base, num <= 100)

ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = exec), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("Executions") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Cost - RR")


ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = cost), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("U$/Hour") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Cost - RR")

graph_base <- subset(graph_base, num <= 50)

ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = exec), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("Executions") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Cost - RR")


ggplot(graph_base, aes(x = num)) +  
  geom_line(aes(group=sla, colour=sla, y = cost), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_continuous("Iterations") + 
  scale_y_continuous("U$/Hour") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Cost - RR")

dev.off()


capacity = read.csv("1414458286-capacity.csv", header = TRUE, stringsAsFactors = FALSE)
cost = read.csv("1414458286-cost.csv", header = TRUE, stringsAsFactors = FALSE)

capacity <- subset(capacity, num == 50 | num == 10 | num == 100)
capacity$heuristic <- mapply(function(x,y){paste(x,y,sep="")}, capacity$heuristic, capacity$num)

cost  <- subset(cost, num == 50 | num == 10 | num == 100)
cost$heuristic <- mapply(function(x,y){paste(x,y,sep="")}, cost$heuristic, cost$num)

write.table(data.frame(capacity$heuristic, capacity$sla, capacity$exec, capacity$cost), "capacity.csv", sep=",")
write.table(data.frame(cost$heuristic, cost$sla, cost$exec, cost$cost), "cost.csv", sep=",")
