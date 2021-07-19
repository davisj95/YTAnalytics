#' YouTube Get Function
#'
#' @description
#' This is a helper function to execute GET requests and clean the data depending on what API is being called
#'
#' @return data.frame
#'
#' @examples
#' youtube_GET("https://www.google.com", request = "data")
#'
#' @export
#'

youtube_GET <- function(url, request, token = getOption(file)){
  r <- httr::GET(url, token)
  temp <- jsonlite::fromJSON(paste0(rawToChar(r$content)))
  if(status_code(r) != 200) {
    errorMessage <- temp$error$errors
    stop(errorMessage)
  }

  if (request == "analytics") {
    if (length(temp$rows) > 0) {
      df <- as.data.frame(temp$rows)
      colnames(df) <- temp$columnHeaders$name
      return(df)
    }
  } else if (request == "data") {
    if (length(temp$items) > 0) {
      return(temp)
    }
  }
}


#' Analytics Request Function
#'
#' @description
#' This is a wrapper function for the YouTube Analytics API
#'
#' @return data.frame
#'
#' @examples
#' analytics_request(dimensions = "video", metrics = "views", maxResults = 5)
#'
#' @details see https://developers.google.com/youtube/analytics/data_model for API Documentation.
#'
#' @export
#'

analytics_request <- function(dimensions = NULL, metrics = NULL, sort = NULL,
                              maxResults = NULL, filters = NULL, startDate = "2000-01-01",
                              endDate = Sys.Date()) {

  url <- paste0("https://youtubeanalytics.googleapis.com/v2/reports?",
                "&ids=channel%3D%3DMINE",
                "&startDate=", startDate,
                "&endDate=", endDate)

  if (!is.null(dimensions)){ url <- paste0(url, "&dimensions=", dimensions)}
  if (!is.null(metrics)){    url <- paste0(url, "&metrics=", metrics)}
  if (!is.null(sort)){       url <- paste0(url, "&sort=", sort)}
  if (!is.null(maxResults)){ url <- paste0(url, "&maxResults=", maxResults)}
  if (!is.null(filters)){    url <- paste0(url, "&filters=", filters)}

  temp <- youtube_GET(url, request = "analytics")
  return(temp)
}

#' Channel Requests
#'
#' @description
#' This is a wrapper function for channel data in the YouTube Data API.
#'
#' @return data.frame
#'
#' @examples
#' data_channel_request(part = "contentDetails", mine = "true")
#'
#' @details see https://developers.google.com/youtube/v3/docs/channels/list for API Documentation.
#'
#' @export
#'

data_channel_request <- function(part = NULL, categoryId = NULL, forUsername = NULL, hl = NULL,
                                 id = NULL, managedByMe = NULL, maxResults = 5, mine = NULL,
                                 mySubscribers = NULL, onBehalfOfContentOwner = NULL, pageToken = NULL) {

  url <- paste0("https://www.googleapis.com/youtube/v3/channels?part=",
                part, "&maxResults=", maxResults)

  if (!is.null(categoryId))    { url <- paste0(url, "&categoryId=", categoryId)}
  if (!is.null(forUsername))   { url <- paste0(url, "&forUsername=", forUsername)}
  if (!is.null(hl))            { url <- paste0(url, "&hl=", hl)}
  if (!is.null(id))            { url <- paste0(url, "&id=", id)}
  if (!is.null(managedByMe))   { url <- paste0(url, "&managedByMe=", managedByMe)}
  if (!is.null(mine))          { url <- paste0(url, "&mine=", mine)}
  if (!is.null(mySubscribers)) { url <- paste0(url, "&mySubscribers=", mySubscribers)}
  if (!is.null(onBehalfOfContentOwner))   { url <- paste0(url, "&onBehalfOfContentOwner=", onBehalfOfContentOwner)}
  if (!is.null(pageToken))     { url <- paste0(url, "&pageToken=", pageToken)}

  temp <- youtube_GET(url, request = "data")
  return(temp)
}

#' Playlist Requests
#'
#' @description
#' This is a wrapper function for playlist data in the YouTube Data API.
#'
#' @return data.frame
#'
#' @examples
#' data_playlist_request(part = "contentDetails", mine = "true")
#'
#' @details see https://developers.google.com/youtube/v3/docs/playlists/list for API Documentation.
#'
#' @export
#'

data_playlist_request <- function(part = NULL, channelId = NULL, hl = NULL, id = NULL,
                                  maxResults = 5, mine = NULL, onBehalfOfContentOwner = NULL,
                                  onBehalfOfContentOwnerChannel = NULL, pageToken = NULL) {

  url <- paste0("https://www.googleapis.com/youtube/v3/playlists?part=",
                part, "&maxResults=", maxResults)

  if (!is.null(channelId))   { url <- paste0(url, "&channelId=", channelId)}
  if (!is.null(hl))          { url <- paste0(url, "&hl=", hl)}
  if (!is.null(id))          { url <- paste0(url, "&id=", id)}
  if (!is.null(mine))        { url <- paste0(url, "&mine=", mine)}
  if (!is.null(maxResults))  { url <- paste0(url, "&maxResults=", maxResults)} else { url <- paste0(url, "&maxResults=5") }
  if (!is.null(onBehalfOfContentOwner))   { url <- paste0(url, "&onBehalfOfContentOwner=", onBehalfOfContentOwner)}
  if (!is.null(onBehalfOfContentOwnerChannel))   { url <- paste0(url, "&onBehalfOfContentOwnerChannel=", onBehalfOfContentOwnerChannel)}
  if (!is.null(pageToken))   { url <- paste0(url, "&pageToken=", pageToken)}

  temp <- youtube_GET(url, request = "data")
  if(maxResults >= 50) {
    df <- data.frame()
    df <- bind_rows(df, temp$items)
    pageToken <- temp$nextPageToken
    while(!is.null(pageToken)) {
      loopUrl <- paste0(url, "&pageToken=",pageToken)
      temp <- youtube_GET(loopUrl, request = "data")
      df <- bind_rows(df, temp$items)
      pageToken <- temp$nextPageToken
    }
    return(df)
  }
  return(temp)
}

#' PlaylistItem Requests
#'
#' @description
#' This is a wrapper function for playlist items data in the YouTube Data API.
#'
#' @return data.frame
#'
#' @examples
#' data_playlistItem_request(part = "contentDetails", id = "asdfklj234jknfdsfs")
#'
#' @details see https://developers.google.com/youtube/v3/docs/playlistItems/list for API Documentation.
#'
#' @export
#'

data_playlistItem_request <- function(part = NULL, id = NULL, maxResults = 5,
                                      onBehalfOfContentOwner = NULL, pageToken = NULL,
                                      playlistId = NULL, videoId = NULL) {

  url <- paste0("https://www.googleapis.com/youtube/v3/playlistItems?part=",
                part, "&maxResults=", maxResults)

  if (!is.null(id))          { url <- paste0(url, "&id=", id)}
  if (!is.null(onBehalfOfContentOwner))   { url <- paste0(url, "&onBehalfOfContentOwner=", onBehalfOfContentOwner)}
  if (!is.null(pageToken))   { url <- paste0(url, "&pageToken=", pageToken)}
  if (!is.null(playlistId))  { url <- paste0(url, "&playlistId=", playlistId)}
  if (!is.null(videoId))     { url <- paste0(url, "&videoId=", videoId)}

  temp <- youtube_GET(url, request = "data")

  if(maxResults >= 50) {
    df <- data.frame()
    df <- bind_rows(df, temp$items$contentDetails)
    pageToken <- temp$nextPageToken
    while(!is.null(pageToken)) {
      loopUrl <- paste0(url, "&pageToken=",pageToken)
      temp <- youtube_GET(loopUrl, request = "data")
      df <- bind_rows(df, temp$items$contentDetails)
      pageToken <- temp$nextPageToken
    }
    return(df)
  }
  return(temp)
}

#' Video Requests
#'
#' @description
#' This is a wrapper function for video data in the YouTube Data API.
#'
#' @return data.frame
#'
#' @examples
#' data_video_request(part = "contentDetails", id = "asdfklj234jknfdsfs")
#'
#' @details see https://developers.google.com/youtube/v3/docs/videos/list for API Documentation.
#'
#' @export
#'
#'

data_video_request <- function(part = NULL, chart = NULL, hl = NULL, id = NULL, locale = NULL,
                               maxHeight = NULL, maxResults = NULL, maxWidth = NULL,
                               myRating = NULL, onBehalfOfContentOwner = NULL, pageToken = NULL,
                               regionCode = NULL, videoCategoryId = NULL) {

  url <- paste0("https://www.googleapis.com/youtube/v3/videos?part=", part)

  if (!is.null(chart)) { url <- paste0(url, "&chart=", chart)}
  if (!is.null(id))          { url <- paste0(url, "&id=", id)}
  if (!is.null(hl))          { url <- paste0(url, "&id=", hl)}
  if (!is.null(locale)) { url <- paste0(url, "&locale=", locale)}
  if (!is.null(maxHeight))        { url <- paste0(url, "&maxHeight=", maxHeight)}
  if (!is.null(maxResults))  { url <- paste0(url, "&maxResults=", maxResults)}
  if (!is.null(maxWidth))        { url <- paste0(url, "&maxWidth=", maxWidth)}
  if (!is.null(myRating))        { url <- paste0(url, "&myRating=", myRating)}
  if (!is.null(onBehalfOfContentOwner))   { url <- paste0(url, "&onBehalfOfContentOwner=", onBehalfOfContentOwner)}
  if (!is.null(pageToken))   { url <- paste0(url, "&pageToken=", pageToken)}
  if (!is.null(regionCode))  { url <- paste0(url, "&regionCode=", regionCode)}
  if (!is.null(videoCategoryId))  { url <- paste0(url, "&videoCategoryId=", videoCategoryId)}

  temp <- youtube_GET(url, request = "data")

  return(temp)
}
