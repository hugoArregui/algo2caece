class Grafo(object):
    def __init__(self, vertices, arcos):
        self.vertices = vertices
        self.arcos = arcos

    def vecinos(self, nodo):
        vecinos = []
        for arco in self.arcos:
            if arco[0] == nodo:
                vecinos.append(arco[1])
        return vecinos

    def draw(self):
        import pygraphviz as pgv
        from subprocess import call

        G = pgv.AGraph()
        G.add_nodes_from(self.vertices)
        G.layout()
        for arco in self.arcos:
            G.add_edge(arco[0], arco[1])
        G.draw('file.png')
        call("firefox file.png", shell=True)

