#' ansperf time coercion functions
#'
#' ansperf works on date-timestamps for the flight movement data.
#' A set of coercion utility functions allow for convenient data
#' transformation operations.
#'
#' @return the coerced vector or time columns of the data frame.
#'
#' @examples
#' coerce_timestamp(vec=timevector, tz="UTC")
#'
coerce_timestamp <- function(vec, tz="UTC"){
  pattern <- c("dmy_hm","dmy_hms","ymd_hms")
  vec <- lubridate::parse_date_time(vec, orders=pattern, tz=tz)
  return(vec)
}

coerce_timestamps <- function(df){
  df <- df %>%
    mutate_each( funs(coerce_timestamp(.))
                 ,contains("_UTC")
                 ,contains("_LT")
    )
  return(df)
}

recoerce_timestamps2 <- function(df, tz="UTC"){
  for(i in 1:length(df)){
    df[[i]] <- strftime(df[[i]], format="%d-%m-%Y %H:%M:%S"
                        ,tz = tz)
  }
  return(df)
}

recoerce_timestamp <- function(vec, tz="UTC"){
  vec <- strftime( vec
                   ,format="%d-%m-%Y %H:%M:%S"
                   ,tz = tz)
  return(vec)
}

recoerce_timestamps <- function(df){
  df <- df %>%
    mutate_each( funs(recoerce_timestamp(.))
                 ,contains("_UTC")
                 ,contains("_LT")
    )
  return(df)
}
