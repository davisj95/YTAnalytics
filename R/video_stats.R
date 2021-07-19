#' Video Statistics
#'
#' @description
#' This is a wrapper function for `analytics_request` to return some high level video stats.
#' These are the following defaults:
#' * metrics: `views,averageViewDuration,estimatedMinutesWatched,shares,likes,dislikes,comments,subscribersGained,subscribersLost`
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
#' video_stats(videoId = "ehd_324sjfk")
#' video_stats(videoId = "ehd_324sjfkl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'


video_stats <- function(videoId = NULL, ...) {
  temp <- analytics_request(metrics = paste0("views,averageViewDuration,estimatedMinutesWatched,shares,likes,",
                                             "dislikes,comments,subscribersGained,subscribersLost"),
                            filters = paste0("video==", videoId), ...)
  return(temp)
}
