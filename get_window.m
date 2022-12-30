function w = get_window(N,type)
% inputs
% N: length of window
% Type= 'Rectangular' , 'triangular' , 'hamming' , 'blackman'
switch lower(type)
    case 'rectangular'
        w=ones(1,N);
    case 'triangular'
        w=triang(N);
    case 'hamming'
        w=hamming(N);
    case 'blackman'
        w=blackman(N);
end



% if N==1
%     w=1;
%     return;
% end
% 
% M=N-1;
% w=zeros(1,M+1);
% i=0:M;
% 
% switch lower(type)
%     case 'rectangular'
%         w=ones(1,N);
%     case 'triangular'
%         if N==2 %% To avoid dividing by zero due to floor( (N-1)/2) )
%             w=[0 0];
%         else
% 
%         % Generate 1st half
%         w(1 : floor(M/2)+1)=0:floor(M/2); 
%         % Reverse 1st half to create 2nd one (mirroring)
%         w(ceil(M/2)+1 : M+1)=w(floor(M/2)+1 :-1: 1);
%         % normalize with max value
%         w=w/floor(M/2); 
%         end
%     case 'hamming'
%         w=0.54 - 0.46 * cos(2*pi*i/M);
%     case 'blackman'
%         w = 0.42 - 0.5 * cos(2*pi*i/M) + 0.08 * cos(4*pi*i/M);
% end

end