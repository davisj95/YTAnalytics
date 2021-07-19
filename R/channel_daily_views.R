#' Daily Channel Views
#'
#' @description
#' This is a wrapper function for `analytics_request`. These are the following
#' defaults:
#' * dimensions: `day`
#' * metrics: `views`
#' * startDate: `2000-01-01`
#' * endDate: `Sys.Date()`
#'
#' @param ... Additional arguments passed to `analytics_request()`
#'
#' @return data.frame
#'
#' @examples
#' channel_daily_views()
#' channel_daily_views(startDate = "2020-01-01", endDate = "2020-01-31")
#'
#' @export
#'

channel_daily_views <- function(...) {
  temp <- analytics_request(dimensions = "day",
                            metrics = "views", ...)
  return(temp)
}
