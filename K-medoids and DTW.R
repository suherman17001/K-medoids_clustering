library(dtw)
library(clusterSim)
library(cluster)
library(fpc)
library(tidyverse)
library(factoextra)
library(dendextend)
library(kmed)
## Input Data ##
dataku=read.csv("hasil1.csv",header=T,sep=";") #input dari data "24 Desember 2020.csv"
attach(dataku)
summary(dataku)
## Dynamic Time Warping Distance ##
data1=dataku[,-1] #menghilangkan variabel 1 pada Data1
data=data1[,-1]
names(data)
d=dist(data,method="DTW")
d<-as.matrix(d)

## pemilihan banyak kelompok dengan pseudo F ##
a<-fastkmed(d,2)
b<-fastkmed(d,3)
c<-fastkmed(d,4)
e<-fastkmed(d,5)
f<-fastkmed(d,6)
g<-fastkmed(d,7)
h<-fastkmed(d,8)
i<-fastkmed(d,9)
j<-fastkmed(d,10)
index.G1(d,a$cluster)
index.G1(d,b$cluster)
index.G1(d,c$cluster)
index.G1(d,e$cluster)
index.G1(d,f$cluster)
index.G1(d,g$cluster)
index.G1(d,h$cluster)
index.G1(d,i$cluster)
index.G1(d,j$cluster)

## K-Medoids Clustering ##
hasil1<- fastkmed(d,4,2)
## Hasil Pengelompokan ##
final=data.frame(dataku[,-(3:300)], hasil$cluster)
write.csv(final,"D://skripsi/hasil pengelompokan 1.csv")
View(final)

