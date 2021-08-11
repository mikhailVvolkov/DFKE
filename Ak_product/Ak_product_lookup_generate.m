function [Ak_product,bp]=Ak_product_lookup_generate(TwoD_Bessel_lookup,bp,np)
    ln_th1 = length(bp.th1);
    ln_th2 = length(bp.th2);
    Ak_product=zeros(ln_th1,ln_th2,(2*np.maxl_int+1),(2*np.m_max+1));
    l_ind = bp.l_max+1+[-np.maxl_int:np.maxl_int];
    
    f = waitbar(0,'1','Name','Generating A_k product lookup table');
    dx = 1./([1:ln_th1]');
            for n=-np.m_max:np.m_max
                waitbar((n+np.m_max+1)/(2*np.m_max+1),f,['\xi_{ln}','    n = ',num2str(n)])
                kernel = TwoD_Bessel_lookup(:,:,l_ind).*TwoD_Bessel_lookup(:,:,l_ind-2*n);
                Ak_product(:,:,:,n+np.m_max+1) = 2*dx.*cumtrapz(kernel,1);
            end
    delete(f)
end