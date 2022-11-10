---
  title: "Prelim Analysis: Final Project"
output:
  html_document: default
pdf_document: default
---

#load all the libraries
library(ape)
library(tidyverse)
library(magrittr)
library(ggplot2)
library(MASS)
library(magrittr)
library(phytools)

#################plot tree from iqtree###########################
phy = read.tree("Pleth_Prelim.aligned.fasta.treefile")
plot(phy)
write.tree((phy), "Pleth_Prelim.tre")
tree <- read.tree(file = "Pleth_Prelim.tre")

##############map continous traits onto the tree################
#get simulated/ collected data
mydata<-read.csv(file="Thermal_Prelim.csv",header=TRUE)

#delete the first row that are just numbers so that the first column are the tip names with data in the subsequent rows
mydata<-read.csv(file="Thermal_Prelim.csv",header=TRUE)

#write the tip names to a file (make sure these match those in your data file)
write.csv(tree$tip.label)

#save species names to an object
species<-as.matrix(mydata)[,1]

#reload data with row names (assumes first columns are species names that match the phylogeny, with traits in subsequent columns)
mydata<-read.csv(file="Thermal_Prelim.csv",header=TRUE, row.names=1)

#specify a continuous trait as its own object 
x <- setNames(mydata$CTMax, rownames(mydata))

#start by using the generic function  to estimate the evolutionary history
#of the trait using Maximum Likelihood
obj<-contMap(phy, x)

#fine tuning the plot using a rectangular right-facing tree and swapping colors (red for hotter temps, blue for cooler temps) 
n<-length(obj$cols)
obj$cols[1:n]<-colorRampPalette(c("deepskyblue", "springgreen","yellow", "red"),space="Lab")(n)
plot(obj,fsize=0.7)

##now mapping CTMin onto the tree ####
#specify a continuous trait as its own object 
x <- setNames(mydata$CTMin, rownames(mydata))

#start by using the generic function  to estimate the evolutionary history
#of the trait using Maximum Likelihood
obj<-contMap(phy, x)

#fine tuning the plot using a rectangular right-facing tree and swapping colors (red for hotter temps, blue for cooler temps) 
n<-length(obj$cols)
obj$cols[1:n]<-colorRampPalette(c("deepskyblue", "springgreen","yellow", "red"),space="Lab")(n)
plot(obj,fsize=0.7)
