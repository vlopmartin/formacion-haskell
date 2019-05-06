module Soluciones.Solucion1 where

import Utils.Functions

-- Solución de Luis, Guillermo y Ana
problemón :: Int -> Double
problemón c = sum (map (area) (map (Circulo (Punto 0 0)) (inversos (take c ([1..])))))
