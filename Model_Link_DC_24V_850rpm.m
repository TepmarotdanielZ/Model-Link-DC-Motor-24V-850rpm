K = 3.92;
tau = 0.0128;
ts = 0.02;  %settling time
zeta = 0.8    ; 
w = 4/(zeta*ts);
Kp = (2*zeta*tau*w-1)/K;
Ki = (tau*w^2)/K;



s = tf('s')


P = K/(tau*s+1) % P = plant Model motor
C = Kp+Ki/s % C = controller PID

H = C*P/(1+C*P) % H = Close loop transfer fanction
minreal(H)

step(H)
stepinfo(H)