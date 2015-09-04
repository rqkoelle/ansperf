#' Information on session
#'
#' session_log() provides a shortcut to relevant session info
#' it is a generic function
#'
#' @param NULL, session_log requires no parameters
#' @return NULL, session_log returns no values
#'
#' @examples
#' session_log()
#'

session_log <- function(){
  print(paste("This document was produced on", date(),".", sep=" "))
  print(sessionInfo())
}
