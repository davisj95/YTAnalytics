#' Channel Playlist
#'
#' @description
#' This is a wrapper function for `data_playlist_request` to return all channel playlists.
#' By default, the function returns etag, playlistId and itemCount
#'
#' @param ... Additional arguments passed to `data_playlist_request()`.
#'
#' @details see https://developers.google.com/youtube/v3/docs/playlists/list for more details.
#'
#' @return data.frame
#'
#' @examples
#' channel_playback_location()
#' channel_playback_location(part = "contentDetails")
#'
#' @export
#'

channel_playlists <- function(...) {
  temp <- data_playlist_request(part = "contentDetails", mine = "true", maxResults = 50)
  result <- temp
  return(result)
}
