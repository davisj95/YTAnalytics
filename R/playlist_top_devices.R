#' Playlist Top Devices
#'
#' @description
#' This is a wrapper function for `top_function` to return playlist views by device.
#' These are the following defaults:
#' * dimension: `deviceType`
#' * metrics: `views,estimatedMinutesWatched`
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
#' playlist_top_devices(playlistId = "asdfljASDFLJ-2348uksdfjl")
#' playlist_top_devices(playlistId = "asdfljASDFLJ-2348uksdfjl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'


playlist_top_devices <- function(playlistId = NULL, ...) {
  temp <- top_function(dimension = "deviceType",
                       metrics = "views,estimatedMinutesWatched",
                       filters = paste0("playlist==", playlistId, ";isCurated==1"), ...)
  return(temp)
}
