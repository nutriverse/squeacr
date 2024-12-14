#'
#' Semi-Quantitative Evaluation of Access and Coverage (SQUEAC) Tools
#'
#' In the recent past, measurement of coverage has been mainly through
#' two-stage cluster sampled surveys either as part of a nutrition assessment
#' or through a specific coverage survey known as Centric Systematic Area
#' Sampling (CSAS). However, such methods are resource intensive and often only
#' used for final programme evaluation meaning results arrive too late for
#' programme adaptation. SQUEAC, which stands for Semi-Quantitative Evaluation
#' of Access and Coverage, is a low resource method designed specifically to
#' address this limitation and is used regularly for monitoring, planning and
#' importantly, timely improvement to programme quality, both for agency and
#' Ministry of Health (MoH) led programmes. This package provides functions
#' for use in conducting a SQUEAC investigation.
#'
#' @references
#' Myatt, Mark et al. 2012. Semi-Quantitative Evaluation of Access and
#' Coverage (SQUEAC)/Simplified Lot Quality Assurance Sampling Evaluation of
#' Access and Coverage (SLEAC) Technical Reference. 
#' Washington, DC: FHI 360/FANTA.
#'
#' @keywords internal
#'
#' @docType package
#' @name squeacr
#' @keywords internal
#' @importFrom stats median aggregate
#' @importFrom tibble tibble
#' @importFrom zoo rollmean rollmedian
#'
"_PACKAGE"
