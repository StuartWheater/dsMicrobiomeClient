#'
#' @title Initiates the capscale of a server-side R object
#' @description Uses capscale to create R object on the server-side.
#' @details The function create a capscale object of the server-side
#' @param formula an parameter of unspecified purpose
#' @param data.name a character string providing the name of the input object. 
#' @param datasources a list of DSConnection-class objects obtained after login. 
#' @author Stuart Wheater, DataSHIELD Development Team
#' @export
#' @import DSI
#'

ds.capscale <- function(formula, data.name, datasources=NULL)
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

    formula.transmit   <- formula
    data.name.transmit <- data.name
    
    cally               <- call("capscaleDS", formula.transmit, data.name.transmit)
    capscale.raw.result <- DSI::datashield.aggregate(datasources, cally)
    
    capscale.result <- capscale.raw.result
    
    return(capscale.result)
}
#ds.capscale
