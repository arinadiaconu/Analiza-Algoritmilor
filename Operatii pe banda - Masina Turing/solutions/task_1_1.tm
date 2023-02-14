10X@.

start   1   L   middle(accept)

middle(Y)  *   P@,R    right(Y)

right(Y)    X   L   verify(Y)
            #   L   verify(Y)
            *   R   right(Y)

verify(Y)   @   PX,R    print(Y)
            0   PX,L    left(0,Y)
            1   PX,L    left(1,Y)

print(Y)    #   L   write(Y)
            X   R   print(Y)

write(Y)    *   P#,H    Y

left(c,Y)   #   Pc,R  right(Y)
            *   L     left(c,Y)
