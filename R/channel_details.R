#' Channel Details
#'
#' This is a wrapper function for `data_channel_request`. By default it returns
#' `contentDetails` - such as likes, favorites, and uploads playlists.
#'
#' @param ... Additional arguments passed to `data_channel_request()`.
#'
#' @details see https://developers.google.com/youtube/v3/docs/channels/list for more details.
#'
#' @return data.frame
#'
#' @examples
#' channel_details()
#' channel_details(part = "snippet")
#'
#' @export
#'

channel_details<- function(part = "contentDetails", ...) {
  temp <- data_channel_request(part = part, mine = "true", ...)
  return(temp$items)
}
