function bessel = besselj_small_argument(n,x,order)
    approx = @(n,x,k)(sign(n)^n)*((-1)^k)*(1/factorial(abs(n)+k))*(1/factorial(k))*(x/2).^(2*k).*(x/2).^(abs(n));   
    bessel = zeros(1,length(x));
    for i=0:order
        bessel = bessel + approx(n,x,i);
    end
end
