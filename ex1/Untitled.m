subplot(2,2,1)
s = tf('s');
a = 0;
T1 = (a*s+1)/(s^2+4*s+5);
t = 0:0.1:10;
[y,t] = step(T1,t);
plot(t,y);

a = 1;
hold;
T2 = (a*s+1)/(s^2+4*s+5);
[y,t] = step(T2,t);
plot(t,y);

a = 2;
T3 = (a*s+1)/(s^2+4*s+5);
[y,t] = step(T3,t);
plot(t,y);

T4 = (s+25)/(((s+2)^2)*(s^2+5*s+6));
[y,t] = step(T4,t);
plot(t,y);

T5 = 3*exp(-0.5*s)/(s+5);
[y,t] = step(T5,t);
plot(t,y);
legend('a=0','a=1','a=2','(2)','(3)');
title('1-1 ');
%%%%%%%%%%%%%%%%%%%%%%%
sys1 = 1/(s+1);
sys2 = (s-20)/(s-2)^2/(s-5);
sysp = parallel(sys1,sys2);
syss = series(sys1,sys2);
sysf = feedback(sys1,1,-1);
[a,b] = tfdata(sysf);
[num_all,dem_all] = tfdata(sysf,'v');
[z,p,k] = zpkdata(sysf,'v');
get(sysp)
get(syss);
get(sysf);

%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,2)
hold on
grid on
[y,t] = step(sys1,t);
plot(t,y);
[y,t] = impulse(sys1,t);
plot(t,y);
legend('step','impulse');
title('1-3 ');
xlabel('time (s)');
ylabel('Amp');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = 0:0.1:30;
sys5 = 1/(s^2-2*s+1);
sys6 = 12*(s-1)^2/(s+3)/(s+1)^2/(s+2);
sysss = feedback(series(sys5,sys6),1,-1);
sysff = feedback(sys5,sys6,-1);
[u,t] = step(sysff,t);
subplot(2,2,3)
plot(t,u);
[y,t] = step(sysss,t);
subplot(2,2,4)
plot(t,y);





