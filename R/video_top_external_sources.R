#' Video Top External Traffic Sources
#'
#' @description
#' This is a wrapper function for `top_function` to return video views by external traffic source.
#' These are the following defaults:
#' * dimensions: `insightTrafficSourceDetail`
#' * metrics: `views,estimatedMinutesWatched`
#' * filter: `insightTrafficScourceType==EXT_URL`
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
#' video_top_external_sources(videoId = "ehd_324sjfk")
#' video_top_external_sources(videoId = "ehd_324sjfkl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'


video_top_external_sources <- function(videoId = NULL, ...) {
  temp <- top_function(dimension = "insightTrafficSourceDetail",
                       metrics = "views,estimatedMinutesWatched",
                       filters = paste0("video==", videoId, ";insightTrafficSourceType==EXT_URL"), ...)
  return(temp)
}
