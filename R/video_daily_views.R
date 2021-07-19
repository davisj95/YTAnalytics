#' Daily Video Views
#'
#' @description
#' This is a wrapper function for `analytics_request` to return daily video views.
#' These are the following defaults:
#' * dimension: `day`
#' * metrics: `views`
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
#' video_daily_views(videoId = "ehd_324sjfk")
#' video_daily_views(videoId = "ehd_324sjfkl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'


video_daily_views <- function(videoId = NULL, ...) {
  temp <- analytics_request(dimensions = "day",
                            metrics = "views",
                            filters = paste0("video==", videoId), ...)
  return(temp)
}
