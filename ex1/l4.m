f=figure;
s=tf('s');
t=0:0.1:30;
sys1=1/(s^2-2*s+1);
sys2=(12*(s-1)^2)/((s+3)*((s+1)^2)*(s+2));
sysy=feedback(series(sys1,sys2),1,-1);
sysu=feedback(sys1,sys2,-1);
[y,t]=step(sysy,t);
[u,t]=step(sysu,t);
grid on;
hp1=subplot(2,1,1);
plot(t,y);
legend('y');
title('y');
hp2=subplot(2,1,2);
plot(t,u);
legend('u');
title('u');
ax = findobj(f,'Type','Axes');
for i=1:length(ax)
    ylabel(ax(i),{'Amp'})
    xlabel(ax(i),{'t(s)'})
end