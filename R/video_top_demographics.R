#' Video Top Demographics
#'
#' @description
#' This is a wrapper function for `top_function` to return video views by age & gender.
#' These are the following defaults:
#' * dimensions: `ageGroup, gender`
#' * metrics: `viewerPercentage`
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
#' video_top_demographics(videoId = "ehd_324sjfk")
#' video_top_demographics(videoId = "ehd_324sjfkl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'


video_top_demographics <- function(videoId = NULL, ...) {
  temp <- top_function(dimension = "ageGroup,gender",
                       metrics = "viewerPercentage",
                       sort = "gender,ageGroup",
                       filters = paste0("video==", videoId), ...)
  return(temp)
}
