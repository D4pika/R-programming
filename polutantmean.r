polutantmean<-function(directory,polutant, id=1:332){
      if(polutant!='sulfate' && polutant!='nitrate')
            return(paste("invalid pollutant", polutant))

      data<-NULL
      clean_data<-NULL
     # if(grep("specdata", directory)==1)
           # directory<-("./specdata/ ")
      filenames<-file.path(directory, paste(sprintf("%03d",id),".csv",sep=""))
      for (file in filenames){
            data<-read.csv(file)[polutant]
            clean_data<-c(clean_data,data[!is.na(data)])
      }
      mean(clean_data)
}
polutantmean("specdata", "sulfate", 1:10)
polutantmean("specdata", "nitrate", 70:72)
polutantmean("specdata", "sulfate", 34)
polutantmean("specdata", "nitrate")