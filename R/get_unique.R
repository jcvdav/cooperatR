#' Get unique values
#' 
#' @description Creates a \code{data.frame} containing columns
#' that uniquely identify a fishery in the \code{\link{cooperatives}}
#' dataset. By default, it includes \code{original_order},
#' \code{entered_by}, \code{fishery_id},
#' \code{geographic_range_of_fishing_acti}, and \code{home_port}.
#'
#' @param other.variables A character string specifying if other
#' variables should be included. See the \code{\link{get_variables}}
#' function for a list of variables available in \code{\link{cooperatives}}.
#' If not specified, it defaults to \code{NULL} and no additional
#' variables are returned.
#' 
#' @param include.spp A logical indicating if the columns for
#' \code{target_spp} and \code{complete_name} should be included.
#' By default, it is set to \code{TRUE}.
#' 
#' @param to.file A logical indicating if the extraction should be
#' written to a csv file on disk.
#' 
#' @param filename If the \code{to.file} argument is set to
#' \code{TRUE}, the user may want to specify a particular filename.
#' This must be a character string that specifies the desired name
#' of the file. The user can also specify the directory relative
#' to its current working directory with a customary approach of
#' "./RootFolder/MyDesiredFolder/filename". There is no need to
#' specify file extension! If \code{NULL} (de default),
#' the file is saved as cooperatives.csv in the current working directory.
#'
#' @return a \code{data.frame} containing the desired columns
#' @export
#'
#' @examples
#' 
#' # Get unique columns excluding species and save to file
#' get_unique(include.spp = FALSE, to.file = TRUE)
#' 
#' # Get unique columns, with species, and include \code{support_of_voluntary_regs} and \code{gear_type} columns
#' get_unique(other.variables = c("support_of_voluntary_regs", "gear_type"))
#' 
#' @importFrom magrittr %<>% %>% %$%
#' @importFrom dplyr select group_by count ungroup
#' 
#' @author Juan Carlos
#' 
#' @seealso \code{\link{cooperatives}}, \code{\link{get_variables}}
#' 
get_unique <- function(other.variables = NULL, include.spp = TRUE, to.file = FALSE, filename = NULL){
  data("cooperatives")
  
  # Group by variables, including spp columns
  if(is.null(other.variables)){
    out <- dplyr::group_by(cooperatives,
                         original_order,
                         entered_by,
                         fishery_id,
                         geographic_range_of_fishing_acti,
                         home_port,
                         target_species,
                         complete_name) %>% 
      dplyr::count() %>% 
      dplyr::select(-n) %>% 
      dplyr::ungroup()
  }
  
  # Group by variables, other.variables, and including spp columns
  if(!is.null(other.variables)){
    out <- dplyr::select(cooperatives,
                          original_order,
                          entered_by,
                          fishery_id,
                          geographic_range_of_fishing_acti,
                          home_port,
                          target_species,
                          complete_name,
                          !!sym(quote(other.variables))) %>% 
      dplyr::ungroup()
  }
  
  # Delete spp columns if not needed
  if(!include.spp){
    
    out %<>%
      dplyr::select(-c(target_species, complete_name))
    
    dup <- duplicated(out$fishery_id)
    
    out <- out[!dup,]
  }
  
  # Write to file if requested
  
  if(to.file){
    # write to file with default name
    if(is.null(filename)){
      write.csv(x = outs, file = "./extraction.csv", row.names = F)
    }
    # srite to file with custom name
    if(!is.null(filename)){
      write.csv(x = out, file = paste0("./", filename, ".csv"), row.names = F)
    }
  }
  
  return(out)
}



















