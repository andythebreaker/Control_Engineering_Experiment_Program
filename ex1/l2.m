%2
s = tf('s');
%num=[20];
%den=[2 2 5];
%sys1=tf(num,den); 
%num=[20];
%den=[2 2 5];
%sys1=tf(num,den); 
sys1 = 1/(s+1);
sys2 = (s-20)/(s-2)^2/(s-5);
sysp = parallel(sys1,sys2);
syss = series(sys1,sys2);
sysf = feedback(sys1,1,-1);
[a,b] = tfdata(sysf);
[num_all,dem_all] = tfdata(sysf,'v');
[z,p,k] = zpkdata(sysf,'v');
disp("==================")
get(sys1)
disp("==================")
get(sys2)
disp("==================")
get(sysp)
disp("==================")
get(syss)
disp("==================")
get(sysf)