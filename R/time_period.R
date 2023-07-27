

#' Video Time Period Views
#' 
#' @description
#' Returns video views by day or month.
#' 
#' @param videoId Required. String. Id of YouTube video.
#' @param period Required. Time period to breakdown data by. Supported values are 
#' \code{day} and \code{month}
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_time_period(videoId = "dQw4w9WgXcQ", period = "month")
#' } 

video_time_period <- function(videoId = NULL, period = "day", ...) {
  
  time_period_check(period)
  temp <- analytics_request(dimensions = period,
                            filters = paste0("video==", videoId), ...)
  return(temp)
}



#' Playlist Time Period Views
#' 
#' @description
#' Returns playlist views by day or month.
#'
#' @param playlistId Required. String. Id of YouTube playlist.
#' @param period Required. Time period to breakdown data by. Supported values are 
#' \code{day} and \code{month}
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_time_period(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' } 

playlist_time_period <- function(playlistId = NULL, period = "day", ...) {
  
  time_period_check(period)
  temp <- analytics_request(dimensions = period,
                            filters = paste0("playlist==", playlistId), ...)
  return(temp)
}



#' Channel Time Period Views
#' 
#' @description
#' Returns channel views by day or month.
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#' @param period Required. Time period to breakdown data by. Supported values are 
#' \code{day} and \code{month}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_time_period()
#' }

channel_time_period <- function(period = "day", ...) {
  
  time_period_check(period)
  temp <- analytics_request(dimensions = period, ...)
  return(temp)
}
