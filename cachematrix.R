makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # This will store the inverse
  set <- function(y) {
    x <<- y   # Store the matrix in an environment outside the function
    inv <<- NULL  # Reset cached inverse when matrix is updated
  }
  get <- function() x  # Returns the matrix
  setInverse <- function(inverse) inv <<- inverse  # Stores the inverse
  getInverse <- function() inv  # Returns the inverse if it's cached
  
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)  # Returns a list of these functions
}

A <- matrix(c(2, 1, 1, 4), nrow = 2, ncol = 2)cacheSolve <- function(x, ...) {
  inv <- x$getInverse()  # Try to get cached inverse
  
  if (!is.null(inv)) {  # If it's already computed, return it
    message("getting cached data")
    return(inv)
  }
