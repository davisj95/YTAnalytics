

#' Video City Data
#' 
#' @description
#' Returns top cities by views. Data is only available after January 1, 2022.
#' 
#' @param videoId Required. String. Id of YouTube video.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_cities(videoId = "dQw4w9WgXcQ")
#' } 

video_cities <- function(videoId = NULL, ...) {
  
  results <- data.frame()
  for(i in 1:length(videoId)) {
    temp <- analytics_request(dimensions = "city",
                              metrics = "views,estimatedMinutesWatched",
                              filters = paste0("video==", videoId[i]), ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, videoId[i]))
  }
  
  return(results)
}


#' Playlist City Data
#' 
#' @description
#' Returns top cities by views. Data is only available after January 1, 2022.
#'
#' @param playlistId Required. String. Id of YouTube playlist.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_cities(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' } 

playlist_cities <- function(playlistId = NULL, ...) {
  
  results <- data.frame()
  for(i in 1:length(playlistId)) {
    temp <- analytics_request(dimensions = "city",
                              metrics = "views,estimatedMinutesWatched",
                              filters = paste0("playlist==", playlistId[i]),
                              ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, playlistId[i]))
  }
  
  return(results)
}


#' Channel City Data
#' 
#' @description
#' Returns top cities by views. Data is only available after January 1, 2022.
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_cities()
#' }

channel_cities <- function(...) {
  temp <- analytics_request(dimensions = "city", 
                            metrics = "views,estimatedMinutesWatched", ...)
  return(temp)
}
