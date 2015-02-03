#' @export
read.csvv <- function(...){
  res <- read.csv(...)
  yeah::yeah()
  return(res)
}

#' @export
unlib <- function(pkgname){
  if(!is.character(pkgname)){
    pkgname <- as.character(substitute(pkgname))    
  }
  trg <- paste0("package:", pkgname)
  pos <- match(trg, search())
  detach(pos=pos, unload=TRUE)
}

#' @export

breathofgod <- function(){
  sock <- socketConnection("rstudio.com", 6789, blocking = FALSE, open = "r")
  hadleys <- c("ggplot2", "dplyr", "plyr", "tidyr", "devtools", "reshape2", "stringr",
               "bigrquery", "assertthat", "testthat", "httr", "lazyeval",
               "memoise", "magrittr", "nycflights13", "profr", "pryr",
               "RMySQL", "roxygen2","rvest")
  while(TRUE){
    newLines <- readLines(sock)
    prototype <- data.frame(date = character(), time = character(),
                            size = numeric(), r_version = character(), r_arch = character(),
                            r_os = character(), package = character(), version = character(),
                            country = character(), ip_id = character())
    newData <- read.csv(textConnection(newLines), header=FALSE, stringsAsFactors=FALSE,
                        col.names = names(prototype)
    )
    if(any(newData$package %in% hadleys)){
      print(newData$package[newData$package %in% hadleys])
      beepr::beep()
    }
    Sys.sleep(1)
  }  
}
