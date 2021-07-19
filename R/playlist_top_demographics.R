#' Playlist Top Demographics
#'
#' @description
#' This is a wrapper function for `top_function` to return playlist views by age & gender.
#' These are the following defaults:
#' * dimension: `ageGroup,gender`
#' * metrics: `viewerPercentage`
#' * startDate: `2000-01-01`
#' * endDate: `Sys.Date()`
#'
#' @param playlistId ID of YouTube playlist
#' @param ... Additional arguments passed to `analytics_request()`.
#'
#' @details see https://developers.google.com/youtube/analytics/data_model for more details on dimensions and metrics.
#'
#' @return data.frame
#'
#' @examples
#' playlist_top_demographics(playlistId = "asdfljASDFLJ-2348uksdfjl")
#' playlist_top_demographics(playlistId = "asdfljASDFLJ-2348uksdfjl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'


playlist_top_demographics <- function(playlistId = NULL, ...) {
  temp <- top_function(dimension = "ageGroup,gender",
                       metrics = "viewerPercentage",
                       sort = "gender,ageGroup",
                       filters = paste0("playlist==", playlistId, ";isCurated==1"), ...)
  return(temp)
}
