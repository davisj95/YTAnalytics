#' Video Details
#'
#' @description
#' This is a wrapper function for `data_video_request` to return video details.
#' By default it returns etags, duration, dimension, definition, and caption status.
#'
#' @param videoId ID of YouTube video.
#' @param ... Additional arguments passed to `data_video_request()`.
#'
#' @details see https://developers.google.com/youtube/v3/docs/videos/list for more details.
#'
#' @return data.frame
#'
#' @examples
#' video_details(videoId = "ehd_324sjfk")
#'
#' @export
#'


video_details <- function(videoId = NULL, ...) {
  temp <- data_video_request(part = "contentDetails", id = videoId, ...)
  return(temp$items)
}
