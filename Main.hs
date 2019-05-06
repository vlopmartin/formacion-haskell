import Utils.Functions
import Soluciones.Solucion1 as Solucion1
import Soluciones.Solucion2 as Solucion2

main :: IO ()
main = putStrLn "Solución de Luis, Guillermo y Ana" >> print (Solucion1.problemón 100) >> putStrLn "Solución de Sergio y Fran" >> print (Solucion2.obtenerSumaAreas 100)
