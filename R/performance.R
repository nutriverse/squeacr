################################################################################
#
#'
#' Calculate CMAM performance indicators - cure rate
#'
#' @param cured Numeric value for total number of cured cases
#' @param exit Numeric value for total number of programme exits
#'
#' @return A proportion of cured cases of the total programme exits
#'
#' @author Ernest Guevarra
#'
#' @examples
#' calculate_cured(cured = 10, exit = 50)
#'
#' @export
#'
#
################################################################################

calculate_cured <- function(cured, exit) {
  ## Check that parameters are numeric
  if(!is.numeric(cured)) {
    stop("Value for cured must be numeric. Try again.", call. = TRUE)
  }

  if(!is.numeric(exit)) {
    stop("Value for exit must be numeric. Try again.", call. = TRUE)
  }

  ## Calculate
  prop_cure <- cured / exit

  ## Return result
  return(prop_cure)
}


################################################################################
#
#'
#' Calculate CMAM performance indicators - death rate
#'
#' @param dead Numeric value for total number of cases who died
#' @param exit Numeric value for total number of programme exits
#'
#' @return A proportion of dead cases of the total programme exits
#'
#' @author Ernest Guevarra
#'
#' @examples
#' calculate_dead(dead = 10, exit = 50)
#'
#' @export
#'
#
################################################################################

calculate_dead <- function(dead, exit) {
  ## Check that parameters are numeric
  if(!is.numeric(dead)) {
    stop("Value for dead must be numeric. Try again.", call. = TRUE)
  }

  if(!is.numeric(exit)) {
    stop("Value for exit must be numeric. Try again.", call. = TRUE)
  }

  ## Calculate
  prop_dead <- dead / exit

  ## Return result
  return(prop_dead)
}


################################################################################
#
#'
#' Calculate CMAM performance indicators - default rate
#'
#' @param defaulter Numeric value for total number of cases who defaulted
#' @param exit Numeric value for total number of programme exits
#'
#' @return A proportion of defaulter cases of the total programme exits
#'
#' @author Ernest Guevarra
#'
#' @examples
#' calculate_default(defaulter = 10, exit = 50)
#'
#' @export
#'
#
################################################################################

calculate_default <- function(defaulter, exit) {
  ## Check that parameters are numeric
  if(!is.numeric(defaulter)) {
    stop("Value for defaulter must be numeric. Try again.", call. = TRUE)
  }

  if(!is.numeric(exit)) {
    stop("Value for exit must be numeric. Try again.", call. = TRUE)
  }

  ## Calculate
  prop_default <- defaulter / exit

  ## Return result
  return(prop_default)
}


################################################################################
#
#'
#' Calculate CMAM performance indicators - non-response rate
#'
#' @param nr Numeric value for total number of cases who did not respond to
#'   treatment
#' @param exit Numeric value for total number of programme exits
#'
#' @return A proportion of non-responders of the total programme exits
#'
#' @author Ernest Guevarra
#'
#' @examples
#' calculate_no_response(nr = 10, exit = 50)
#'
#' @export
#'
#
################################################################################

calculate_no_response <- function(nr, exit) {
  ## Check that parameters are numeric
  if(!is.numeric(nr)) {
    stop("Value for non-responder must be numeric. Try again.", call. = TRUE)
  }

  if(!is.numeric(exit)) {
    stop("Value for exit must be numeric. Try again.", call. = TRUE)
  }

  ## Calculate
  prop_nr <- nr / exit

  ## Return result
  return(prop_nr)
}


################################################################################
#
#'
#' Calculate CMAM performance indicators
#'
#' @param .data A data.frame containing programme monitoring data on number of
#'   cured, deaths, defaulters and non-response. The required data.frame
#'   holds rows of data corresponding to total counts for each performance
#'   indicator (i.e., **cured**, **dead**, **defaulter** and **non-responder**)
#'   rather than rows of individual cases.
#' @param vars A vector of variable names specifying **cured**, **dead**,
#'   **defaulter** and **non-responder** (in this specific order) values in
#'   `.data`. If NULL (default), typical names used for these variables will
#'   be searched and used accordingly. If search doesn't yield matching variable
#'   names, the first 4 columns of the data.frame will be used.
#' @param add Logical. Should result be added to `.data`. Default is TRUE.
#'
#' @return A tibble of performance indicator results
#'
#' @author Ernest Guevarra
#'
#' @examples
#' calculate_performance(.data = monitoring)
#'
#' @export
#'
#
################################################################################

calculate_performance <- function(.data,
                                       vars = NULL,
                                       add = TRUE) {
  ## Get vars
  if(is.null(vars)) {
    ## Find variables names in .data
    .vars <- c(find_var_names(.data, vars = c("cure", "recover")),
               find_var_names(.data, vars = c("dead", "death")),
               find_var_names(.data, vars = c("default", "def")),
               find_var_names(.data, vars = c("response", "respond")))

    ##
    if(any(is.null(.vars))) {
      message(
        "No variables in .data match with usual performance indicators data
        variable names. First 4 columns of .data will be used."
      )

      .vars <- names(.data)[1:4]
    }
  } else {
    ## check if vars found in names of .data
    if(!all(vars %in% names(.data))) {
      stop(
        "Variables in .data does not match with specified variable names in
        vars. Try again.", call. = TRUE
      )
    }

    .vars <- vars
  }

  ## Check that input variables are numeric
  if(!is.numeric(.data[[.vars[1]]])) {
    stop(paste(.vars[1], "should be numeric. Try again.", call. = TRUE))
  }

  if(!is.numeric(.data[[.vars[2]]])) {
    stop(paste(.vars[2], "should be numeric. Try again.", call. = TRUE))
  }

  if(!is.numeric(.data[[.vars[3]]])) {
    stop(paste(.vars[3], "should be numeric. Try again.", call. = TRUE))
  }

  if(!is.numeric(.data[[.vars[4]]])) {
    stop(paste(.vars[4], "should be numeric. Try again.", call. = TRUE))
  }

  ## Calculate performance indicators
  cured_prop <- calculate_cured(cured = .data[[.vars[1]]],
                                exit = rowSums(.data[ , .vars]))

  dead_prop <- calculate_dead(dead = .data[[.vars[2]]],
                              exit = rowSums(.data[ , .vars]))

  defaulter_prop <- calculate_default(defaulter = .data[[.vars[3]]],
                                      exit = rowSums(.data[ , .vars]))

  nr_prop <- calculate_no_response(nr = .data[[.vars[4]]],
                                   exit = rowSums(.data[ , .vars]))



  ## Concatenate
  pf <- data.frame(cured_prop, dead_prop, defaulter_prop, nr_prop)

  if(add) {
    pf <- cbind(.data, pf)
  }

  ## Convert to tibble
  pf <- tibble::tibble(pf)

  ## Return result
  return(pf)
}
