10&@.

start   *   R   second(accept)

second(Y)   *   R   third(Y)

third(Y)    *   R   fourth(Y)

fourth(Y)   *   R   verify(Y)

verify(Y)   #   P&,L    left(Y)
            @   R       start
            *   L       sets(Y)

sets(Y)     0   P@,L    copy(0,Y)
            1   P@,L    copy(1,Y)
            
copy(c,Y)   0   Pc,L    copy(0,Y)
            1   Pc,L    copy(1,Y)
            @   Pc,L    copy(@,Y)
            #   Pc,R    right(Y)

right(Y)    @   R       start
            #   P&,L    left(Y)
            *   R       right(Y)

left(Y) #   R   shift(Y)
        *   L   left(Y)

shift(Y)    0   P0,R    copy_right(0,Y)
            1   P0,R    copy_right(1,Y)

copy_right(c,Y) 0       Pc,R    copy_right(0,Y)
                1       Pc,R    copy_right(1,Y)
                @       R       copy_right(c,Y)
                &       R       copy_right(c,Y)
                #       Pc,L    left1(Y)

left1(Y)    #   R   check(Y)
            *   L   left1(Y)

check(Y)    0   R   check_zeros(Y)
            1   R   right1(Y)

check_zeros(Y)  0   R           check_zeros(Y)
                &   L           delete_zeros(Y)
                @   P#,L        delete_zeros(Y)
                1   R           next_set(Y)

delete_zeros(Y) #   R           find(Y)
                *   P#,L        delete_zeros(Y)

find(Y) #       R       find(Y)
        &       P#,R    Y
        *       H       check(Y)

right1(Y)   @   L   substract3(Y)
            &   L   substract3(Y)
            *   R   right1(Y)

substract3(Y)   0   P1,L    second1(Y)
                1   P0,L    second0(Y)

second1(Y)  0   P0,L    search(Y)
            1   P1,L    search(Y)

second0(Y)  0   P1,L    search(Y)
            1   P0,L    next_set(Y)

next_set(Y)    @   R   check1(Y)
                &   L   left(Y)
                *   R   next_set(Y)

check1(Y)       0   R   next_set(Y)
                1   R   right1(Y)

search(Y)   0   P1,L    search(Y)
            1   P0,L    next_set(Y)
