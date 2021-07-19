#' Channel Top Demographics
#'
#' @description
#' This is a wrapper function for `top_function` to return channel views by age group and gender.
#' These are the following defaults:
#' * dimension: `ageGroup,gender`
#' * metrics: `viewerPercentage`
#' * startDate: `2000-01-01`
#' * endDate: `Sys.Date()`
#'
#' @param ... Additional arguments passed to `analytics_request()`.
#'
#' @details see https://developers.google.com/youtube/analytics/data_model for more details on dimensions and metrics.
#'
#' @return data.frame
#'
#' @examples
#' channel_top_demographics()
#' channel_top_demographics(startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'

channel_top_demographics <- function(...) {
  temp <- top_function(dimension = "ageGroup,gender",
                       metrics = "viewerPercentage",
                       sort = "gender,ageGroup", ...)
  return(temp)
}
