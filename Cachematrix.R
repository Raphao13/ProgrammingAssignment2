
R version 3.6.3 (2020-02-29) -- "Holding the Windsock"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R é um software livre e vem sem GARANTIA ALGUMA.
Você pode redistribuí-lo sob certas circunstâncias.
Digite 'license()' ou 'licence()' para detalhes de distribuição.

R é um projeto colaborativo com muitos contribuidores.
Digite 'contributors()' para obter mais informações e
'citation()' para saber como citar o R ou pacotes do R em publicações.

Digite 'demo()' para demonstrações, 'help()' para o sistema on-line de ajuda,
ou 'help.start()' para abrir o sistema de ajuda em HTML no seu navegador.
Digite 'q()' para sair do R.

[Área de trabalho anterior carregada]

> ## A pair of functions that cache the inverse of a matrix.
> ## This function creates a special "matrix" object that can cache its inverse.
> 
> makeCacheMatrix <- function(x = matrix()) {
+   inv <- NULL
+   set <- function(y){
+     x <<- y
+     inv <<- NULL
+   }
+   get <- function() x
+   setInverse <- function(solveMatrix) inv <<- solveMatrix
+   getInverse <- function() inv
+   list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
+ }
> makeCacheMatrix()
$set
function(y){
    x <<- y
    inv <<- NULL
  }
<environment: 0x0000000011c807c0>

$get
function() x
<environment: 0x0000000011c807c0>

$setInverse
function(solveMatrix) inv <<- solveMatrix
<environment: 0x0000000011c807c0>

$getInverse
function() inv
<environment: 0x0000000011c807c0>

> ## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
> cacheSolve <- function(x, ...) {
+   ## Return a matrix that is the inverse of 'x'
+   inv <- x$getInverse()
+   if(!is.null(inv)){
+     message("getting cached data")
+     return(inv)
+   }
+   data <- x$get()
+   inv <- solve(data)
+   x$setInverse(inv)
+   inv      
+ }
> 
