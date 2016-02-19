getfilenameFromIndex <- function ( index ){
  strIndex <- paste(index,sep="")
  #print(strIndex)
  while(nchar(strIndex)<3){
    strIndex <- paste("0",strIndex,sep="")
  }
  strIndex
}

complete<- function ( directory, id=1:332){
  ## directory -- character vector of lengh 1 indicating location of csv files
  ## id        -- integer vectorindicating monitor id to be used
  ## returns data frame of the form
  ##     id    nobs
  ##     11     1234
  ##     17     1234
  ##     ...
  monCount <- length(id)
  Vect<- vector(mode="integer",length=monCount)
  #print ( paste("length of id:",length(id), "Value", id) )
  for ( idpos in 1:monCount ){
    strIdpos <- getfilenameFromIndex(id[idpos])
    
    my_filename<-file.path(getwd(),directory,paste(strIdpos,".csv",sep="",collapse = NULL)) 
    # print ( paste("Reading file:", my_filename) )
    my_dataset<-read.csv(my_filename )
    
    my_noNaDs <- my_dataset[ !is.na(my_dataset[,1]) & !is.na(my_dataset[,2]) & !is.na(my_dataset[,3]) & !is.na(my_dataset[,4]),]
    lessLen <- length(my_noNaDs[,1])
    # print ( paste("without NA:", lessLen ) )
    Vect[idpos]<-lessLen
  }
  myMatrix<-cbind(id,Vect)
  myMatrix
}