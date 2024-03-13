# Set working directory
setwd('C:/Users/tanishq/Documents/Coursera-R')

# Define a function to create a cache matrix
makeCacheMatrix <- function(x = matrix(sample(1:100, 9), 3, 3)) {
  s <- NULL
  
  # Set the matrix value
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  
  # Get the matrix value
  get <- function() x
  
  # Set the solved value
  setsolve <- function(solve) s <<- solve
  
  # Get the solved value
  getsolve <- function() s
  
  # Return list of functions
  list(set = set, 
       get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

# Define a function to cache solving of matrix
cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if (!is.null(s)) {
    message("getting inversed matrix")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
