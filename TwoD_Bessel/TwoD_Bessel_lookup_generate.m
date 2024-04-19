function TwoD_Bessel_lookup = TwoD_Bessel_lookup_generate(np)
    TwoD_Bessel_lookup=zeros(length(np.th1),length(np.th2),(2*np.l_max+1));
    f = waitbar(0,'1','Name','Generating 2D Bessel lookup table');
    for ij = -np.l_max:np.l_max
        waitbar((np.l_max+ij)/(2*np.l_max+1),f,['J_l(\theta_1,\theta_2) ','    l = ',num2str(ij)])
        TwoD_Bessel_lookup(:,:,np.l_max+ij+1)=TwoD_Bessel(np.th1,np.th2,ij,np.maxBessel,np.approx);
    end
    delete(f)  
end