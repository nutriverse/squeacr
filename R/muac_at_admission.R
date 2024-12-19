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
#' @returns A numeric value (if `index = NULL`) or named vector of values for 
#'   median mid-upper arm circumference with names from each level of `index`.
#'
#' @examples
#' calculate_muac_median(otp_beneficiaries$muac)
#' calculate_muac_median(otp_beneficiaries$muac, otp_beneficiaries$locality)
#' 
#' @export
#' @rdname calculate_muac
#' 

calculate_muac_median <- function(muac, index = NULL, na_values = NULL) {
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


calculate_muac_median_count <- function(muac, n, index = NULL) {
  if (is.null(index)) {
    Map(f = rep, x = muac, times = n) |>
      unlist() |>
      median(na.rm = TRUE)
  } else {
    split(data.frame(muac, n), f = index) |> 
      lapply(
        FUN = function(x) Map(f = rep, x = x$muac, times = x$n) |> unlist()
      ) |> 
      lapply(FUN = median, na.rm = TRUE) |> 
      (\(x) do.call(rbind, x))() |>
      (\(x) data.frame(
        index = row.names(x), median_muac = x, row.names = NULL
      ))()
  }
}