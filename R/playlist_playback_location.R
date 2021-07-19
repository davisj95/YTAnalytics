#' Playlist Playback Location
#'
#' @description
#' This is a wrapper function for `analytics_request` to return playlist playback location data.
#' These are the following defaults:
#' * dimension: `insightPlaybackLocationType`
#' * metrics: `views,estimatedMinutesWatched`
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
#' playlist_playback_location(playlistId = "asdfljASDFLJ-2348uksdfjl")
#' playlist_playback_location(playlistId = "asdfljASDFLJ-2348uksdfjl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'

playlist_playback_location <- function(playlistId = NULL, ...) {
  temp <- analytics_request(dimensions = "insightPlaybackLocationType",
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("playlist==", playlistId, ";isCurated==1"), ...)
  return(temp)
}
