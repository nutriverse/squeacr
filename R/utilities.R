#'
#' Find possible variable names from a data.frame given a set of search names
#'
#' @param df A data.frame to search variable names from
#' @param vars A vector of terms to search for
#' @param all Logical. Should all results of search be returned? If FALSE
#'   (default), only first value is returned.
#'
#' @return A character vector of variable name/s in `df`
#'
#' @author Ernest Guevarra
#'
#' @examples
#' find_var_names(df = otp_beneficiaries, vars = "MUAC")
#'
#' @export
#'

find_var_names <- function(df, vars, all = FALSE) {
  ## Make variables and search names lower case
  x <- tolower(names(df))
  .vars <- tolower(vars)

  ## Compose search term
  search_term <- paste(.vars, collapse = "|")

  ## Get data variable names matching search
  z <- names(df)[grep(pattern = search_term, x = names(df), ignore.case = TRUE)]

  ## Check if z is empty
  if(length(z) == 0) {
    message("No matching variable name/s. Try again.")
    z <- NULL
  }

  ## Check if all is TRUE
  if (all) {
    z
  } else {
    z <- z[1]
  } 

  ## Return result
  z
}


#'
#' Apply median of 3 and average of 3 smoothing on a time series
#'
#' @param x A vector of numerical information to be smoothed
#'
#' @return A vector of smoothed data
#'
#' @author Ernest Guevarra
#'
#' @examples
#' x <- aggregate(cbind(`New Admissions`, Default) ~ Month + Year,
#'                data = monitoring, FUN = sum)
#' smooth_m3a3(x = x$Default)
#'
#' @export
#'

smooth_m3a3 <- function(x) {
  ## Check if numeric
  if(!is.numeric(x)) {
    stop("Input vector should be numeric. Try again.", call. = TRUE)
  }

  ## Median of 3
  y <- zoo::rollmedian(x = x, k = 3, fill = c("extend", NA))

  ## Average of 3
  z <- zoo::rollmean(x = y, k = 3, fill = c("extend", NA))

  ## Return results
  z
}
