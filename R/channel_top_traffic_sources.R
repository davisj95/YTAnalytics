#' Channel Top Traffic Sources
#'
#' @description
#' This is a wrapper function for `top_function` to return channel views by traffic sources.
#' These are the following defaults:
#' * dimension: `insightTrafficSourceType`
#' * metrics: `views,estimatedMinutesWatched`
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
#' channel_top_traffic_sources()
#' channel_top_traffic_sources(startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'

channel_top_traffic_sources <- function(...) {
  temp <- top_function(dimension = "insightTrafficSourceType",
                       metrics = "views,estimatedMinutesWatched", ...)
  return(temp)
}
