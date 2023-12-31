% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/playlist_playback_location.R
\name{playlist_playback_location}
\alias{playlist_playback_location}
\title{Playlist Playback Location}
\usage{
playlist_playback_location(playlistId = NULL, ...)
}
\arguments{
\item{playlistId}{ID of YouTube playlist}

\item{...}{Additional arguments passed to \code{analytics_request()}.}
}
\value{
data.frame
}
\description{
This is a wrapper function for \code{analytics_request} to return playlist playback location data.
These are the following defaults:
\itemize{
\item dimension: \code{insightPlaybackLocationType}
\item metrics: \verb{views,estimatedMinutesWatched}
\item startDate: \code{2000-01-01}
\item endDate: \code{Sys.Date()}
}
}
\details{
see https://developers.google.com/youtube/analytics/data_model for API Documentation.
}
\examples{
playlist_playback_location(playlistId = "asdfljASDFLJ-2348uksdfjl")
playlist_playback_location(playlistId = "asdfljASDFLJ-2348uksdfjl", startDate = "2020-01-01", endDate = "2020-12-31")

}
