%LENSES
rad=2.5 %cm
f=z
%u1=I1.*Ta

u2=propTF_lens(u1,L1,lambda,z,rad,f,X1,Y1); %propagation
%u2=propTF(u1,L1,lambda,z); %propagation
x2=x1; %obs coords 
y2=y1; 
%u2=u2*T
%u2=propTF_new(u2,L1,lambda,z)
I2=abs(u2.^2); %obs irrad 

figure(2) %display obs irrad 
imagesc(x2,y2,I2); 
%axis square; axis xy; 
xlabel('x (m)'); ylabel('y (m)'); 
title(['z= ',num2str(z),' m']); 
% 
figure(3) %irradiance profile 
plot(x2,I2(M/2+1,:)); 
xlabel('x (m)'); ylabel('Irradiance'); 
title(['z= ',num2str(z),' m']); 

figure(4) %plot obs field mag 
plot(x2,abs(u2(M/2+1,:))); 
xlabel('x (m)'); ylabel('Magnitude'); 
title(['z= ',num2str(z),' m']); 
 
figure(5) %plot obs field phase 
plot(x2,unwrap(angle(u2(M/2+1,:)))); 
xlabel('x (m)'); ylabel('Phase (rad)'); 
title(['z= ',num2str(z),' m']);
