

#' Video Metadata
#'
#' @param videoId Required. String. Id of YouTube Video.
#' @param ... Addt. arguments passed to \code{data_video_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_metadata(videoId = "dQw4w9WgXcQ")
#' }

video_metadata <- function(videoId = NULL, ...) {
  
  metadata <- data.frame()
  pb <- prog_bar(length(videoId))
  for(i in 1:length(videoId)) {
    pb$tick()
    temp <- as.data.frame(data_video_request(part = "snippet", id = videoId[i], ...))
    if(!is.null(temp)) {
      temp2 <- temp$items.snippet
      metadata <- dplyr::bind_rows(metadata, error_checking(temp2, videoId[i], "video"))
    }
  }
  return(metadata)
}



#' Playlist Metadata
#'
#' @param videoId Required. String. Id of YouTube Video.
#' @param ... Addt. arguments passed to \code{data_video_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_metadata(playlistId = "dQw4w9WgXcQ")
#' }

playlist_metadata <- function(playlistId = NULL, ...) {
  
  metadata <- data.frame()
  pb <- prog_bar(length(playlistId))
  for(i in 1:length(playlistId)) {
    pb$tick()
    temp <- as.data.frame(data_playlist_request(part = "snippet", id = playlistId[i], ...))
    if(!is.null(temp)) {
      temp2 <- temp$items.snippet
      metadata <- dplyr::bind_rows(metadata, error_checking(temp2, playlistId[i], "playlist"))
    }
  }
  return(metadata)
}
test <- playlist_metadata(playlistId, token = newEnglishToken)

videoId <- "DHBo7ka3YZQ"

YTAnalytics::video_countries(videoId, metrics <- "views,estimatedMinutesWatched,subscribersGained", token = newEnglishToken)

YTAnalytics::video_traffic_details(videoId, metrics <- "views,estimatedMinutesWatched,subscribersGained", token = newEnglishToken)

testError <- "Invalid value (views,estimatedMinutesWatched,subscribersGained) given in field parameters.filters.globalinvalid"
pattern <- "Invalid value \\(.*\\) given in field parameters\\.filters\\.globalinvalid"

if (grepl(pattern, testError))