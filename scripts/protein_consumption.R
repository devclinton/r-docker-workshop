food <- read.csv('../data/protein.csv')
head(food)

set.seed(123456789) ## to fix the random starting clusters
grpMeat <- kmeans(food[,c("WhiteMeat","RedMeat")], centers=3, nstart=10)
grpMeat

## list of cluster assignments
o=order(grpMeat$cluster)
data.frame(food$Country[o],grpMeat$cluster[o])

png('../output/cluster_red_white.png')
plot(food$Red, food$White, type="n", xlim=c(3,19), xlab="Red Meat", ylab="White Meat")
text(x=food$Red, y=food$White, labels=food$Country,col=grpMeat$cluster+1)
dev.off()

## same analysis, but now with clustering on all
## protein groups change the number of clusters to 7
set.seed(123456789)
grpProtein <- kmeans(food[,-1], centers=7, nstart=10)
o=order(grpProtein$cluster)
data.frame(food$Country[o],grpProtein$cluster[o])

png('../output/2d_cluster_represent.png')
library(cluster)
clusplot(food[,-1], grpProtein$cluster, main='2D representation of the Cluster solution', color=TRUE, shade=TRUE, labels=2, lines=0)
dev.off()

png('../output/dendrogram.png')
foodagg=agnes(food,diss=FALSE,metric="euclidian")
plot(foodagg, main='Dendrogram') ## dendrogram
dev.off()

png('../output/agglomerative_coeffiecient.png')
groups <- cutree(foodagg, k=4) # cut tree into 3 clusters
rect.hclust(foodagg, k=4, border="red")
dev.off()