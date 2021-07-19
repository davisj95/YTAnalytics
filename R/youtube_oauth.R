#' YouTube API OAuth
#'
#' This creates or grabs token to authorize API requests
#'
#' @param appId character string
#' @param appSecret character string
#' @param token environment
#'
#' @return token environment
#'
#' @examples
#' youtube_oauth("asdoiasdufhoakljfh", "hafodsifuebwmnbhk", ".httr-oauth")
#'
#' @export
#'

youtube_oauth <- function(appId = NULL, appSecret = NULL, token = NULL) {
  if (!is.null(token) && file.exists(token)) {

    YouTubeToken <- try(suppressWarnings(readRDS(token)), silent = TRUE)[[1]]

  } else if (is.null(appId) | is.null(appSecret)) {

    stop("Missing App Credentials")

  } else {
    YouTubeToken <- httr::oauth2.0_token(httr::oauth_endpoints("google"),
                                         httr::oauth_app("google", appId, appSecret),
                                         scope = c("https://www.googleapis.com/auth/youtube.readonly",
                                                   "https://www.googleapis.com/auth/yt-analytics.readonly",
                                                   "https://www.googleapis.com/auth/youtubepartner"),
                                         cache = token)
  }
  tokenOption <- list(YouTubeToken)
  names(tokenOption) <- "YouTube_Token"
  options(tokenOption)
  return(YouTubeToken)
}
