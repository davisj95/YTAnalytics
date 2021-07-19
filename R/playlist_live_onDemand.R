#' Playlist Live vs. On Demand Views
#'
#' @description
#' This is a wrapper function for `analytics_request` to return live vs. on demand data of playlist views.
#' These are the following defaults:
#' * dimension: `liveOrOnDemand`
#' * metrics: `views,estimatedMinutesWatched,averageViewDuration`
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
#' playlist_live_onDemand(playlistId = "asdfljASDFLJ-2348uksdfjl")
#' playlist_live_onDemand(playlistId = "asdfljASDFLJ-2348uksdfjl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'

playlist_live_onDemand <- function(playlistId = NULL, ...) {
  temp <- analytics_request(dimensions = "liveOrOnDemand",
                            metrics = "views,estimatedMinutesWatched,averageViewDuration",
                            filters = paste0("playlist==", playlistId, ";isCurated==1"), ...)
  return(temp)
}
