norm_coop <- function(){
  data("cooperatives")
  
  columns <- data.frame(value = sapply(cooperatives, class), stringsAsFactors = F) %>% 
    mutate(variable = rownames(.)) %>% 
    filter(!value == "character", variable %in% c("year", "coop_from_date", "season")) %$%
    variable
  
  mutate_at(cooperatives, columns, function(y){rescale(y*1)})
}