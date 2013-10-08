from grafo import * 

inf = float("infinity")

def menorNoMarcado(grafo, marcados, values):
    menor = (None, inf)
    for n in grafo.vertices:
        if n not in marcados:
            v = values[n]
            if v < menor[1]:
                menor = (n, v)
    return menor[0]

def dijkstra(grafo, inicial):
    marcados = []
    values = dict((v, inf) for v in grafo.vertices)
    values[inicial] = 0
    while (len(marcados) < len(grafo.vertices)):
        n = menorNoMarcado(grafo, marcados, values)
        marcados.append(n)
        for vecino in grafo.vecinos(n):
            if (vecino not in marcados):
                p = values[n] + 1 #grafo no pesado
                if p < values[vecino]:
                    values[vecino] = p
    return values

g = Grafo([1, 2, 3, 4], [(1,2), (1, 3), (2, 3), (3, 4)])
g.draw()
print dijkstra(g, 1)
