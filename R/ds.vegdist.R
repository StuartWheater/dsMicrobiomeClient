#'
#' @title Initiates the vegdist of a server-side R object
#' @description Uses vegdist to create R object on the server-side.
#' @details The function create a vegdist object of the server-side
#' @param data.name a character string providing the name of the input object. 
#' @param datasources a list of DSConnection-class objects obtained after login. 
#' @author Stuart Wheater, DataSHIELD Development Team
#' @export
#' @import DSI
#'

ds.vegdist <- function(data.name, datasources=NULL)
{
    # look for DS connections
    if (is.null(datasources))
    {
        datasources <- DSI::datashield.connections_find()
    }

    if (is.null(data.name))
    {
        stop("Please provide the name of a data.frame!", call.=FALSE)
    }

    data.name.transmit <- data.name

    cally <- call("vegdistDS", data.name.transmit, na.rm = TRUE)
    DSI::datashield.aggregate(datasources, cally)
}
#ds.vegdist
