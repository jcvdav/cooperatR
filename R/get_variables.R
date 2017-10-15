#' Get variable names of the \code{\link{cooperatives}} dataset
#'
#' @name get_variables
#'
#' @description Extracts variable names from the \code{\link{cooperatives}} dataset
#'
#' @param sort if \code{sort = FALSE} (the default) variable names are returned in the original order of the database (usefull, because they are grouped by type). If \code{sort = TRUE} variable names are sorted alphabetically (usefull to inspect existing variables).
#'
#' @return a character vector containing the names of the variables in the dataset
#' @export
#'
#' @examples
#' 
#' # Extract variable names in original order
#' get_variables(sort = FALSE)
#' 
#' # Extract sorted variable names
#' get_variables(sort = TRUE)
#' 
#' @seealso \code{\link{cooperatives}}
#' 
get_variables <- function(sort = FALSE){
  
  data("cooperatives")
  
  vars <- colnames(cooperatives)
  
  if(sort){ vars <- sort(vars)}
  
  return(vars)
  
}