## Return a matrix that is the inverse of 'x'

makeCacheMatrix <- function(x = matrix()) {
        
## This function creates a special "matrix" object that can cache its inverse
    
        m <- NULL
        set <- function(y) {
            x <<- y
            m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)   
}


## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {

## This function returns a matrix that is the inverse of 'x'.
## It computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve retrieves the inverse from the cache
    
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
