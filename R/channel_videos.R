#' Channel Top Videos
#'
#' @description
#' This is a wrapper function for `channel_details` and `data_playlistItem_request` to return all channel videos
#'
#' @details see https://developers.google.com/youtube/v3/docs/playlistItems/list for more details.
#'
#' @return data.frame
#'
#' @examples
#' channel_videos()
#'
#' @export
#'

channel_videos <- function() {
  channelData <- channel_details(part = "contentDetails")
  uploads <- channelData$contentDetails$relatedPlaylists$uploads
  temp <- data_playlistItem_request(part = "contentDetails",
                                    playlistId = uploads, maxResults = 50)
  return(temp)
}
