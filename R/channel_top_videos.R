#' Channel Top Videos
#'
#' @description
#' This is a wrapper function for `top_function` to return top viewed channel videos.
#' These are the following defaults:
#' * dimension: `video`
#' * metrics: `views,estimatedMinutesWatched,shares,likes,dislikes,comments`
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
#' channel_top_videos()
#' channel_top_videos(startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'

channel_top_videos <- function(...) {
  temp <- top_function(dimension = "video", ...)
  return(temp)
}
