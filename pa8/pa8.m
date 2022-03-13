clearvars
clearvars -GLOBAL

Is = 0.01e-12;
Ib = 0.1e-12;
Vb = 1.3;
Gp = 0.1;

V = linspace(-1.95,0.7,200);
I = Is * (exp((1.2/0.025).*V) - 1) + Gp.*V - Ib * (exp((-1.2/0.025).*(V + Vb)) - 1) ;
for i = 1:200
    physbehv(i) = V(i)-0.2*V(i) + ((V(i)+0.2*V(i)) - (V(i)-0.2*V(i)))*rand;
end    
subplot(3,2,1)
plot (V,physbehv,'r');
title(' Voltage vs Current - linear');
hold on
plot (V, I,'b');
legend('I noise', 'I');
xlabel('V');
ylabel('I');

subplot(3,2,2)
semilogy(V,abs(physbehv),'g');
title('Voltage vs Current semilog');
hold on
semilogy(V, abs(I),'b');
legend('I noise', 'I');
xlabel('V');
ylabel('I');

%Created a 4th order and 8th order polynomial fit 
pI4 = polyfit(V,I,4);
pI8 = polyfit(V,I,8);
ply4 = polyfit(V,abs(physbehv),4);
ply8 = polyfit(V,abs(physbehv),8);

subplot(3,2,3)
plot(V,I,'b');
title('Fit4 and Fit8 plots');
hold on
plot(V,polyval(pI4,V),'-g');
hold on
plot(V,polyval(pI8,V),'.r');
legend('I','fit4','fit8');
xlabel('V');
ylabel('I');

subplot(3,2,4)
semilogy(V,I,'b');
title('The Fit4 and Fit8 plots semilog');
hold on
semilogy(V,polyval(pI4,V),'-g');
hold on
semilogy(V,polyval(pI8,V),'.r');
legend('I','fit4','fit8');
xlabel('V');
ylabel('I');

subplot(3,2,5)
semilogy(V,abs(physbehv),'b');
title('The Fit4 and Fit8 plots semilog');
hold on
semilogy(V,polyval(ply4,V),'-y');
hold on
semilogy(V,polyval(ply8,V),'.b');
legend('I','fit4','fit8');
xlabel('V');
ylabel('I');

