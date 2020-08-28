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
#' @param admission A vector of dates of admission in `YYYY-MM-DD` format.
#' @param discharge A vector of dates of discharge in `YYYY-MM-DD` format.
#'
#' @return Numeric values for median length-of-stay in days.
#'
#' @author Ernest Guevarra
#'
#' @examples
#' x <- data.frame(admission = c("2010-03-15", "2010-02-15"),
#'                 discharge = c("2010-06-14", "2010-04-19"))
#'
#' calculate_median_los(admission = x$admission,
#'                      discharge = x$discharge)
#'
#' @export
#'
#
################################################################################

calculate_median_los <- function(admission, discharge) {
  ## Check date formats
  if(any(is.na(as.Date(admission, optional = TRUE)))) {
    stop("Date/s of admission is not in YYYY-MM-DD format. Please try again.", call. = TRUE)
  }

  if(any(is.na(as.Date(discharge, optional = TRUE)))) {
    stop("Date/s of discharge is not in YYYY-MM-DD format. Please try again.", call. = TRUE)
  }

  ## Calculate median length of stay
  los <- as.numeric(as.Date(discharge) - as.Date(admission))
  median_los <- stats::median(los)

  ## Return results
  return(median_los)
}
