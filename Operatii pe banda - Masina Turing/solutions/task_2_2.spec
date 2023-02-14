0 1 #
start
accept
start # q0 # R
start 0 q0 0 R
start 1 q0 1 R
q0 # q1 # L
q0 0 q0 0 R
q0 1 q0 1 R
q1 0 q2 1 L
q1 1 q3 0 L
q1 # q1 # H
q2 0 q4 0 L
q2 1 q4 1 L
q2 # q2 # H
q4 0 q4 1 L
q4 1 q5 0 L
q4 # q4 # H
q5 # q6 # R
q5 0 q5 0 L
q5 1 q5 1 L
q6 0 q6 # R
q6 1 accept 1 H
q6 # q6 # H
q3 0 q4 1 L
q3 1 q5 0 L
q3 # q3 # H
