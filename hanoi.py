head = lambda x: x[len(x) - 1]
is_even = lambda x: x % 2 == 0


def mover(s, d, sc, dc):
    print 'Mover %s de col. %s a col. %s' % (head(s), sc, dc)
    d.append(s.pop())
    

def hanoi_(orig, aux, dest, c, n):
    if c == 1 and orig:
        if is_even(len(orig)):
            if aux and head(aux) < head(orig):
                hanoi_(orig, aux, dest, 2, n)
            if orig:
                mover(orig, aux, 1, 2)
        else:
            if dest and head(dest) < head(orig):
                hanoi_(orig, aux, dest, 3, n)
            if orig:
                mover(orig, dest, 1, 3)
        hanoi_(orig, aux, dest, 1, n)
    elif c == 2 and aux:
        if is_even(len(aux)):
            if orig and head(orig) < head(aux):
                hanoi_(orig, aux, dest, 1, n)
            if aux:
                mover(aux, orig, 2, 1)
        else:
            if dest and head(dest) < head(aux):
                hanoi_(orig, aux, dest, 3, n)
            if aux:
                mover(aux, dest, 2, 3)
        hanoi_(orig, aux, dest, 2, n)
    elif c == 3 and dest:
        if head(dest) != (n - len(dest) + 1):
            if is_even(len(dest)):
                if orig and head(orig) < head(dest):
                    hanoi_(orig, aux, dest, 1, n)
                if dest and len(dest) < n:
                    mover(dest, orig, 3, 1)
            else:
                if aux and head(aux) < head(dest):
                    hanoi_(orig, aux, dest, 2, n)
                if dest and len(dest) < n:
                    mover(dest, aux, 3, 2)
            if dest:
                hanoi_(orig, aux, dest, 3, n)
    if aux:
        hanoi_(orig, aux, dest, 2, n)
    if orig:
        hanoi_(orig, aux, dest, 1, n)
        
        
def hanoi(n):
    import pdb; pdb.set_trace()
    orig, aux, dest = [n-i for i in range(n)], [], []
    hanoi_(orig, aux, dest, 1, n)
    # hanoi_(orig, aux, dest, n, 1)
    
if __name__=="__main__":
    hanoi(6)