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
    stop("Date of admission is not in YYYY-MM-DD format. Please try again.", call. = TRUE)
  }

  if(any(is.na(as.Date(discharge_date, optional = TRUE)))) {
    stop("Date of discharge is not in YYYY-MM-DD format. Please try again.", call. = TRUE)
  }

  ## Calculate length of stay
  los <- as.numeric(as.Date(discharge_date) - as.Date(admission_date))

  ## Return los value
  return(los)
}


################################################################################
#
#'
#' Calculate length of stay for a cohort of CMAM discharges
#'
#' @param df A data.frame containing information on a cohort of CMAM
#'   discharges specifically dates of admission and dates of discharge.
#' @param admission_date A character value for name of variable in `df`
#'   containing dates of admission in `YYYY-MM-DD` format.
#' @param discharge_date A character value for name of variable in `df`
#'   containing dates of discharge in `YYYY-MM-DD` format.
#' @param add Logical. Should results be added as a new column in `df`? Default
#'   is TRUE.
#'
#' @return If `add` is TRUE, a tibble created from column binding `df` with
#'   the vector of numerical values of calculated length-of-stay. If `add` is
#'   FALSE, a vector of numerical values of calculated length-of-stay.
#'
#' @author Ernest Guevarra
#'
#' @examples
#' x <- data.frame(admission = c("2010-03-15", "2010-02-15"),
#'                 discharge = c("2010-06-14", "2010-04-19"))
#'
#' calculate_los_df(df = x,
#'                  admission_date = "admission",
#'                  discharge_date = "discharge")
#'
#' @export
#'
#
################################################################################

calculate_los_df <- function(df, admission_date, discharge_date, add = TRUE) {
  ## Check date formats
  if(any(is.na(as.Date(df[[admission_date]], optional = TRUE)))) {
    stop("Date/s of admission is not in YYYY-MM-DD format. Please try again.", call. = TRUE)
  }

  if(any(is.na(as.Date(df[[discharge_date]], optional = TRUE)))) {
    stop("Date/s of discharge is not in YYYY-MM-DD format. Please try again.", call. = TRUE)
  }

  ## Calculate median length of stay
  los <- calculate_los(admission_date = df[[admission_date]],
                       discharge_date = df[[discharge_date]])

  if(add) {
    los <- data.frame(df, los)
    los <- tibble::tibble(los)
  }

  ## Return los
  return(los)
}


################################################################################
#
#'
#' Calculate median length of stay for a cohort of CMAM discharges
#'
#' @param df A data.frame containing information on a cohort of CMAM
#'   discharges specifically dates of admission and dates of discharge.
#' @param admission_date A character value for name of variable in `df`
#'   containing dates of admission in `YYYY-MM-DD` format.
#' @param discharge_date A character value for name of variable in `df`
#'   containing dates of discharge in `YYYY-MM-DD` format.
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
#'                      admission_date = "admission",
#'                      discharge_date = "discharge")
#'
#' @export
#'
#
################################################################################

calculate_median_los <- function(df, admission_date, discharge_date, group = NULL) {
  ## Check date formats
  if(any(is.na(as.Date(df[[admission_date]], optional = TRUE)))) {
    stop("Date/s of admission is not in YYYY-MM-DD format. Please try again.", call. = TRUE)
  }

  if(any(is.na(as.Date(df[[discharge_date]], optional = TRUE)))) {
    stop("Date/s of discharge is not in YYYY-MM-DD format. Please try again.", call. = TRUE)
  }

  ## Calculate median length of stay
  los <- as.numeric(as.Date(df[[discharge_date]]) - as.Date(df[[admission_date]]))

  ## Check group
  if(!is.null(group)) {
    x <- data.frame(df, los)
    median_los <- stats::aggregate(los ~ get(group), data = x, FUN = stats::median)
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
