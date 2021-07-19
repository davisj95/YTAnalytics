#' Playlist Statistics
#'
#' @description
#' This is a wrapper function for `analytics_request` to return some high level stats.
#' These are the following defaults:
#' * metrics: `views,averageViewDuration,estimatedMinutesWatched`
#' * startDate: `2000-01-01`
#' * endDate: `Sys.Date()`
#'
#' @param playlistId ID of YouTube playlist
#' @param ... Additional arguments passed to `analytics_request()`.
#'
#' @details see https://developers.google.com/youtube/analytics/data_model for API Documentation.
#'
#' @return data.frame
#'
#' @examples
#' playlist_stats(playlistId = "asdfljASDFLJ-2348uksdfjl")
#' playlist_stats(playlistId = "asdfljASDFLJ-2348uksdfjl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'

playlist_stats <- function(playlistId = NULL, ...) {
  temp <- analytics_request(metrics = paste0("views,averageViewDuration,estimatedMinutesWatched"),
                            filters = paste0("playlist==", playlistId, ";isCurated==1"), ...)
  return(temp)
}
