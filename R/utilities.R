################################################################################
#
#'
#' Find possible variable names from a data.frame given a set of search names
#'
#' @param .data A data.frame to search variable names from
#' @param vars A vector of terms to search for
#' @param all Logical. Should all results of search be returned? If FALSE
#'   (default), only first value is returned.
#'
#' @return A character vector of variable name/s in `.data`
#'
#' @author Ernest Guevarra
#'
#' @examples
#' find_var_names(.data = muac_admission, vars = "MUAC")
#'
#' @export
#'
#
################################################################################

find_var_names <- function(.data, vars, all = FALSE) {
  ## Make variables and search names lower case
  x <- tolower(names(.data))
  .vars <- tolower(vars)

  ## Compose search term
  search_term <- paste(.vars, collapse = "|")

  ## Get data variable names matching search
  z <- names(.data)[stringr::str_detect(x, pattern = search_term)]

  ## Check if z is empty
  if(length(z) == 0) {
    message("No matching variable name/s. Try again.")
    z <- NULL
  }

  ## Check if all is TRUE
  if(!all) {
    z <- z[1]
  }

  ## Return result
  return(z)
}
