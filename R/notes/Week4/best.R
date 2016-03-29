## Author   : Nitin Sharma
## Date     : Mar 29 2016
## Purpose  : This is the function that gives the best hostpital for the outcome criteria
## License  : The code in this file is for coursera exam. You are not authorized to copy 
##              or use this code in your projects / work

Nitinbest <- function ( state, outcome){
    ## Read outcome data
    information <- read.csv("outcome-of-care-measures.csv", na.strings = 'Not Available')    
    ## Check that state and outcome are both valid
    col_State <- 7
    col_factors <- c(11,17,23)
    names(col_factors) <- c("heart attack","heart failure", "pneumonia")

    colindexname = match(outcome,names(col_factors)) # replace with grep to handle case
    colindexint = match (outcome,col_factors)
    if (is.na(colindexname) && is.na(colindexint) ){
        print ("valid values for outcomea are:")
        print (names(col_factors))
        stop ("outcome parameter passed in the function is invalid")
    }
    statefind = match(state,information[,col_State])
    if ( is.na(statefind)){
        print ("valid values for state are:")
        print ( as.vector(unique(information[,col_State])) )
        stop ("state parameter is invalid for the given sample data")
    }
    
    colindex = -1
    if ( is.na(colindexint) ){
        colindex <- col_factors[[colindexname]]
    }
    if ( is.na(colindexname) ){
        colindex = col_factors[[colindexint]]
    }
##    print (colindex)
    statesample <- information[information[col_State] == state,c(colindex,2,7)]
    trialsample <- statesample[!is.na(statesample[1]),]
    ordervector = sort (trialsample[,1] )
    finalSet <- trialsample[ trialsample[,1]==ordervector[1] ,]
    names(finalSet)=c(outcome,'Hospital Name', 'State')
    ## Return hospital name in that state with lowest 30 day death
    ## rate
    as.vector(finalSet [!is.na(finalSet[,1]),2])
}
