#'
#' Calculate median MUAC-at_admissions
#' 
#' @param muac A numeric vector of mid-upper arm circumference measurements
#'   either in centimetres or millimetres.
#' @param index A list of one or more factors each of the same length as `muac`
#'   which defines the grouping to be used on `muac`. Default is NULL (no
#'   grouping applied).
#' @param na_values A vector of values in `muac` that are to be considered as
#'   NA values. Default to NULL which will use NA.
#' 
#' @returns A numeric value (if `index = NULL`) or vector of values for median
#'   mid-upper arm circumference.
#'
#' @examples
#' calculate_median_muac(otp_beneficiaries$muac)
#' calculate_median_muac(otp_beneficiaries$muac, otp_beneficiaries$locality)
#' 
#' @export
#' 

calculate_median_muac <- function(muac, index = NULL, na_values = NULL) {
  if (!is.null(na_values)) {
    muac <- ifelse(muac %in% na_values, NA_real_, muac)
  }

  if (!is.null(index)) {
    if (length(muac) != length(index))
      stop("`muac` does not have the same length as `index`. Try again.")
    
    median_muac <- tapply(
      X = muac, INDEX = index, FUN = median, na.rm = TRUE
    ) |>
      c()
  } else {
    median_muac <- median(muac, na.rm = TRUE)
  }

  median_muac
}
