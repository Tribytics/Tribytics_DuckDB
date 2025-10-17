pacman::p_load(
    duckdb,
    DBI,
    dplyr,
    glue
)

#source(here::here("R/functions.R"))
source("md_connect.R")

conn <- md_connect() 

#rs <- dbExecute(conn, "ATTACH 'md:'")

enc_sample <- tbl(conn, I("my_db.ccdm.encounters_sample"))

ages <- enc_sample |> 
    pull(anchor_age)

dbDisconnect(conn)

