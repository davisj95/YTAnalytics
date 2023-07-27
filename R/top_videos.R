

#' Playlist Top Videos
#' 
#' @description
#' Returns top videos by views.
#'
#' @param playlistId Required. String. Id of YouTube playlist.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_top_videos(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' } 

playlist_top_videos <- function(playlistId = NULL, ...) {
  temp <- analytics_request(dimensions = "video",
                            metrics = "views,estimatedMinutesWatched,averageViewDuration,shares,likes,dislikes,comments",
                            sort = "-views",
                            filters = paste0("playlist==", playlistId), ...)
  return(temp)
}


#' Channel Top Videos
#' 
#' @description
#' Returns top videos by views
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_top_videos()
#' }

channel_traffic_details <- function(...) {
  temp <- analytics_request(dimensions = "video", 
                            metrics = "views,estimatedMinutesWatched,averageViewDuration,shares,likes,dislikes,comments",
                            sort = "-views", ...)
  return(temp)
}