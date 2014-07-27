## This pair of functions will get and cache a matrix then calculate the inverse of the matrix.

## The first function will calculate the inverse of a matric using solve() and will cache the matrix as y and the inverse as inv 

matX<-matrix(c(4,3,3,2), nrow=2,ncol=2)

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<-NULL
  }
  get <- function() x
  setinverse <- function(solve) i <<-solve
  getinverse <- function(solve) i
  list(set = set, get = get,
        setinverse = setinverse,
        getinverse= getinverse)
}



## This function is to get inverse of a matrix. If matrix is cached it will solve that matrix.

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}

