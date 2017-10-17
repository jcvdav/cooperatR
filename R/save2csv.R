#' Save the \code{\link{cooperatives}} dataset to a *.csv file
#' 
#' @name save2csv
#' 
#' @description Saves the entire cooperatives dataset to a *.csv file that can be manipulated by the user. BUT any modifications done to the file are not replicable and difficult to incorporate into the original database!
#'
#' @param filename A character string that specifies the desired name of the file. The user can also specify the directory relative to its current working directory with a customary approach of "./RootFolder/MyDesiredFolder/filename". There is no need to specify file extension! If \code{NULL} (de default), the file is saved as cooperatives.csv in the current working directory.
#'
#' 
#' @export
#'
#' @examples
#' 
#' # Save database with default name
#' save2csv()
#' 
#' # Save to current directory with custom name
#' save2csv(filename = "coop_data")
#' 
#' # Save database to a desired working directory
#' save2csv(filename = "./Data/coop_data")
#' 
#' @author Juan Carlos
#' @seealso \code{\link{cooperatives}}
#' 
save2csv <- function(filename = NULL){
  data("cooperatives")
  
  if(is.null(filename)){
    write.csv(x = cooperatives, file = "./cooperatives.csv", row.names = F)
  }
  
  if(!is.null(filename)){
    write.csv(x = cooperatives, file = paste0("./", filename, ".csv"), row.names = F)
  }
  
}