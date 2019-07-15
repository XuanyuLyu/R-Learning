## Its a function to cache the inversed matrix rather than computing it every time we need

## make, get the matrix and the inversed matrix

makeCacheMatrix <- function( m = matrix() ) {
  
  x <- NULL
  set <- function( matrix ) {
    m <<- matrix
    x <<- NULL
  }
  
  get <- function() {
    m
  }
  
  setInverse <- function(inverse) {
    x<<- inverse
  }
  
  getInverse <- function() {
    x
  }
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## cache the inversed matrix
cacheSolve <- function(y, ...) {
  
  m <- y$getInverse()
  
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  else{
    data <- y$get()
    y$setInverse(m)
    m
  }
}