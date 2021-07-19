#' Playlist Subscription Status
#'
#' @description
#' This is a wrapper function for `analytics_request` to return subscription status of playlist views.
#' These are the following defaults:
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
#' playlist_subscription_status(playlistId = "asdfljASDFLJ-2348uksdfjl")
#' playlist_subscription_status(playlistId = "asdfljASDFLJ-2348uksdfjl", startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'

playlist_subscription_status <- function(playlistId = NULL, ...) {
  temp <- analytics_request(dimensions = "subscribedStatus",
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("playlist==", playlistId, ";isCurated==1"), ...)
  return(temp)
}
