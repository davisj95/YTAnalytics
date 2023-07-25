youtube_oauth <- function(clientId = NULL, clientSecret = NULL, tokenFile = ".httr-oauth",
                          useOOB = FALSE, setEnvVar = FALSE) {
  
  # Attempt to Read in File
  if (!is.null(tokenFile) & file.exists(tokenFile)) {
    YouTubeToken <- tryCatch(
      suppressWarnings(readRDS(tokenFile))[[1]],
      error = function(e) {
        warning(sprintf("Unable to read token from: %s", tokenFile))
        NULL
      },
      finally = {
        message(sprintf("%s successfully read", tokenFile))
      }
    )
  } else if (!file.exists(tokenFile) | (file.exists(tokenFile) & is.null(token))) {
    if (is.null(clientId) | is.null(clientSecret)) {
      stop("Missing App Credentials")
    } else {
      YouTubeToken <- httr::oauth2.0_token(httr::oauth_endpoints("google"),
                                           httr::oauth_app("google", clientId, clientSecret),
                                           scope = c("https://www.googleapis.com/auth/youtube.readonly",
                                                     "https://www.googleapis.com/auth/yt-analytics.readonly",
                                                     "https://www.googleapis.com/auth/youtubepartner"),
                                           cache = tokenFile,
                                           use_oob = use_oob)
    }
  }
  
  if(setEnvVar) {
    tokenOption <- list(YouTubeToken)
    names(tokenOption) <- "YouTube_Token"
    options(tokenOption)
  }
  
  return(YouTubeToken)
}