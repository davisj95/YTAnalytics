#' Channel Subscription Status
#'
#' @description
#' This is a wrapper function for `analytics_request` to return subscription status of channel views.
#' These are the following defaults:
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
#' channel_subscription_status()
#' channel_subscription_status(startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'

channel_subscription_status <- function(...) {
  temp <- analytics_request(dimensions = "subscribedStatus",
                            metrics = "views,estimatedMinutesWatched", ...)
  return(temp)
}
