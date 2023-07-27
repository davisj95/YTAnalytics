

#' Video Sharing Services Data
#' 
#' @description
#' Returns top sharing services by views 
#' 
#' @param videoId Required. String. Id of YouTube video.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_sharing_services(videoId = "dQw4w9WgXcQ")
#' } 

video_sharing_services <- function(videoId = NULL, ...) {
  temp <- analytics_request(dimensions = "sharingService",
                            metrics = "shares",
                            filters = paste0("video==", videoId), ...)
  return(temp)
}


#' Playlist Sharing Services Data
#' 
#' @description
#' Returns top sharing services by views
#'
#' @param playlistId Required. String. Id of YouTube playlist.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_sharing_services(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' } 

playlist_sharing_services <- function(playlistId = NULL, ...) {
  temp <- analytics_request(dimensions = "sharingService",
                            metrics = "shares",
                            filters = paste0("playlist==", playlistId), ...)
  return(temp)
}


#' Channel Sharing Services Data
#' 
#' @description
#' Returns top sharing services by views
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_sharing_services()
#' }

channel_sharing_services <- function(...) {
  temp <- analytics_request(dimensions = "sharingService",
                            metrics = "shares", ...)
  return(temp)
}
