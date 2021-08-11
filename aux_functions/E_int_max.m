function Emax = E_int_max(np,sp,lp,lm,sc)
    % Note that this function is different from the Cm resonant term!
    E1 = abs(-2*(2*np.m_max*cnst.h_bar*lp.w+(sp.BG+lm.U_pond+np.maxl_int*cnst.h_bar*lp.w)) - np.Emax_int);
    E2 = abs(-2*(max(sc.XUV)+2*np.m_max*cnst.h_bar*lp.w+(sp.BG+lm.U_pond+np.maxl_int*cnst.h_bar*lp.w)) - np.Emax_int);
    Emax1 = max(E1);
    Emax2 = max(E2);
    Emax = max([Emax1 Emax2]);
end