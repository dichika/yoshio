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