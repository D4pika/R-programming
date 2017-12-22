complete<-function(directory, id=1:332){
  complete_cases<-NULL
  complete_id<-NULL
  for (i in id){
    data<- read.csv(file.path(directory, paste(sprintf("%03d", i),".csv", sep= "")))
    completeC<-data[complete.cases(data),]
    complete_cases<-c(complete_cases, nrow(completeC))
    complete_id<-c(complete_id, i)
    
  }
  
  data.frame(id=complete_id, nobs=complete_cases)
}

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
