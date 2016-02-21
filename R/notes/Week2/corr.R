


corr <- function (directory, threshold = 0) {
    fileList <- list.files(directory)
    #     sulfateVec <-c()
    #     nitrateVec <-c()
    corVec <- c()
    propMatrix <- complete(directory)
    filePropMatrix <- cbind(fileList,propMatrix)
    for (idpos in 1:length(filePropMatrix[,2])) {
        # print(paste( "Data:" ,filePropMatrix[idpos,] ," threshold", threshold, "\n") ) 
        if ( as.integer(filePropMatrix[idpos,"nobs"]) <= threshold) {
            #
        }else{
            my_filename <- filePropMatrix[idpos,1]
            # print (paste("file:", filePropMatrix[idpos,]))
            
            my_dataset <-
                read.csv(file.path (getwd(),directory,my_filename))
            my_noNAs <-
                my_dataset[!is.na(my_dataset[,1]) &
                               !is.na(my_dataset[,2]) &
                               !is.na(my_dataset[,3])&
                               !is.na(my_dataset[,4])
                           ,]
            
            filecor <- cor(my_noNAs[,"sulfate"],my_noNAs[,"nitrate"])
            corVec <- c(corVec,filecor)
            if ( is.na(filecor)){
                print(paste("NA cor from file:", filePropMatrix[idpos,1], "    nobs:",as.integer(filePropMatrix[idpos,"nobs"])))
                dput(my_noNAs,filePropMatrix[idpos,1])
            }
        }
        # print( paste("Sulfate vector lenght:",length(sulfateVec), " nitrate vec len:",length(nitrateVec) ) )
    }
# print( paste("Final: Sulfate vector lenght:",length(sulfateVec), " nitrate vec len:",length(nitrateVec)) )
# dput ( sulfateVec,file="SulfateVec.csv")
# dput ( nitrateVec, file="nitrateVec.csv")
# corVal <- cor (sulfateVec,nitrateVec)
# print(corVal)
corVec
}