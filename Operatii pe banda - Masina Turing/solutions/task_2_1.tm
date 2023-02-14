10X@.

start   1   R   right(@,accept)
        0   R   right(@,accept)

right(c,Y)  #   Pc,L    left(Y)
            *   R       right(c,Y)

left(Y)     #   R   verify(Y)
            X   R   verify(Y)
            *   L   left(Y)

verify(Y)   0   PX,R    right(0,Y)
            1   PX,R    right(1,Y)
            @   PX,L    total_left(Y)

total_left(Y)   #   R   print#(Y)
                *   L   total_left(Y)

print#(Y)   *   P#,R    Y
