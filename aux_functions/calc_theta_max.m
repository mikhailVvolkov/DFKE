function np = calc_theta_max(sc,lm,lp,sp,np)
    np.Emax = E_int_max(np,sp,lp,lm,sc);
    np.th1_max = E2th(lm.F,sp.mu,lp.w,np.Emax);
    np.dth1 = E2th(lm.F,sp.mu,lp.w,np.Emax)-E2th(lm.F,sp.mu,lp.w,np.Emax-np.dEint);
end
