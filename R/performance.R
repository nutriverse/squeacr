#'
#' Calculate CMAM performance indicators
#'
#' @param df A data.frame containing programme monitoring data on number of
#'   cured, deaths, defaulters and non-response. The required data.frame
#'   holds rows of data corresponding to total counts for each performance
#'   indicator (i.e., **cured**, **dead**, **defaulter** and **non-responder**)
#'   rather than rows of individual cases.
#' @param cured Numeric value for total number of cured cases
#' @param dead Numeric value for total number of cases who died 
#' @param defaulter Numeric value for total number of cases who defaulted
#' @param nr Numeric value for total number of cases who did not respond to
#' @param exit Numeric value for total number of programme exits
#' @param vars A vector of variable names specifying **cured**, **dead**,
#'   **defaulter** and **non-responder** (in this specific order) values in
#'   `df`. If NULL (default), typical names used for these variables will
#'   be searched and used accordingly. If search doesn't yield matching variable
#'   names, the first 4 columns of the data.frame will be used.
#' @param add Logical. Should result be added to `df`. Default is TRUE.
#'
#' @return A tibble of performance indicator results (for 
#'   [calculate_performance()]) or a numeric value of specified CMAM performance
#'   indicator (for [calculate_cured()], [calculate_default()], 
#'   [calculate_dead()]), and [calculate_no_response()].
#'
#' @author Ernest Guevarra
#'
#' @examples
#' calculate_performance(df = monitoring)
#' calculate_cured(cured = 10, exit = 50)
#' calculate_dead(dead = 10, exit = 50)
#' calculate_default(defaulter = 10, exit = 50)
#' calculate_no_response(nr = 10, exit = 50)
#'
#' @rdname calculate_performance
#' @export
#'

calculate_performance <- function(df,
                                  vars = NULL,
                                  add = TRUE) {
  ## Get vars
  if (is.null(vars)) {
    ## Find variables names in .data
    .vars <- c(find_var_names(df, vars = c("cure", "recover")),
               find_var_names(df, vars = c("dead", "death")),
               find_var_names(df, vars = c("default", "def")),
               find_var_names(df, vars = c("response", "respond")))

    ##
    if (any(is.null(.vars))) {
      message(
        "No variables in `df` match with usual performance indicators data
        variable names. First 4 columns of df will be used."
      )

      .vars <- names(df)[1:4]
    }
  } else {
    ## check if vars found in names of df
    if (!all(vars %in% names(df))) {
      stop(
        "Variables in .data does not match with specified variable names in
        vars. Try again.", call. = TRUE
      )
    }

    .vars <- vars
  }

  ## Check that input variables are numeric
  if (!is.numeric(df[[.vars[1]]])) {
    stop(paste(.vars[1], "should be numeric. Try again.", call. = TRUE))
  }

  if (!is.numeric(df[[.vars[2]]])) {
    stop(paste(.vars[2], "should be numeric. Try again.", call. = TRUE))
  }

  if (!is.numeric(df[[.vars[3]]])) {
    stop(paste(.vars[3], "should be numeric. Try again.", call. = TRUE))
  }

  if (!is.numeric(df[[.vars[4]]])) {
    stop(paste(.vars[4], "should be numeric. Try again.", call. = TRUE))
  }

  ## Calculate performance indicators
  cured_prop <- calculate_cured(
    cured = df[[.vars[1]]], exit = rowSums(df[ , .vars])
  )

  dead_prop <- calculate_dead(
    dead = df[[.vars[2]]], exit = rowSums(df[ , .vars])
  )

  defaulter_prop <- calculate_default(
    defaulter = df[[.vars[3]]], exit = rowSums(df[ , .vars])
  )

  nr_prop <- calculate_no_response(
    nr = df[[.vars[4]]], exit = rowSums(df[ , .vars])
  )

  ## Concatenate
  pf <- data.frame(cured_prop, dead_prop, defaulter_prop, nr_prop)

  if (add) {
    pf <- cbind(df, pf)
  }

  ## Convert to tibble
  pf <- tibble::tibble(pf)

  ## Return result
  pf
}

#'
#' @rdname calculate_performance
#' @export
#'

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
  prop_cure
}


#'
#' @rdname calculate_performance
#' @export
#'

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
  prop_dead
}


#'
#' @rdname calculate_performance
#' @export
#'

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
  prop_default
}


#'
#' @rdname calculate_performance
#' @export
#'

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
  prop_nr
}

