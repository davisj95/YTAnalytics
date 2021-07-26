#' Video Captions
#'
#' @description
#' This is a wrapper function for `youtube_GET` and `httr::GET` to get a video's caption id and then the caption.
#'
#' @param videoId ID of YouTube video.
#'
#' @details see https://developers.google.com/youtube/v3/docs/captions/list for more details.
#'
#' @return data.frame
#'
#' @examples
#' video_captions(videoId = "ehd_324sjfk")
#'
#' @export
#'


video_captions <- function(videoId = NULL, ...) {
  captionListUrl <- paste0("https://www.googleapis.com/youtube/v3/captions?part=id&videoId=", videoId, ...)
  temp1 <- youtube_GET(captionListUrl, request = "data")
  captionId <- temp1$items$id

  captionDownloadUrl <- paste0("https://www.googleapis.com/youtube/v3/captions/", captionId,"?tfmt=vtt")
  temp2 <- GET(captionDownloadUrl, getOption("YouTube_Token"))
  captions <- rawToChar(temp2$content)
  return(captions)
}
