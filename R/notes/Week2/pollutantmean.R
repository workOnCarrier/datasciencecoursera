getfilenameFromIndex <- function ( index ){
  strIndex <- paste(index,sep="")
  #print(strIndex)
  while(nchar(strIndex)<3){
    strIndex <- paste("0",strIndex,sep="")
  }
  strIndex
}
pollutantmean <- function ( directory, pollutant, id = 1:322 ){
  ## directory -- character vector of length 1 indicating location of 
  ##              the CSV files
  ## pollutant -- character vector of length 1 indicating name of the pollutant
  ##                for which calculation needs to be done
  ## id        -- integer vector indicating monitor id numbers to be used
  
  ## return -- mean of pollutant across all monitor list in the 'id' vector
  ##           ignoring 'NA'
  ## Note -> do not round the result
  monCount <- length(id)
  Vect<-c()
  #print ( paste("length of id:",length(id), "Value", id) )
  for ( idpos in 1:monCount ){
    strIdpos <- getfilenameFromIndex(id[idpos])

    my_filename<-file.path(getwd(),directory,paste(strIdpos,".csv",sep="",collapse = NULL)) 
    #print ( paste("Reading file:", my_filename) )
    my_dataset<-read.csv(my_filename )
    
    fullLen <- length(my_dataset[,pollutant])
    my_noNaDs <- my_dataset[!is.na(my_dataset[,pollutant]),]
    lessLen <- length(my_noNaDs[,pollutant])
    Vect <- c(Vect,my_noNaDs[,pollutant] )
    #print ( paste("total length of sample :", fullLen, "without NA:", lessLen," Vect length", length(Vect) ) )
  }
  meanVal <- mean(Vect)
  meanVal
}
