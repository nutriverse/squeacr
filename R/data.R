################################################################################
#
#'
#' MUAC at admission
#'
#' @format A tibble with 506 rows and 3 columns
#'
#' \ **Variable** \ **Description** \
#' \ *muac* \ Mid-upper arm circumference in centimetres \
#' \ *district* \ Name of district \
#' \ *count* \ Number of cases with specific MUAC \
#'
#' @examples
#' muac_admission
#'
#' @source A SQUEAC survey in Lokori, Kenya
#'
#'
#
################################################################################
"muac_admission"


################################################################################
#
#'
#' Routine CMAM monitoring data from Sudan
#'
#' @format A tibble with 8234 rows and 16 columns
#'
#' | **Variable** | **Description** |
#' | *State* | Name of state |
#' | *Locality* | Name of locality |
#' | *Beginning of Month* | Cases in programme at beginning of month |
#' | *New Admissions* | New cases admitted within the month |
#' | *Male* | New male cases admitted within the month |
#' | *Female* | New female cases admitted within the month |
#' | *Cured* | Number of cured cases within the month |
#' | *Death* | Number of cases who died within the month |
#' | *Default* | Number of cases who defaulted within the month |
#' | *Non-Responder* | Number of non-responder cases within the month |
#' | *Total Discharge* | Total number of discharges within the month |
#' | *RUTF Consumed* | Number of RUTF consumed |
#' | *Screening* | Screening |
#' | *Sites* | Sites |
#' | *Month* | Month |
#' | *Year* | Year |
#'
#' @source Federal Ministry of Health of Sudan
#'
#'
#
################################################################################
"monitoring"


################################################################################
#
#'
#' Seasonal calendar data for Sudan
#'
#' @format A tibble with 28 rows and 4 columns
#'
#' | **Variables** | **Description** |
#' | *event* | Name of seasonal calendar event or activity |
#' | *start* | Starting date of event/activity |
#' | *end* | Starting date of event/activity |
#' | *group* | Classification/group of activity or event |
#'
#' @source https://fews.net/east-africa/sudan/seasonal-calendar/december-2013
#'
#'
#
################################################################################
"seasonal_calendar"

