####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por _______________________________________

# Laboratorio - Análisis de redes en R - Algebra matricial

# Objetivo: Explorar las funciones de algebra lineal con un caso hipotético
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz hipotética de datos
# 2. Hacer diversas operaciones matriciales
# 3. Comprender el algoritmo base de las recomendaciones de AMAZON


#######################################
# LABORATORIO: Algebra matricial      #
#######################################


M = as.matrix(
  read.csv("https://raw.githubusercontent.com/PABalland/ON/master/amz.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))
M
dim(M)
# Es la estructura de red que AMAZON ocupa para hacer recomendaciones en base a tus compras actuales

M[1:6, 1]
# Ver sólo el vector de clientes que compran el producto "corbata" (producto de la columna 1)

M[1:6, 1:2]
#Ver sólo un fragmento de la base original, en relación a los dos productos que me interesan
#Puede ser útil para explorar clientes y productos

rowSums (M)
# Computar grado de centralidad

t(M)
# función útil para enfocarnos en productos y no sólo en clientes

M + M
# Suma de matrices

x = M + M
# Crear nuevo un objeto llamado x

M^2
#elevar matriz al cuadrado

M * M
#multiplicación de matrices idénticas

dim(M)
#checar tamaño de la primera matriz -dim-
#solo si el número de columnas de la primera matriz es igual al número de renglones de la segunda matriz

t(M)
#Matriz transpuesta. Esta es la segunda matriz

dim(t(M))
#checar tamaño de la segunda matriz -dim-
#Sí se cumple con la regla de matrices

M %*% t(M)
#multiplicación de matrices después de checar tamaños
#los signos de porcentaje indican que es una multiplicación de matrices con diferente orden
  
t(M) %*% M
#multiplicación inversa con énfasis en los productos
#El algoritmo de recomendación de AMAZON, hace básicamente lo anterior.
# para tener el número de veces que 2 productos han sido comprados por el mismo cliente
#identificar productos que van frecuentemente juntos (co ocurrencias par)

M
#matriz base para visualizar que las co ocurrencias son reales
#solo tres clientes (Piere, David y Paula) empataron en la compra del short y agua

P = t(M) %*% M
#matriz de similaridad de productos (de gustos) matriz de co ocurrencia de productos

P
#para visualizar la matriz de similaridad de productos
# el "error" de la matriz es que son productos idénticos pero no pueden co ocurrir cuatro veces cada producto
#debe tener ceros porque se calcula el nivel de atracción

diag (P) = 0
#no es una matriz identidad (como en la correlación) 

P
#es la misma matriz que la anterior pero la diagonal es cero en el mismo producto
#ahora si es una matriz de co ocurrencias

C = M %*% t(M)
#similaridad de clientes - matriz de co ocurrencia de clientes
#invertimos la multiplicación de matrices

C
#para visualizar la matriz de similaridad de clientes
# el "error" de la matriz es que son clientes idénticos pero no pueden co ocurrir seis veces cada cliente
#debe tener ceros porque se calcula el nivel de atracción

M
#matriz base para visualizar que las co ocurrencias son reales
#Pierre y Ron empataron en una compra

diag (C) = 0
#no es una matriz identidad (como en la correlación) 

C
#es la misma matriz que la anterior pero la diagonal es cero en el mismo cliente
#ahora si es una matriz de co ocurrencias