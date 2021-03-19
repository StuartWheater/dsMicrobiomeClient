#'
#' @title Initiates the adonis of a server-side R object
#' @description Uses adonis to create R object on the server-side.
#' @details The function create a adonis object of the server-side
#' @param formula a providing the formula of for processing. 
#' @param data.name a character string providing the name of the input object. 
#' @param datasources a list of DSConnection-class objects obtained after login. 
#' @author Stuart Wheater, DataSHIELD Development Team
#' @export
#' @import DSI
#'

ds.adonis <- function(formula, data.name, datasources=NULL)
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

    cally             <- call("adonisDS", formula.transmit, data.name.transmit)
    adonis.raw.result <- DSI::datashield.aggregate(datasources, cally)

    adonis.result <- adonis.raw.result

    return(adonis.result)
}
#ds.adonis
