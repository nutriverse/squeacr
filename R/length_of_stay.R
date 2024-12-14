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

calculate_los <- function(admission_date, discharge_date) {
  adm_date <- as.Date(admission_date, optional = TRUE)
  dis_date <- as.Date(discharge_date, optional = TRUE)

  ## Check date formats
  if(any(is.na(adm_date))) {
    warning(
      "Some admission date/s are not in YYYY-MM-DD format or are not available.",
      " Returning NA.",
      call. = TRUE
    )
  }

  if(any(is.na(dis_date))) {
    warning(
      "Some admission date/s are not in YYYY-MM-DD format or are not available.",
      " Returning NA.",
      call. = TRUE
    )
  }

  ## Calculate length of stay in days ----
  los <- as.numeric(dis_date - adm_date)

  ## Check if any los is less than 0 ----
  if (any(los < 0, na.rm = TRUE)) {
    warning(
      "Some discharge dates are earlier than admisison dates. ",
      "Returning NA.",
      call. = TRUE
    )
  }
  
  ## Recode los less than 0 as NA ----
  los <- ifelse(los < 0, NA_real_, los)

  ## Return los value
  los
}


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
    median_los <- stats::median(los, na.rm = TRUE)
  }

  ## Return results
  median_los
}
