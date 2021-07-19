#' Video Audience Retention
#'
#' @description
#' This is a wrapper function for `analytics_request` to return video audience retention percentages.
#' These are the following defaults:
#' * dimension: `elapsedVideoTimeRatio`
#' * metrics: `audienceWatchRatio`
#' * filters: `audienceType==ORGANIC`
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
#' video_audience_retention(videoId = "ehd_324sjfk")
#' video_audience_retention(videoId = "ehd_324sjfkl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'


video_audience_retention <- function(videoId = NULL, audienceType = "ORGANIC", ...) {
  temp <- analytics_request(dimensions = "elapsedVideoTimeRatio",
                            metrics = "audienceWatchRatio",
                            filters = paste0("video==", videoId,
                                             ";audienceType==", audienceType), ...)
  return(temp)
}
