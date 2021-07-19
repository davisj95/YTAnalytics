#' Channel Playback Location
#'
#' @description
#' This is a wrapper function for `analytics_request` to return data on playback location.
#' These are the following defaults:
#' * dimensions: `insightPlaybackLocationType`
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
#' channel_playback_location()
#' channel_playback_location(startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'

channel_playback_location <- function(...) {
  temp <- analytics_request(dimensions = "insightPlaybackLocationType",
                            metrics = "views,estimatedMinutesWatched", ...)
  return(temp)
}
