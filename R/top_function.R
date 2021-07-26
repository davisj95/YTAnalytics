#' Top Function
#'
#' @description
#' This is a wrapper function for `analytics_request` to simplify returning the top 10 observations of a dimension.
#'
#' @param playlistId ID of YouTube playlist
#'
#' @details see https://developers.google.com/youtube/analytics/data_model for more details on dimensions and metrics.
#'
#' @return data.frame
#'
#' @export
#'


top_function <- function(dimension, ...) {

  nm1 <- list(...)
  lst1 <- as.list(nm1)

  dim <- dimension
  met <- c(lst1[["metrics"]], "views,estimatedMinutesWatched,shares,likes,dislikes,comments")[1]
  sor <- c(lst1[['sort']], paste0("-",sub("\\,.*","", met)))[1]
  res <- c(lst1[['maxResults']], 10)[1]
  fil <- c(lst1[['filters']], NULL)[1]
  srt <- c(lst1[['startDate']], "2000-01-01")[1]
  end <- c(lst1[['endDate']], as.character(Sys.Date()))[1]


  temp <- analytics_request(dimensions = dim, metrics = met, sort = sor, maxResults = res,
                            filters = fil, startDate = srt, endDate = end, ...)
  return(temp)
}
