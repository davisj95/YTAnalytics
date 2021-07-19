#' Video Top Traffic Sources
#'
#' @description
#' This is a wrapper function for `top_function` to return video views by traffic source.
#' These are the following defaults:
#' * dimensions: `insightTrafficSourceType`
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
#' video_top_traffic_sources(videoId = "ehd_324sjfk")
#' video_top_traffic_sources(videoId = "ehd_324sjfkl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'


video_top_traffic_sources <- function(videoId = NULL, ...) {
  temp <- top_function(dimension = "insightTrafficSourceType",
                       metrics = "views,estimatedMinutesWatched",
                       filters = paste0("video==", videoId), ...)
  return(temp)
}
