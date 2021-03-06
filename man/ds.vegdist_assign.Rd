% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ds.vegdist_assign.R
\name{ds.vegdist_assign}
\alias{ds.vegdist_assign}
\title{Initiates the vegdist of a server-side R object}
\usage{
ds.vegdist_assign(data.name, newobj = NULL, datasources = NULL)
}
\arguments{
\item{data.name}{a character string providing the name of the input object.}

\item{newobj}{the name of the new object.}

\item{datasources}{a list of DSConnection-class objects obtained after login.}
}
\description{
Uses vegdist to create R object on the server-side.
}
\details{
The function create a vegdist object of the server-side
}
\author{
Stuart Wheater, DataSHIELD Development Team
}
