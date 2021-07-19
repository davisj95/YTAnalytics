#' Channel Top External Traffic Sources
#'
#' @description
#' This is a wrapper function for `top_function` to return channel views by external traffic sources.
#' These are the following defaults:
#' * dimension: `insightTrafficSourceDetails`
#' * metrics: `views,estimatedMinutesWatched`
#' * filters: `insightTrafficSourceType==EXT_URL`
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
#' channel_top_external_sources()
#' channel_top_external_sources(startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'

channel_top_external_sources <- function(...) {
  temp <- top_function(dimension = "insightTrafficSourceDetail",
                       metrics = "views,estimatedMinutesWatched",
                       filters = "insightTrafficSourceType==EXT_URL", ...)
  return(temp)
}
