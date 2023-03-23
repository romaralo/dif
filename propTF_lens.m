% Usamos el propagador de función de transferencia de Fresnel. Intento meterlo con lentes.

function u2=propTF_lens(u1,L,lambda,z,rad,f,X1,Y1); 
% propagation - transfer function approach 
% assumes same x and y side lengths and 
% uniform sampling 
% u1 - source plane field 
% L - source and observation plane side length 
% lambda - wavelength 
% z - propagation distance 
% u2 - observation plane field 

[M,N]=size(u1); %get input field array size 
dx=L/M; %sample interval 
k=2*pi/lambda; %wavenumber 
c=circ(rad,X1,Y1,M)
T=exp((-j*k*(X1.^2+Y1.^2))/(2*f))

fx=-1/(2*dx):1/L:1/(2*dx)-1/L; %freq coords 
[FX,FY]=meshgrid(fx,fx); 
I1=abs(u1.^2)
I1=double(I1)

H=exp(-j*pi*lambda*z*(FX.^2+FY.^2)); %transfer func 
%kz=sqrt(k^2-(2*pi*FX).^2-(2*pi*FY).^2)
%H1=exp(1i*z*kz)
H=fftshift(H); %shift trans func 
U1=fft2(fftshift(I1.*T)); %shift, fft src field 
U2=H.*U1; %multiply 
u2=ifftshift(ifft2(U2)); %inv fft, center obs field 
end
