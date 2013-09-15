import turtle

def drawLine(p1, p2):
       turtle.penup()
       turtle.setpos(p1[0], p1[1])
       turtle.pendown()
       turtle.setpos(p2[0], p2[1])
       turtle.penup()

def medio(a, b):
    return ((a[0] + b[0])/2, (a[1] + b[1])/2)

def dibujarTrianguloSec(depth, a, b, c):
    if depth > 0:
        ac = medio(a, c)
        ab = medio(a, b)
        bc = medio(b, c)
        drawLine(ac, ab)
        drawLine(ac, bc)
        drawLine(ab, bc)
        dibujarTrianguloSec(depth-1, a,  ab, ac)
        dibujarTrianguloSec(depth-1, ab, b,  bc)
        dibujarTrianguloSec(depth-1, ac, bc, c)
        
def dibujarTrianguloPpal(depth, a, b, c):
    drawLine(a, b)
    drawLine(a, c)
    drawLine(b, c)
    dibujarTrianguloSec(depth, a, b, c)

dibujarTrianguloPpal(4, (-300, 0), (300, 0), (0, 300))

turtle.exitonclick()
