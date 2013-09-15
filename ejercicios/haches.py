import turtle

def drawLine(p1, p2):
       turtle.penup()
       turtle.setpos(p1[0], p1[1])
       turtle.pendown()
       turtle.setpos(p2[0], p2[1])
       turtle.penup()

def haches(depth, pos, l):
   if depth > 0:
       x, y = pos
       v1 = (x - l/2, y + l/2)
       v2 = (x - l/2, y - l/2)
       v3 = (x + l/2, y - l/2)
       v4 = (x + l/2, y + l/2)

       drawLine((x - l / 2, y), (x + l / 2, y))
       drawLine(v1, v2)
       drawLine(v3, v4)

       haches(depth - 1, v1, l / 2)
       haches(depth - 1, v2, l / 2)
       haches(depth - 1, v3, l / 2)
       haches(depth - 1, v4, l / 2)

haches(5, (0., 0.), 100)
turtle.exitonclick()
