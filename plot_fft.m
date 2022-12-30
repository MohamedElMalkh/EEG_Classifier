function plot_fft(signal,Fs,N_FFT)
if nargin==2
    N_FFT=length(signal);
end

X_W = abs( fftshift( fft(signal,N_FFT) ) ) ;
f = (-N_FFT/2 : N_FFT/2 -1 ) / N_FFT*Fs;
% figure Name 'Frequency Domain Representation'
plot(f,X_W )
%title('Frequency Domain Representation')
xlabel('f(Hz)')
ylabel('|X(f)|')

end