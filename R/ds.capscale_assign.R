#'
#' @title Initiates the capscale of a server-side R object
#' @description Uses capscale to create R object on the server-side.
#' @details The function create a capscale object of the server-side
#' @param formula a providing the formula of for processing. 
#' @param data.name a character string providing the name of the input object. 
#' @param newobj the name of the new object.
#' @param datasources a list of DSConnection-class objects obtained after login. 
#' @author Stuart Wheater, DataSHIELD Development Team
#' @export
#' @import DSI
#'

ds.capscale_assign <- function(formula, data.name, newobj=NULL, datasources=NULL)
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

    # create a name by default if user did not provide a name for the new variable
    if (is.null(newobj))
    {
        newobj <- "capscale.newobj"
    }

    formula.transmit   <- formula
    data.name.transmit <- data.name
    
    cally <- call("capscale_assignDS", formula.transmit, data.name.transmit)
    DSI::datashield.assign(datasources, newobj, cally)
}
#ds.capscale_assign
