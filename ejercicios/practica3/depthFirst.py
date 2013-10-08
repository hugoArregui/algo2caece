from grafo import *

def depthFirst2(grafo, inicial, procesados):
    arcos = []
    for v in grafo.vecinos(inicial):
        if v not in procesados:
            procesados.append(v)
            arcos.append((inicial, v))
            r = depthFirst2(grafo, v, procesados)
            arcos += r
    return arcos

def depthFirst(grafo, inicial):
    return depthFirst2(grafo, inicial, [])

g = Grafo([1, 2, 3, 4], [(1,2), (1, 3), (2, 3), (3, 4)])
#g.draw()
print depthFirst(g, 1)


