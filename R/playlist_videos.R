#' Playlist Videos
#'
#' @description
#' This is a wrapper function for `data_playlistItem_request` to return all playlist videos.
#'
#' @param playlistId ID of YouTube playlist
#'
#' @details see https://developers.google.com/youtube/v3/docs/playlistItems/list for more details.
#'
#' @return data.frame
#'
#' @examples
#' playlist_videos(playlistId = "asdfljASDFLJ-2348uksdfjl")
#'
#' @export
#'


playlist_videos <- function(playlistId = NULL) {
  temp <- data_playlistItem_request(part = "contentDetails", playlistId = playlistId, maxResults = 50)
  return(temp)
}
