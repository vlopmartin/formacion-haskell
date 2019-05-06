module Soluciones.Solucion2 where

import Utils.Functions

-- Solución de Sergio y Fran
sumaAreas :: [Forma] -> Double
sumaAreas = sum . map (area)

getInversos :: Int -> [Double]
getInversos n = inversos (take n enteros)


crearCirculo :: Double -> Forma
crearCirculo radio = Circulo (Punto 0 0) radio

obtenerCirculos :: [Double] -> [Forma]
obtenerCirculos = map crearCirculo


obtenerSumaAreas :: Int -> Double
obtenerSumaAreas numEnteros = sumaAreas (obtenerCirculos (getInversos numEnteros))
