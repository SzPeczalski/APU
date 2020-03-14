library(ahp)
library(data.tree)
setwd("d:/Users/User1/Documents/R Studio")
treeAhp <- Load("iphones.ahp")

print(treeAhp, filterFun = isNotLeaf)

Calculate(treeAhp)
print(treeAhp, priority = function(x) x$parent$priority["Total", x$name])
Visualize(treeAhp)
Analyze(treeAhp)
AnalyzeTable(treeAhp)
