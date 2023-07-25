
#' YouTube GET Function
#' 
#' this is a helper function to execute GET requests and clean data 
#' depending on what API is being called.
#' This function can be but is not intended to be called directly.
#'
#' @param url Required. Url path for API request
#' @param request Required. Used to specify if requesting data from the 
#'                YouTube Analytics API or YouTube Data api. Either 'analytics' or 'data'.
#' @param token Required.
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' youtube_GET(paste0("https://youtubeanalytics.googleapis.com/v2/reports?",
#'                    "endDate=2018-05-01",
#'                    "&ids=channel==MINE",
#'                    "&metrics=views,comments,likes,dislikes,estimatedMinutesWatched",
#'                    "&startDate=2017-01-01"),
#'            "analytics")
#' }

youtube_GET <- function(url = NULL, request = NULL, token = getOption("YouTube_Token")){
  
  if(is.null(url) | is.null(request)) stop("url and request required.")
  
  r <- httr::GET(url, token)
  temp <- jsonlite::fromJSON(httr::content(r, as = "text"))
  
  if(httr::status_code(r) != 200) stop(temp$error$errors)
  
  if (request == "analytics") {
    
    if (length(temp$rows)) {
      
      df <- as.data.frame(temp$rows)
      colnames(df) <- temp$columnHeaders$name
      
      dataTypes <- temp$columnHeaders$dataType
      
      for(i in 1:nrow(temp$columnHeaders)) {
        if(dataTypes[i] %in% c("INTEGER", "DOUBLE", "FLOAT")) {
          df[,i] <- as.numeric(df[,i])
        }
      }
      return(df)
      
    }
    
  } else if (request == "data") {
    
    if (length(temp$items)) return(temp)
  }
}


#' Analytics Request Function
#' 
#' This is the function to make API calls to the YouTube Analytics API. Most other
#' functions in this package are wrappers for this function with some arguments already populated.
#'
#' @param dimensions String. See \url{https://developers.google.com/youtube/analytics/dimensions}
#'                   for valid arguments.
#' @param metrics String. See \url{https://developers.google.com/youtube/analytics/metrics}
#'                for valid arguments.
#' @param sort String. Specify by which metric/dimensions to sort output if applicable.
#' @param maxResults Integer. Specify the number of results to return. Maximum is 200.
#' @param filters String. Specify dimension to filter on if applicable. Ex: video==dQw4w9WgXcQ
#' @param startDate Required. String specifying start date.
#' @param endDate Required. String specifying end date.
#' @param ids Required. Specify the channel. By default the function will specify \code{"channel==MINE"}
#' @param currency String. Specify currency if applicable
#' @param startIndex Integer. Specify index of first entity to retrieve, if applicable.
#' @param includeHistoricalChannelData String. Indicates whether the API response should include 
#'                                     channels' watch time and view data from the time period prior
#'                                     to when the channels were linked to the content owner. Only
#'                                     applies to content owner reports. Either 'true' or 'false'.
#' @param token Required.
#'
#' @return data.frame
#' @export
#'
#' @examples
analytics_request <- function(dimensions = NULL, metrics = NULL, sort = NULL,
                              maxResults = NULL, filters = NULL, startDate = "2000-01-01",
                              endDate = Sys.Date(), ids = "channel==MINE",currency = NULL,
                              startIndex = NULL, includeHistoricalChannelData = NULL,
                              token = getOption("YouTube_Token")) {
  
  baseUrl <- "https://youtubeanalytics.googleapis.com/v2/reports?"
  params <- as.list(environment)
  paramsList <- Filter(Negate(is.null), params[params != "token"])
  
  queryUrl <- paste0(baseUrl, paste0("&", names(paramsList), "=", unlist(paramsList), collapse = ""))
  
  temp <- youtube_GET(queryUrl, request = "analytics", token = token)
  return(temp)
}


#' Title
#'
#' @param part 
#' @param categoryId 
#' @param forUsername 
#' @param hl 
#' @param id 
#' @param managedByMe 
#' @param maxResults 
#' @param mine 
#' @param mySubscribers 
#' @param onBehalfOfContentOwner 
#' @param pageToken 
#' @param token 
#'
#' @return
#' @export
#'
#' @examples
data_channel_request <- function(part = NULL, categoryId = NULL, forUsername = NULL, hl = NULL,
                                 id = NULL, managedByMe = NULL, maxResults = 5, mine = NULL,
                                 mySubscribers = NULL, onBehalfOfContentOwner = NULL, pageToken = NULL,
                                 token = getOption("YouTube_Token")) {
  
  baseUrl <- "https://www.googleapis.com/youtube/v3/channels?part="
  params <- as.list(environment)
  paramsList <- Filter(Negate(is.null), params[params != "token"])
  queryUrl <- paste0(baseUrl, paste0("&", names(paramsList), "=", unlist(paramsList), collapse = ""))
  
  temp <- youtube_GET(queryUrl, request = "data", token = token)
  return(temp)
}


#' Title
#'
#' @param part 
#' @param channelId 
#' @param hl 
#' @param id 
#' @param maxResults 
#' @param mine 
#' @param onBehalfOfContentOwner 
#' @param onBehalfOfContentOwnerChannel 
#' @param pageToken 
#' @param token 
#'
#' @return
#' @export
#'
#' @examples
data_playlist_request <- function(part = NULL, channelId = NULL, hl = NULL, id = NULL,
                                  maxResults = 5, mine = NULL, onBehalfOfContentOwner = NULL,
                                  onBehalfOfContentOwnerChannel = NULL, pageToken = NULL,
                                  token = getOption("YouTube_Token")) {
  
  baseUrl <- "https://www.googleapis.com/youtube/v3/playlists?part="
  params <- as.list(environment)
  paramsList <- Filter(Negate(is.null), params[params != "token"])
  queryUrl <- paste0(baseUrl, paste0("&", names(paramsList), "=", unlist(paramsList), collapse = ""))
  
  temp <- youtube_GET(queryUrl, request = "data", token = token)
  if(maxResults > 50) {
    
    df <- data.frame()
    df <- dplyr::bind_rows(df, temp$items)
    pageToken <- temp$nextPageToken
    
    while(!is.null(pageToken)) {
      
      loopUrl <- paste0(queryUrl, "&pageToken=",pageToken)
      temp <- youtube_GET(loopUrl, request = "data", token = token)
      df <- dplyr::bind_rows(df, temp$items)
      pageToken <- temp$nextPageToken
      
    }
    return(df)
  }
  return(temp)
}


#' Title
#'
#' @param part 
#' @param id 
#' @param maxResults 
#' @param onBehalfOfContentOwner 
#' @param pageToken 
#' @param playlistId 
#' @param videoId 
#' @param token 
#'
#' @return
#' @export
#'
#' @examples
data_playlistItem_request <- function(part = NULL, id = NULL, maxResults = 5,
                                      onBehalfOfContentOwner = NULL, pageToken = NULL,
                                      playlistId = NULL, videoId = NULL,
                                      token = getOption("YouTube_Token")) {
  
  baseUrl <- "https://www.googleapis.com/youtube/v3/playlistItems?part="
  params <- as.list(environment)
  paramsList <- Filter(Negate(is.null), params[params != "token"])
  queryUrl <- paste0(baseUrl, paste0("&", names(paramsList), "=", unlist(paramsList), collapse = ""))
  
  temp <- youtube_GET(queryUrl, request = "data", token = token)
  
  if(maxResults > 50) {
    
    df <- data.frame()
    df <- dplyr::bind_rows(df, temp$items$contentDetails)
    pageToken <- temp$nextPageToken
    
    while(!is.null(pageToken)) {
      
      loopUrl <- paste0(queryUrl, "&pageToken=",pageToken)
      temp <- youtube_GET(loopUrl, request = "data")
      df <- dplyr::bind_rows(df, temp$items$contentDetails)
      pageToken <- temp$nextPageToken
    }
    return(df)
  }
  return(temp)
}


#' Title
#'
#' @param part 
#' @param chart 
#' @param hl 
#' @param id 
#' @param locale 
#' @param maxHeight 
#' @param maxResults 
#' @param maxWidth 
#' @param myRating 
#' @param onBehalfOfContentOwner 
#' @param pageToken 
#' @param regionCode 
#' @param videoCategoryId 
#' @param token 
#'
#' @return
#' @export
#'
#' @examples
data_video_request <- function(part = NULL, chart = NULL, hl = NULL, id = NULL, locale = NULL,
                               maxHeight = NULL, maxResults = NULL, maxWidth = NULL,
                               myRating = NULL, onBehalfOfContentOwner = NULL, pageToken = NULL,
                               regionCode = NULL, videoCategoryId = NULL,
                               token = getOption("YouTube_Token")) {
  
  baseUrl <- "https://www.googleapis.com/youtube/v3/videos?part="
  params <- as.list(environment)
  paramsList <- Filter(Negate(is.null), params[params != "token"])
  queryUrl <- paste0(baseUrl, paste0("&", names(paramsList), "=", unlist(paramsList), collapse = ""))
  
  temp <- youtube_GET(queryUrl, request = "data", token = token)
  
  return(temp)
}