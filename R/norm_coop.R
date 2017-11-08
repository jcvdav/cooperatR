#' @name norm_coop
#' 
#' @title Normalize cooperative database
#' 
#' @description Uses the scales::rescale function to normalize all numeric, integers, and logicals between 0 and 1. The function returns the original dataset, including categorical variables (left as original), and modifies numerics values to be between 0 and 1.
#'
#' @return A data.frame containing the normalized database
#' @export
#' 
#' @details 
#' 
#' The available numeric variables are:
#' 
#' \itemize{
#'   \item{original_order}
#'   \item{fishery_id}
#'   \item{umbrella_organization}
#'   \item{number_of_species}
#'   \item{fb_k_1_yr}
#'   \item{fb_loo_cm}
#'   \item{fb_trophic}
#'   \item{discrete_movement}
#'   \item{migratory}
#'   \item{forms_aggregations}
#'   \item{consistent_spawning_location}
#'   \item{a_in_fishery}
#'   \item{msc_certification}
#'   \item{stock_assessment}
#'   \item{recorded_fishery_closure}
#'   \item{spawning_season}
#'   \item{known_spatial_structure}
#'   \item{population}
#'   \item{population_growth_rate}
#'   \item{gdp_2009_us}
#'   \item{gdp_from_fishing_us}
#'   \item{percent_of_gdp_from_fishing}
#'   \item{fishery_subsidies_prominent}
#'   \item{subsidy_as_a_percent_of_landed_value}
#'   \item{poverty_index}
#'   \item{human_development_index}
#'   \item{polity}
#'   \item{institutional_stability}
#'   \item{rule_of_law}
#'   \item{contract_enforcement_rank}
#'   \item{corruption}
#'   \item{catch_shares}
#'   \item{itq}
#'   \item{ivq}
#'   \item{ieq}
#'   \item{iq}
#'   \item{turf}
#'   \item{coop}
#'   \item{open_access}
#'   \item{limited_entry}
#'   \item{tac}
#'   \item{effort_limit}
#'   \item{trip_limit}
#'   \item{size_limit}
#'   \item{gear}
#'   \item{mpa}
#'   \item{sex}
#'   \item{short_range}
#'   \item{processed}
#'   \item{cooperative_present}
#'   \item{nested_fishery}
#'   \item{programs_for_coop_formation}
#'   \item{marketing}
#'   \item{profit_sharing}
#'   \item{cooperative_administration}
#'   \item{coharvest}
#'   \item{cooperative_tac}
#'   \item{cooperative_gear_restrictions}
#'   \item{cooperative_size_limit}
#'   \item{gear_sharing}
#'   \item{direct_enforcement}
#'   \item{codified_penalties}
#'   \item{temporal_no_take}
#'   \item{spatial_no_take}
#'   \item{restocking}
#'   \item{habitat_restoration}
#'   \item{gear_shift}
#'   \item{by_catch_avoidance}
#'   \item{research_support}
#'   \item{information_sharing}
#'   \item{coop_behaviors}
#'   \item{coop_form_date}
#'   \item{short_vessels}
#'   \item{short_participants}
#'   \item{short_landings}
#'   \item{ecosystem_engineering}
#'   \item{reporting}
#'   \item{spatial}
#'   \item{quota}
#'   \item{temporal}
#'   \item{gear0}
#'   \item{gov_ambivalent}
#'   \item{gov_undermining}
#'   \item{gov_supportive}
#'   \item{transfer_rights}
#'   \item{services_provided}
#'   \item{legal_protection_standing}
#'   \item{enforcement}
#'   \item{support_of_voluntary_regs}
#'   \item{financial_services}
#'   \item{information_support}
#'   \item{conditions_for_cooperative_exist}
#'   \item{sunset_clause}
#'   \item{oecd}
#'   \item{oneper}
#' }
#'
#' @examples
#' 
#' # To get a normalized dataset, just run the function. No arguments are needed.
#' norm_coop()
#' 
#' @importFrom magrittr %<>% %>% %$%
#' @importFrom dplyr select group_by count ungroup summarize_all summarize_at mutate_all mutate_at mutate
#' @importFrom scales rescale
#' 
#' @author Juan Carlos
#' 
norm_coop <- function(){
  data("cooperatives")
  
  columns <- data.frame(value = sapply(cooperatives, class), stringsAsFactors = F) %>% 
    dplyr::mutate(variable = rownames(.)) %>% 
    dplyr::filter(!value == "character", variable %in% c("year", "coop_from_date", "season")) %$%
    variable
  
  mutate_at(cooperatives, columns, function(y){rescale(y*1)})
}