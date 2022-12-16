library(phytools)
library(ggtree)
library(ggplot2)
library(MASS)
library(magrittr)
library(tidyverse)
#######################R Scripy Phylo Bio##################################
#######################################
### inferring the phylogeny ###
#######################################
#read file from IQTREE
tree = read.tree("Pleth_final_cytb.aligned.fasta.uniqueseq.phy.treefile")

#####highlighting clades in the tree###
#plot tree so you can see the nodes only, make sure to note the nodes you want to highlight
ggtree(tree) + geom_text(aes(label=node), hjust=-.3)

#show the tree with taxons label to make sure the nodes match up 
ggtree(tree) + geom_tiplab()

#get correct internal nodes and label tree by clade (light green is glutinosus, pink is cinereus, and light blue is wehleri/welleri)
cytb_plot_highlights <- ggtree(tree) + 
  geom_tiplab() + 
  geom_hilight(node=87, fill="light green") + 
  geom_hilight(node=81, fill="pink") +
  geom_highlight(node = 74, fill = "light blue") +
  geom_highlight(node= 75, fill = "light blue") +
  nodelabels(tree$node.label, frame="none")
cytb_plot_highlights

#####plot the tree showing bootstraps and edit so tree fits well
cytb_plot <- plot(tree,no.margin=TRUE,edge.width=2,cex=0.7)
cytb_plot <- nodelabels(tree$node.label, frame="none")
cytb_plot

##############same thing but with nd2 gene###########
#read file 
trees = read.tree("Pleth_final_nd2.aligned.fasta.1.treefile")

###highlighting clades in the tree########
#plot tree so you can see the nodes only, make sure to note the nodes you want to highlight
ggtree(trees) + geom_text(aes(label=node), hjust=-.3)

#show the tree with taxons label to make sure the nodes match up 
ggtree(trees) + geom_tiplab()

#get correct internal nodes and label tree by clade (light green is glutinosus, pink is cinereus, and light blue is wehleri/welleri)
nd2_highlights <- ggtree(trees) + 
  geom_tiplab() + 
  geom_hilight(node=32, fill="light green") + 
  geom_hilight(node=39, fill="light green") + 
  geom_hilight(node=33, fill="light green") + 
  geom_hilight(node=52, fill="light green") + 
  geom_hilight(node=82, fill="light green") + 
  geom_hilight(node=38, fill="light green") + 
  geom_hilight(node=37, fill="light green") + 
  geom_hilight(node=85, fill="light green") + 
  geom_hilight(node=40, fill="light green") +
  geom_hilight(node=43, fill="light green") + 
  geom_hilight(node=44, fill="light green") + 
  geom_hilight(node=66, fill="pink") +
  geom_highlight(node = 79, fill = "light blue") +
  geom_highlight(node = 78, fill = "light blue") +
  geom_highlight(node = 25, fill = "light blue") +
  nodelabels(tree$node.label, frame="none")
nd2_highlights

#####plot the tree showing bootstraps and edit so tree fits well
nd2_plot <- plot(trees,no.margin=TRUE,edge.width=2,cex=0.7)
nd2_plot <- nodelabels(tree$node.label, frame="none")
nd2_plot

#######################################
### plotting a continuous character ###
########################################set desired working directory
#load and root tree
tree<-read.tree(file="Final_Oct22.tre")

#extra code to help with pruning tree to match your data
#write the tip names to a file 
write.csv(tree$tip.labels)

#delete the first row that are just numbers so that the first column are the tip names with data in the subsequent rows
mydata<-read.csv(file="Tpref_PhyloBio.csv",header=TRUE)

#save species names to an object
species<-as.matrix(mydata)[,1]

#prune the tree down to the species in this list
ptree<-drop.tip(tree, tree$tip.label[-na.omit(match(species, tree$tip.label))])
plot(ptree)
#reload data with row names (assumes first columns are species names that match the phylogeny, with traits in subsequent columns)
mydata<-read.csv(file="Tpref_PhyloBio.csv",header=TRUE,row.names=1)

#######################################
### plotting the traits ##

#specify a continuous trait as its own object 
x <- setNames(mydata$Tpref_50, rownames(mydata))

#start by using the generic function to estimate the evolutionary history
#of the trait using Maximum Likelihood
obj<-contMap(ptree, x)

#fine tune the plot using switching colors so red is hotter temperatures and blue is cooler temperatures
n<-length(obj$cols)
obj$cols[1:n]<-colorRampPalette(c("deepskyblue", "springgreen","yellow", "red"),space="Lab")(n)
Tpref_PhyloBio <- plot(obj,fsize=0.7)
Tpref_PhyloBio

#######################################
### repeat for CTmax ###

#write the tip names to a file 
write.csv(tree$tip.labels)

#delete the first row that are just numbers so that the first column are the tip names with data in the subsequent rows
mydata<-read.csv(file="CTmaxPleth.csv",header=TRUE)

#save species names to an object
species<-as.matrix(mydata)[,1]

#prune the tree down to the species in this list
ptree<-drop.tip(tree, tree$tip.label[-na.omit(match(species, tree$tip.label))])

#reload data with row names (assumes first columns are species names that match the phylogeny, with traits in subsequent columns)
mydata<-read.csv(file="CTmaxPleth.csv",header=TRUE,row.names=1)



#######################################
### plotting the traits ##

#specify a continuous trait as its own object (need to change 'trait' to match column name)
x <- setNames(mydata$CTMax, rownames(mydata))

#start by using the generic function (sufficient but ugly) to estimate the evolutionary history
#of the trait using Maximum Likelihood
obj<-contMap(ptree, x)

#fine tune the plot using a circular tree and whatever colors you prefer (note that you can specify fewer or more colors)

n<-length(obj$cols)
obj$cols[1:n]<-colorRampPalette(c("deepskyblue", "springgreen","yellow", "red"),space="Lab")(n)
CTmax_PhyloBio <- plot(obj,fsize=0.7)
CTmax_PhyloBio

#######################################
### repeat for CTmin ###

#write the tip names to a file 
write.csv(tree$tip.labels)

#delete the first row that are just numbers so that the first column are the tip names with data in the subsequent rows
mydata<-read.csv(file="CTminPleth.csv",header=TRUE)

#save species names to an object
species<-as.matrix(mydata)[,1]

#prune the tree down to the species in this list
ptree<-drop.tip(tree, tree$tip.label[-na.omit(match(species, tree$tip.label))])

#reload data with row names (assumes first columns are species names that match the phylogeny, with traits in subsequent columns)
mydata<-read.csv(file="CTminPleth.csv",header=TRUE,row.names=1)



#######################################
### plotting the traits ##

#specify a continuous trait as its own object (need to change 'trait' to match column name)
x <- setNames(mydata$CTMin, rownames(mydata))

#start by using the generic function (sufficient but ugly) to estimate the evolutionary history
#of the trait using Maximum Likelihood
obj<-contMap(ptree, x)

#fine tune the plot using a circular tree and whatever colors you prefer (note that you can specify fewer or more colors)

n<-length(obj$cols)
obj$cols[1:n]<-colorRampPalette(c("deepskyblue", "springgreen","yellow", "red"),space="Lab")(n)
CTmin_PhyloBio <- plot(obj,fsize=0.7)
CTmin_PhyloBio













