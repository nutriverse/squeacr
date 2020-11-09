################################################################################
#
#'
#' Calculate CMAM length of stay
#'
#' @param admission Date of admission in `YYYY-MM-DD` format. If child is a
#'   kwashiorkor case, date of lowest weight (when oedema has subsided).
#' @param discharge Date of discharge in `YYYY-MM-DD` format.
#'
#' @return Numeric value for length-of-stay in days.
#'
#' @author Ernest Guevarra
#'
#' @examples
#' calculate_los(admission = "2010-03-15",
#'               discharge = "2010-06-14")
#'
#' @export
#'
#
################################################################################

calculate_los <- function(admission, discharge) {
  ## Check date formats
  if(is.na(as.Date(admission, optional = TRUE))) {
    stop("Date of admission is not in YYYY-MM-DD format. Please try again.", call. = TRUE)
  }

  if(is.na(as.Date(discharge, optional = TRUE))) {
    stop("Date of discharge is not in YYYY-MM-DD format. Please try again.", call. = TRUE)
  }

  los <- as.numeric(as.Date(discharge) - as.Date(admission))

  return(los)
}


################################################################################
#
#'
#' Calculate median length of stay for a cohort of CMAM discharges
#'
#' @param df A data.frame containing information on a cohort of CMAM
#'   discharges specifically dates of admission and dates of discharge.
#' @param admission A character value for name of variable in `df` containing
#'   dates of admission in `YYYY-MM-DD` format.
#' @param discharge A character value for name of variable in `df` containing
#'   dates of discharge in `YYYY-MM-DD` format.
#' @param group A character value for name of variable in `df` to use as
#'   grouping variable within which median length-of-stay is to be calculated.
#'   Default is NULL for no grouping.
#'
#' @return A named list of two objects. First is a vector of numeric values for
#'   length-of-stay in days per CMAM discharge. Second is a numeric value for
#'   median length-of-stay in days or a data.frame of numeric values for median
#'   length-of-stay if `group` is specified.
#'
#' @author Ernest Guevarra
#'
#' @examples
#' x <- data.frame(admission = c("2010-03-15", "2010-02-15"),
#'                 discharge = c("2010-06-14", "2010-04-19"))
#'
#' calculate_median_los(df = x,
#'                      admission = "admission",
#'                      discharge = "discharge")
#'
#' @export
#'
#
################################################################################

calculate_median_los <- function(df, admission, discharge, group = NULL) {
  ## Check date formats
  if(any(is.na(as.Date(df[[admission]], optional = TRUE)))) {
    stop("Date/s of admission is not in YYYY-MM-DD format. Please try again.", call. = TRUE)
  }

  if(any(is.na(as.Date(df[[discharge]], optional = TRUE)))) {
    stop("Date/s of discharge is not in YYYY-MM-DD format. Please try again.", call. = TRUE)
  }

  ## Calculate median length of stay
  los <- as.numeric(as.Date(df[[discharge]]) - as.Date(df[[admission]]))

  ## Check group
  if(!is.null(group)) {
    x <- data.frame(df, los)
    median_los <- aggregate(los ~ get(group), data = x, FUN = stats::median)
    names(median_los) <- c(group, "los")
  } else {
    median_los <- stats::median(los)
  }

  ## Concatenate vector of los and median_los
  x <- list("Length-of-stay" = los,
            "Median length-of-stay" = median_los)

  ## Return results
  return(x)
}
