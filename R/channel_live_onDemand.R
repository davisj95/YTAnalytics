#' Channel Live vs On Demand Stats
#'
#' @description
#' This is a wrapper function for `analytics_request`. These are the following
#' defaults:
#' * dimensions: `liveOrOnDemand`
#' * metrics: `views,estimatedMinutesWatched,averageViewDuration`
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
#' channel_live_onDemand()
#' channel_live_onDemand(startDate = "2020-01-01", endDate = "2020-12-31")
#'
#' @export
#'

channel_live_onDemand <- function(...) {
  temp <- analytics_request(dimensions = "liveOrOnDemand",
                            metrics = "views,estimatedMinutesWatched,averageViewDuration", ...)
  return(temp)
}
