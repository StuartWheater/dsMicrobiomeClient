init.studies.dataset.hackathon <- function(variables)
{
    if (ds.test_env$secure_login_details)
    {
        if (ds.test_env$driver == "OpalDriver")
        {
            builder <- DSI::newDSLoginBuilder(.silent = TRUE)
            builder$append(server = "study1", url = ds.test_env$ip_address_1, user = ds.test_env$user_1, password = ds.test_env$password_1, table = "hackathon.data")
            ds.test_env$login.data <- builder$build()
        }
        else
        {
            ds.test_env$login.data <- DSLite::setupCNSIMTest("dsBase", env = ds.test_env)
        }
        ds.test_env$stats.var <- variables
    }
}

connect.studies.dataset.hackathon <- function(variables)
{
    log.out.data.server()
    source("connection_to_datasets/login_details.R")
    init.studies.dataset.hackathon(variables)
    log.in.data.server()
}

disconnect.studies.dataset.hackathon <- function()
{
    log.out.data.server()
}
