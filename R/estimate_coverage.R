################################################################################
#
#' Estimate cases not in CMAM programme
#'
#' @param cin Cases in CMAM programme
#' @param cout Cases not in CMAM programme
#' @param rin Recovering cases in programme
#' @param k Correction factor. Ratio of the mean length of an untreated episode
#'   to the mean length of a CMAM treatment episode
#'
#' @return Value of number of cases not in CMAM programme
#'
#' @author Ernest Guevarra based on technical notes and equations by Mark Myatt
#'
#' @references Safari Balegamire, Katja Siling, Jose Luis Alvarez Moran,
#'   Ernest Guevarra, Sophie Woodhead, Alison Norris, Lionella Fieschi,
#'   Paul Binns, and Mark Myatt (2015). A single coverage estimator for use in
#'   SQUEAC, SLEAC, and other CMAM coverage assessments. Field Exchange 49,
#'   March 2015. p81. <www.ennonline.net/fex/49/singlecoverage>
#'
#' @examples
#' calculate_rout(cin = 5, cout = 25, rin = 5, k = 3)
#'
#' @export
#'
#
################################################################################

calculate_rout <- function(cin, cout, rin, k = 3) {
  floor((1 / k) * (rin * ((cin + 1 + cout) / (cin + 1)) - rin))
}


################################################################################
#
#' Estimate case finding effectiveness
#'
#' @param cin Cases in CMAM programme
#' @param cout Cases not in CMAM programme
#'
#' @return Value of case finding effectiveness
#'
#' @author Ernest Guevarra based on technical notes and equations by Mark Myatt
#'
#' @references Safari Balegamire, Katja Siling, Jose Luis Alvarez Moran,
#'   Ernest Guevarra, Sophie Woodhead, Alison Norris, Lionella Fieschi,
#'   Paul Binns, and Mark Myatt (2015). A single coverage estimator for use in
#'   SQUEAC, SLEAC, and other CMAM coverage assessments. Field Exchange 49,
#'   March 2015. p81. <www.ennonline.net/fex/49/singlecoverage>
#'
#' @examples
#' calculate_cf(cin = 5, cout = 20)
#'
#' @export
#'
#
################################################################################

calculate_cf <- function(cin, cout) {
  cin / (cin + cout)
}


################################################################################
#
#' Estimate treatment coverage
#'
#' @param cin Cases in CMAM programme
#' @param cout Cases not in CMAM programme
#' @param rin Recovering cases in CMAM programme
#' @param k Correction factor. Ratio of the mean length of an untreated episode
#'   to the mean length of a CMAM treatment episode
#'
#' @return Value of treatment coverage
#'
#' @author Ernest Guevarra based on technical notes and equations by Mark Myatt
#'
#' @references Safari Balegamire, Katja Siling, Jose Luis Alvarez Moran,
#'   Ernest Guevarra, Sophie Woodhead, Alison Norris, Lionella Fieschi,
#'   Paul Binns, and Mark Myatt (2015). A single coverage estimator for use in
#'   SQUEAC, SLEAC, and other CMAM coverage assessments. Field Exchange 49,
#'   March 2015. p81. <www.ennonline.net/fex/49/singlecoverage>
#'
#' @examples
#' calculate_tc(cin = 5, cout = 20, rin = 5, k = 3)
#'
#' @export
#'
#'
#
################################################################################

calculate_tc <- function(cin, cout, rin, k = 3) {
  rout <- calculate_rout(cin = cin, cout = cout, rin = rin, k = k)
  (cin + rin) / (cin + cout + rin + rout)
}
