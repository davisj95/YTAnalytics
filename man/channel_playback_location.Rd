% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/channel_playback_location.R
\name{channel_playback_location}
\alias{channel_playback_location}
\title{Channel Playback Location}
\usage{
channel_playback_location(...)
}
\arguments{
\item{...}{Additional arguments passed to \code{analytics_request()}.}
}
\value{
data.frame
}
\description{
This is a wrapper function for \code{analytics_request} to return data on playback location.
These are the following defaults:
\itemize{
\item dimensions: \code{insightPlaybackLocationType}
\item metrics: \verb{views,estimatedMinutesWatched}
\item startDate: \code{2000-01-01}
\item endDate: \code{Sys.Date()}
}
}
\details{
see https://developers.google.com/youtube/analytics/data_model for more details on dimensions and metrics.
}
\examples{
channel_playback_location()
channel_playback_location(startDate = "2020-01-01", endDate = "2020-12-31")

}
