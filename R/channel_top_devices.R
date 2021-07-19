#' Channel Top Devices
#'
#' @description
#' This is a wrapper function for `top_function` to return channel views by device type.
#' These are the following defaults:
#' * dimension: `deviceType`
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
#' channel_top_devices()
#' channel_top_devices(startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'

channel_top_devices <- function(...) {
  temp <- top_function(dimension = "deviceType",
                       metrics = "views,estimatedMinutesWatched", ...)
  return(temp)
}
