################################################################################
#
#'
#' Calculate CMAM length of stay
#'
#' @param admission_date Date of admission in `YYYY-MM-DD` format. If child is a
#'   kwashiorkor case, date of lowest weight (when oedema has subsided). Can be
#'   a single date value or a vector of date values.
#' @param discharge_date Date of discharge in `YYYY-MM-DD` format. Can be a
#'   single date value or a vector of date values.
#'
#' @return Numeric value or vector of numeric values for length-of-stay in days.
#'
#' @author Ernest Guevarra
#'
#' @examples
#' calculate_los(admission_date = "2010-03-15",
#'               discharge_date = "2010-06-14")
#'
#' calculate_los(admission_date = c("2010-03-15", "2010-03-16"),
#'               discharge_date = c("2010-06-14", "2010-06-20"))
#'
#' @export
#'
#
################################################################################

calculate_los <- function(admission_date, discharge_date) {
  ## Check date formats
  if(any(is.na(as.Date(admission_date, optional = TRUE)))) {
    warning(
      stringr::str_wrap(
        string = "Some admission date/s are not in YYYY-MM-DD format or are not
                  available. Returning NA.",
        width = 80
      ),
      call. = TRUE
    )
  }

  if(any(is.na(as.Date(discharge_date, optional = TRUE)))) {
    warning(
      stringr::str_wrap(
        string = "Some admission date/s are not in YYYY-MM-DD format or are not
                  available. Returning NA.",
        width = 80
      ),
      call. = TRUE
    )
  }

  ## Calculate length of stay
  los <- as.numeric(as.Date(discharge_date) - as.Date(admission_date))

  ## Return los value
  return(los)
}


################################################################################
#
#'
#' Calculate median length of stay for a cohort of CMAM discharges
#'
#' @param admission_date Date of admission in `YYYY-MM-DD` format. If child is a
#'   kwashiorkor case, date of lowest weight (when oedema has subsided). Can be
#'   a single date value or a vector of date values.
#' @param discharge_date Date of discharge in `YYYY-MM-DD` format. Can be a
#'   single date value or a vector of date values.
#' @param group A character value/s with the same length as `admission_date` and
#'   `discharge_data` to use as grouping variable within which median
#'   length-of-stay is to be calculated. Default is NULL for no grouping.
#'
#' @return A numeric value for median length-of-stay in days. If `group` is not
#'   NULL, a vector of numeric values for median length-of-stay in days with
#'   length equal to the number of groups.
#'
#' @author Ernest Guevarra
#'
#' @examples
#' calculate_median_los(
#'   otp_beneficiaries$admDate,
#'   otp_beneficiaries$disDate,
#'   group = otp_beneficiaries$locality
#' )
#'
#' @export
#'
#
################################################################################

calculate_median_los <- function(admission_date,
                                 discharge_date,
                                 group = NULL) {
  ## Calculate median length of stay
  los <- calculate_los(
    admission_date = admission_date, discharge_date = discharge_date
  )

  ## Check group
  if(!is.null(group)) {
    x <- data.frame(group, los)
    median_los <- stats::aggregate(
      los ~ group, data = x, FUN = stats::median
    )
    #names(median_los) <- c(group, "los")
  } else {
    median_los <- stats::median(los)
  }

  ## Return results
  median_los
}
