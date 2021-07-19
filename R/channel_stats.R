#' Channel Stats
#'
#' @description
#' This is a wrapper function for `analytics_request` to return channel statistics.
#' These are the following defaults:
#' * metrics: `views,averageViewDuration,estimatedMinutesWatched,shares,likes,dislikes,comments,subscribersGained,subscribersLost`
#' * startDate: `2000-01-01`
#' * endDate: `Sys.Date()`
#'
#' @param ... Additional arguments passed to `analytics_request()`.
#'
#' @details see https://developers.google.com/youtube/analytics/data_model for more details on dimensions and metrics.
#'
#' @return data.frame
#'
#' @examples
#' channel_stats()
#' channel_stats(startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'

channel_stats <- function(...) {
  temp <- analytics_request(metrics = paste0("views,averageViewDuration,estimatedMinutesWatched,shares,likes,",
                                             "dislikes,comments,subscribersGained,subscribersLost"),
                            sort="-views", ...)
  return(temp)
}
