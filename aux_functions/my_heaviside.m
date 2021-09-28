function y = my_heaviside(x)
    y = x;
    y(x>0) = 1;
    y(x<0) = 0;
    y(x==0) = 0.5;
    
    if any(imag(x)~=0)
        disp('Warning: heaviside argument has imagimanry component');
    end
end