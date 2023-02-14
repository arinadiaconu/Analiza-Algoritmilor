10&@X.

start   1   R   right(accept)

right(Y)    #   P&,L    left(Y)
            *   R       right(Y)

left(Y)     #   R   verify(Y)
            X   R   verify(Y)
            *   L   left(Y)

verify(Y)   1   PX,R    right1(1,Y)
            0   PX,R    right1(0,Y)
            &   L       count1(Y)

right1(c,Y) #   Pc,L   left(Y)
            *   R   right1(c,Y)

count1(Y)   *  PX,L    count2(Y)

count2(Y)   *  PX,L    count3(Y)

count3(Y)   *  PX,L    count4(Y)

count4(Y)   *  PX,L    print@(Y)

print@(Y)   #   R       zeros(Y)
            X   P@,L    left1(Y)

left1(Y)    #   PX,R    right2(Y)
            *   L       left1(Y)

right2(Y)   @   L   count1(Y)
            *   R   right2(Y)

zeros(Y)    &   R       right3(Y)
            X   P0,R    zeros(Y)
            *   R       zeros(Y)

right3(Y)   #   L   verify_bits_left(Y)
            *   R   right3(Y)

verify_bits_left(Y) &   P#,L    delete@(Y)
                    1   P#,L    shift(1,Y)
                    0   P#,L    shift(0,Y)

shift(c,Y)  1   Pc,L    shift(1,Y)
            0   Pc,L    shift(0,Y)
            #   R       check_final(Y)
            &   L       shift(c,Y)
            @   L       shift(c,Y)

check_final(Y)  #   L   verify_final(Y)
                *   R   check_final(Y)

verify_final(Y) &   P#,L    delete@(Y)
                *   L       left2(Y)

left2(Y)    #   R   check1(Y)
            *   L   left2(Y)

check1(Y)   1   L   more_zeros(Y)
            0   R   check2(Y)

check2(Y)   0   R   next_set(Y)
            1   R   check3(Y)

check3(Y)   1   R   add3(Y)
            0   R   check4(Y)

check4(Y)   0   R   next_set(Y)
            1   R   add3(Y)

next_set(Y) &   R   right3(Y)
            @   R   check1(Y)
            *   R   next_set(Y)

more_zeros(Y)   #   P@,L    print_next_4z(Y)
                *   R       add3(Y)

print_next_4z(Y)    *   P0,L    print0(Y)

add3(Y)     @   L   first_bit(Y)
            &   L   first_bit(Y)
            *   R   add3(Y)

first_bit(Y)    0   P1,L    second0(Y)
                1   P0,L    second1(Y)

second0(Y)  0   P1,L    next_set(Y)
            1   P0,L    write1(Y)

second1(Y)  0   P0,L    write1(Y)
            1   P1,L    write1(Y)

write1(Y)   #   P@,L    print1(Y)
            0   P1      next_set(Y)
            1   P0,L    write1(Y)
            @   L       write1(Y)

print1(Y)   *   P1,L    print0(Y)

print0(Y)   *   P0,L    print00(Y)

print00(Y)  *   P0,L    print000(Y)

print000(Y) *   P0      next_set(Y)

delete@(Y)  #   R   Y
            @   R   right4(Y)
            *   L   delete@(Y)

right4(Y)   #   L   copy(#,Y)
            *   R   right4(Y)

copy(c,Y)   0   Pc,L    copy(0,Y)
            1   Pc,L    copy(1,Y)
            @   Pc,L    delete@(Y)
