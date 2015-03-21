## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##  For this assignment, assume that the matrix supplied is always invertible.
##  makeCacheMatrix sets up, inverts, and returns a special matrix object and
##  its internal values:  the matrix and its inversion

## prototype:
## mm<-makeCacheMatrix()  ##sets up, makes null matrix
## mm<-makeCacheMatrix(Matrix)  ##sets up, puts Matrix in mx, sets mi to NULL
## mm$getmx() returns matrix mx
## mm$setmx(Matrix) sets matrix mx to Matrix
## mm$setinv() solves for the inverse of mx, puts it in mi
## mm$getinv() returns mi

makeCacheMatrix <- function(mx = matrix()) {
  ## mi holds the inverse.  It is NULL if no inverse has been stored.
  mi <- NULL
  ## constructor for a new instance
  set <- function(y) {
    mx <<- y
    mi <<- NULL
  }
  ## get returns just the matrix
  get <- function() mx
  ## invoke setinv to set the inverse of the previously stored matrix
  setinv <- function(inv) mi <<- solve(mx)
  ## getinv returns just the matrix inverse
  getinv <- function() mi
  
  ## Use setmx to set, getmx to get, setinv to solve for inverse, 
  ## getinv to return inverse
  list(setmx = set, getmx = get,
       setinv = setinv,
       getinv = getinv)
}

##  cacheSolve solves for the inverse, if necessary, and returns it.

## prototype:
## MatrixInv<-cacheSolve(Matrix)  ## Returns the inverse of Matrix, solving if necessary

cacheSolve <- function(mx = matrix()){
  ## Returns the inverse of mx
  ## if the value is cached, it returns from cache, 
  ## otherwise it solves and returns.
  
  
  ## Check for non-cache condition.  Solve if true, return inv if false.
  if (is.null(mx$getinv())) (mx$setinv()) else (mx$getinv())
  
}
