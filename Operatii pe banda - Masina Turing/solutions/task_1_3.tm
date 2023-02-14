10.

start   *   H   right(accept)

right(Y)    #   L   first(Y)
            *   R   right(Y)

first(Y)    0   P1,L    second0(Y)
            1   P0,L    second1(Y)

second0(Y)  0   P1,L    Y
            1   P0,L    write(Y)

second1(Y)  0   P0,L    write(Y)
            1   P1,L    write(Y)

write(Y)    #   P1      Y
            0   P1      Y
            1   P0,L    write(Y)  
