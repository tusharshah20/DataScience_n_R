#Working with rhadoop and rmr
#refer: https://github.com/ajaykuma/DataScience_n_R/blob/master/Hadoop_Setup_n_Integ_R_Win.txt

Sys.setenv("HADOOP_PREFIX"="C:\\Hadoop\\hadoop-2.6.5")
Sys.setenv("HADOOP_CMD"="C:\\Hadoop\\hadoop-2.6.5\\bin\\hadoop")
install.packages(c("rJava", "Rcpp", "RJSONIO", "bitops", "digest", 
                   "functional", "stringr", "plyr", "reshape2", "dplyr", 
                   "R.methodsS3", "caTools", "Hmisc"))

## find your R libraries
.libPaths()

## check which library a package was installed into
system.file(package="functional")


install.packages("data.table")
install.packages("C:\\Users\\Win10\\Downloads\\rhdfs_1.0.8.tar.gz", repos=NULL, type="source")
install.packages("C:\\Users\\Win10\\Downloads\\rmr2_3.3.1.tar.gz", repos=NULL, type="source")

Sys.setenv("HADOOP_STREAMING"="C:\\Hadoop\\hadoop-2.6.5\\share\\hadoop\\hadoop-streaming-2.6.5.jar")

#Running Hadoop Job
library(rmr2) 

## map function
map <- function(k,lines) {
  words.list <- strsplit(lines, '\\s') 
  words <- unlist(words.list)
  return( keyval(words, 1) )
}

## reduce function
reduce <- function(word, counts) { 
  keyval(word, sum(counts))
}

wordcount <- function (input, output=NULL) { 
  mapreduce(input=input, output=output, input.format="text", 
            map=map, reduce=reduce)
}


## delete previous result if any
#system("/Users/hadoop/hadoop-1.1.2/bin/hadoop fs -rmr wordcount/out")
#create a directory wordcount under hdfs://xxx/user/username/
#create a directory data under hdfs://xxx/user/username/wordcount & add a file here.

## Submit job
hdfs.root <- 'wordcount'
hdfs.data <- file.path(hdfs.root, 'data') 
hdfs.out <- file.path(hdfs.root, 'out') 
out <- wordcount(hdfs.data, hdfs.out)

## Fetch results from HDFS
results <- from.dfs(out)

## check top 30 frequent words
results.df <- as.data.frame(results, stringsAsFactors=F) 
colnames(results.df) <- c('word', 'count') 
head(results.df[order(results.df$count, decreasing=T), ], 30)


