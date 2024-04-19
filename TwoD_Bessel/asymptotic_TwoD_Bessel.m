function sum_terms = asymptotic_TwoD_Bessel(epsilon,mu,nu,n)
    sum_terms = zeros(1,length(mu));
    mu = sign(n)*mu;
    nu = sign(n)*nu;
    n = abs(n);
    if ~mod(n,2) % if n is even
        order_k_term = @(mu,nu,n,k) ((mu.^2/2/nu).^k)/(factorial(2*k)*(factorial(n/2 - k)));
        for k=0:(n/2)
            sum_terms = sum_terms + (epsilon*nu/2)^(n/2)*order_k_term(mu,nu,n,k);
        end
    else
        order_k_term = @(mu,nu,n,k) ((mu.^2/2/nu).^(k+1/2))/(factorial(2*k+1)*(factorial((n-1)/2 - k)));
        for k=0:((n-1)/2)
            sum_terms = sum_terms + (epsilon*nu/2)^(n/2)*order_k_term(mu,nu,n,k);
        end
    end
end