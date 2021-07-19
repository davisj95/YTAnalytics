#' Video Live vs On Demand Stats
#'
#' @description
#' This is a wrapper function for `analytics_request` to return video views broken out by live or on demand status.
#' These are the following defaults:
#' * dimension: `liveOrOnDemand`
#' * metrics: `views,estimatedMinutesWatched,averageViewDuration`
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
#' video_live_onDemand(videoId = "ehd_324sjfk")
#' video_live_onDemand(videoId = "ehd_324sjfkl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'


video_live_onDemand <- function(videoId = NULL, ...) {
  temp <- analytics_request(dimensions = "liveOrOnDemand",
                            metrics = "views,estimatedMinutesWatched,averageViewDuration",
                            filters = paste0("video==", videoId), ...)
  return(temp)
}
