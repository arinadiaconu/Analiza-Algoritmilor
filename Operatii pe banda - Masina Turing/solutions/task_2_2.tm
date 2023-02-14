10.

start   *   R   right(accept)

right(Y)    #   L   first(Y)
            *   R   right(Y)

first(Y)    0   P1,L    second1(Y)
            1   P0,L    second0(Y)

second1(Y)  0   P0,L    search(Y)
            1   P1,L    search(Y)

second0(Y)  0   P1,L    search(Y)
            1   P0,L    left(Y)

search(Y)   0   P1,L    search(Y)
            1   P0,L    left(Y)

left(Y)     #   R   delete_zeros(Y)
            *   L   left(Y)

delete_zeros(Y) 0   P#,R    delete_zeros(Y)
                1   H       Y
