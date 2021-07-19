#' Video Subscription Status
#'
#' @description
#' This is a wrapper function for `analytics_request` to return subscription status of video views.
#' These are the following defaults:
#' * dimensions: `subscribedStatus`
#' * metrics: `views,estimatedMinutesWatched`
#' * startDate: `2000-01-01`
#' * endDate: `Sys.Date()`
#'
#' @param videoId ID of YouTube video.
#' @param ... Additional arguments passed to `analytics_request()`.
#'
#' @details see https://developers.google.com/youtube/analytics/data_model for more details on dimensions and metrics.
#'
#' @return data.frame
#'
#' @examples
#' video_subscription_status(videoId = "ehd_324sjfk")
#' video_subscription_status(videoId = "ehd_324sjfkl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'


video_subscription_status <- function(videoId = NULL, ...) {
  temp <- analytics_request(dimensions = "subscribedStatus",
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("video==", videoId), ...)
  return(temp)
}
