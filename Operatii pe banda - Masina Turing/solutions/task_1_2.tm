10.

start   1   P#,R    verify1(0,accept)

verify1(c,Y)    #   Pc      Y
                1   P#,R    verify2(0,Y)
                0   P#,R    verify2(0,Y)

verify2(c,Y)    #   Pc      Y
                1   P#,R    write(1,Y)
                0   P#,R    verify3(0,Y)

verify3(c,Y)    #   Pc      Y
                *   P#,R    write(1,Y)

write(c,Y)      #   Pc      Y
                *   P#,R    write(c,Y)
