function y=get_part(first_Second,last_Second,Fs,columnsNumber,File)

y( 1:(last_Second-first_Second+1)*Fs , 1:columnsNumber)=File(1+(first_Second-1)*Fs : last_Second*Fs, 1:columnsNumber);
end
