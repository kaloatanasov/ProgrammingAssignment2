## The following two functions can be used to invert a matrix and cache the value of the
## computation.

## The function below, which creates a matrix, includes in itself setting the value of the matrix,
## getting the value of the matrix, setting the value of the inversion, and getting the value
## of the inversion. The function also caches the matrix inversion.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## The function below inverts the matrix, created with the function above. First, it checks if
## the inversion has been done and stored. If not, it inverts the matrix.

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
