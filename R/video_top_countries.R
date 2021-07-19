#' Video Top Countries
#'
#' @description
#' This is a wrapper function for `top_function` to return video country views.
#' These are the following defaults:
#' * dimensions: `country`
#' * metrics: `views,estimatedMinutesWatched,shares,likes,dislikes,comments`
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
#' video_top_countries(videoId = "ehd_324sjfk")
#' video_top_countries(videoId = "ehd_324sjfkl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'


video_top_countries <- function(videoId = NULL, ...) {
  temp <- top_function(dimension = "country",
                       filters = paste0("video==", videoId), ...)
  return(temp)
}
