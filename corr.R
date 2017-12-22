corr<-function(directory, threshold=0){
  cor<-NULL
  F_names<-NULL
  for (f in list.files(directory, pattern="*.csv", full.names = TRUE)){
    data<-read.csv(f)
    completeC<-data[complete.cases(data),]
    if(nrow(completeC)>threshold)
    {
      s<-completeC$sulfate
      n<-completeC$nitrate
      F_names<-c(F_names,f)
      cor<-c(cor,cor(s,n))
    }
  }
  cor
}

cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
#set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))