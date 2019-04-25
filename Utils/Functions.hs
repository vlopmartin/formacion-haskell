module Utils.Functions where

-- Tipos de dato básicos
-- Los tipos son estáticos: todas las funciones tienen un tipo
booleano :: Bool
booleano = True

entero :: Int
entero = 5

caracter :: Char
caracter = 'F'

real :: Double
real = 27.8

funcion :: Char -> Bool
funcion c = c == 'F'

-- Inferencia de tipos
-- A veces no es necesario escribir el tipo de una función, ya que el compilador
-- puede deducirlo, pero sigue siendo estático
-- Buenas prácticas: escribir siempre los tipos
funcion2 c = c /= 'F'

-- Constructores de tipo
-- Algunos tipos, como [a], requieren una variable de tipo. El equivalente en OOP son
-- los tipos genéricos
lista :: [Int]
lista = [1, 2, 3, 4, 5]

string1 :: [Char]
string1 = "Lista de caracteres"

string2 :: String
string2 = "Lista de caracteres"

-- Declarando un tipo de dato
-- Al crear un tipo se crea también un constructor de datos, que no es más que una función
data Punto = Punto Double Double deriving (Eq, Show)
-- Para trabajar con tipos de dato se suele usar matcheo de patrones
getX :: Punto -> Double
getX (Punto x y) = x
-- Buenas prácticas: usar _ para los valores no usados
getY :: Punto -> Double
getY (Punto _ y) = y

-- Tipos de dato algebraicos
-- Se puede crear un tipo con varios constructores, para polimorfismo
data Forma = Rectangulo Punto Punto | Circulo Punto Double deriving (Eq, Show)

area :: Forma -> Double
area (Rectangulo (Punto x y) (Punto x' y')) = (x' - x) * (y' - y)

masGrande :: Forma -> Forma -> Forma
masGrande f f'
  | area f >= area f'   = f
  | otherwise           = f'

-- Typeclasses
-- Polimorfismo más general: las typeclasses corresponden a las interfaces de OOP
instance Ord Forma where
  f <= f' = (area f) <= (area f')

-- Funciones con variables de tipo
-- Las typeclasses nos permiten escribir funciones más generales
masPequeña :: Forma -> Forma -> Forma
masPequeña = min

-- Herramientas para trabajar con listas
ejemplo1 :: [Int] -> [Int]
ejemplo1 = replicate 3 . head . filter (>3)

ejemplo2 :: [Int] -> [Int]
ejemplo2 = reverse . tail . map (*2)

ejemplo3 :: [Int] -> [Int]
ejemplo3 = foldr (:) [0]

ejemplo4 :: [Int] -> Int
ejemplo4 = length . filter (==2) . take 10 . cycle . init
-- Ver https://hackage.haskell.org/package/base-4.12.0.0/docs/Prelude.html#g:13

-- Ejercicio
-- Sumar las áreas de los círculos cuyos radios son los inversos de los 10 primeros enteros
enteros :: [Double]
enteros = [1..]

inversos :: Fractional a => [a] -> [a]
inversos = map recip
