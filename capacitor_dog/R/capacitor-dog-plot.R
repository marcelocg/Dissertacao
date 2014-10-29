setwd("C:/Users/Matheus/VMS/crawler/repos/crawler/examples/wordpress/R/dog")
require(ggplot2)
capacity = read.csv("1414438523-capacity.csv", header = TRUE, stringsAsFactors = FALSE)
capacity$sla <- factor(capacity$sla, order=TRUE)
capacity$heuristic <- factor(capacity$heuristic, order=TRUE)

cost = read.csv("1414438523-cost.csv", header = TRUE, stringsAsFactors = FALSE)
cost$sla <- factor(cost$sla, order=TRUE)
cost$heuristic <- factor(cost$heuristic, order=TRUE)

pdf("Execution_x_Prediction.pdf", width = 9.5, height = 6)

graph_base <- capacity

graph_base <- subset(graph_base, heuristic != "CR")
graph_base <- subset(graph_base, heuristic != "OR")
graph_base <- subset(graph_base, heuristic != "PR")
graph_base <- subset(graph_base, heuristic != "RR")
graph_base <- subset(graph_base, heuristic != "RC")
graph_base <- subset(graph_base, heuristic != "RO")
graph_base <- subset(graph_base, heuristic != "RP")


ggplot(graph_base, aes(x = sla)) +
  geom_point(size=3, aes(colour=heuristic, y = exec, shape=heuristic), fill="white") +  
  scale_shape_manual(values=c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16))+
  geom_line(aes(group=heuristic, colour=heuristic, y = exec), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_discrete("Sla") + 
  scale_y_continuous("Execution") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Graph")

ggplot(graph_base, aes(x = sla)) +
  geom_point(size=3, aes(colour=heuristic, y = cost, shape=heuristic), fill="white") +  
  scale_shape_manual(values=c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16))+
  geom_line(aes(group=heuristic, colour=heuristic, y = cost), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_discrete("Sla") + 
  scale_y_continuous("U$/Hour") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Capacity Graph")


graph_base <- cost

graph_base <- subset(graph_base, heuristic != "CR")
graph_base <- subset(graph_base, heuristic != "OR")
graph_base <- subset(graph_base, heuristic != "PR")
graph_base <- subset(graph_base, heuristic != "RR")
graph_base <- subset(graph_base, heuristic != "RC")
graph_base <- subset(graph_base, heuristic != "RO")
graph_base <- subset(graph_base, heuristic != "RP")


ggplot(graph_base, aes(x = sla)) +
  geom_point(size=3, aes(colour=heuristic, y = exec, shape=heuristic), fill="white") +  
  scale_shape_manual(values=c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16))+
  geom_line(aes(group=heuristic, colour=heuristic, y = exec), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_discrete("Sla") + 
  scale_y_continuous("Execution") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Cost Graph")

ggplot(graph_base, aes(x = sla)) +
  geom_point(size=3, aes(colour=heuristic, y = cost, shape=heuristic), fill="white") +  
  scale_shape_manual(values=c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16))+
  geom_line(aes(group=heuristic, colour=heuristic, y = cost), linetype="solid", size=1) +
  theme_bw(base_size = 12, base_family = "") +
  scale_x_discrete("Sla") + 
  scale_y_continuous("U$/Hour") + 
  theme(
    title    = element_text(face="bold", size = 14),
    axis.title  = element_text(face="bold", size = 12)
  )+ ggtitle("Cost Graph")

dev.off()