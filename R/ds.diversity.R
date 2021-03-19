#'
#' @title Initiates the diversity of a server-side R object
#' @description Uses diversity to create R object on the server-side.
#' @details The function create a diversity object of the server-side
#' @param data.name a character string providing the name of the input object. 
#' @param datasources a list of DSConnection-class objects obtained after login. 
#' @author Stuart Wheater, DataSHIELD Development Team
#' @export
#' @import DSI
#'

ds.diversity <- function(data.name, datasources=NULL)
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

    cally <- call("diversityDS", data.name.transmit)
    DSI::datashield.aggregate(datasources, cally)
}
#ds.diversity
