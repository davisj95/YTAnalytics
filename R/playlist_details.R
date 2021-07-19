#' Playlist Details
#'
#' @description
#' This is a wrapper function for `data_playlist_request` to return etag, publishing date, playlist title, description, and thumbnail info.
#'
#' @param playlistId ID of YouTube playlist
#'
#' @details see https://developers.google.com/youtube/v3/docs/playlists/list for API Documentation.
#'
#' @return data.frame
#'
#' @examples
#' playlist_details(playlistId = "asdfljASDFLJ-2348uksdfjl")
#'
#' @export
#'

playlist_details <- function(playlistId = NULL) {
  temp <- data_playlist_request(part = "snippet", id = playlistId)
  return(temp)
}
