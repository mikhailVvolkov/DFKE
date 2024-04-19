function Ak = Ak_small_Up(l,m,th1,th2)
    %th2 = 0;
    Ak_first_order =  besselj_small_argument(l,th1).*besselj_small_argument(l-2*m,th1) +...
        +  0.5*th2*besselj_small_argument(l,th1).*(besselj_small_argument(l-2-2*m,th1) - besselj_small_argument(l+2-2*m,th1))+...
        + 0.5*th2*besselj_small_argument(l-2*m,th1).*(besselj_small_argument(l-2,th1) - besselj_small_argument(l+2,th1));

    
%     Ak_first_order =  besselj(l,th1).*besselj(l-2*m,th1) +...
%         +  0.5*th2*besselj(l,th1).*(besselj(l-2-2*m,th1) - besselj(l+2-2*m,th1))+...
%         + 0.5*th2*besselj(l-2*m,th1).*(besselj(l-2,th1) - besselj(l+2,th1));
    Ak_second_order = 0.25*th2^2*(besselj(l-2,th1) - besselj(l+2,th1)).*(besselj(l-2-2*m,th1) - besselj(l+2-2*m,th1));
    kernel = Ak_first_order + 0*Ak_second_order;
    ln_th1 = length(th1);
    dx = 1./([1:ln_th1]);
    %Ak = 2*dx.*kernel*length(kernel);
    Ak = 2*dx.*cumtrapz(kernel);
end

