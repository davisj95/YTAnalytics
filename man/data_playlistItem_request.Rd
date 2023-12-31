% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_request_functions.R
\name{data_playlistItem_request}
\alias{data_playlistItem_request}
\title{PlaylistItem Requests}
\usage{
data_playlistItem_request(
  part = NULL,
  id = NULL,
  maxResults = 5,
  onBehalfOfContentOwner = NULL,
  pageToken = NULL,
  playlistId = NULL,
  videoId = NULL
)
}
\value{
data.frame
}
\description{
This is a wrapper function for playlist items data in the YouTube Data API.
}
\details{
see https://developers.google.com/youtube/v3/docs/playlistItems/list for API Documentation.
}
\examples{
data_playlistItem_request(part = "contentDetails", id = "asdfklj234jknfdsfs")

}
