#' Get species names
#' 
#' @name get_spp
#' 
#' @description Looks at the database and extracts a list of all species present. The user can specify if common or scientific names should be returned (See scientific).
#'
#' @param scientific If \code{scientific = TRUE}, then a list of scientific names is returned. If \code{scientific = FALSE} (the default) only common names are returned.
#'
#' @return A character vector containing a unique list of species present in the cooperatives dataset.
#' 
#' @export
#'
#' @examples
#' 
#' #Get a list of the 86 distinct common names
#' get_spp(scientific = FALSE)
#' 
#' 
#' #Get a list of the 83 distinct scientific names
#' get_spp(scientific = TRUE)
#' 
#' @author Juan Carlos
#' @seealso \code{\link{cooperatives}}

get_spp <- function(scientific = FALSE){
  
  data("cooperatives")

  if(scientific){
    spp <- unique(cooperatives$Complete_Name)
  } else {
    spp <- unique(cooperatives$Target_species)
  }
  
  return(spp)
  
}