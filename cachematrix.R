## In the following functions, we can create a matrix, calculate and cache the inverse of this matrix

## the following function will create a matrix and calculate its inverse. 

makeCacheMatrix <- function(x = matrix()) {
  I=NULL
  set=function(y){
    x<<-y
    I<<-NULL
  }
  get=function()x
  setinverse=function(solve)I<<-solve
  getinverse=function()I
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}

## the following function calculates the inverse of the matrix created by the above
## function. However, it first checks to see if the mean has already been 
## calculated. If so,it gets the inverse from the cache and skips the computation.
## If not, it calculate the inverse of the matrix and sets it in the cache.

cacheSolve <- function(x, ...) {
  I=x$getinverse()
  if (!is.null(I)){
    message("getting cached inverse of the matrix")
    return I
  }
  data=x$get()
  I=solve(data,...)
  x$setinverse(I)## Return a matrix that is the inverse of 'x'
  I
}
