#' Channel Top Sharing Services
#'
#' @description
#' This is a wrapper function for `top_function` to return channel shares by sharing services.
#' These are the following defaults:
#' * dimension: `sharingService`
#' * metrics: `shares`
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
#' channel_top_sharing_services()
#' channel_top_sharing_services(startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'

channel_top_sharing_services <- function(...) {
  temp <- top_function(dimension = "sharingService",
                       metrics = "shares", ...)
  return(temp)
}
