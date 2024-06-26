function JDOS = JDOS_DFK(lp,sp,sc,np,Cm,Sm,selected)
    T = sc.delay.'; 

    switch np.approx.type
        case 'Adiabatic'
            lm = laser_matter(lp,sp);
            F_ac=abs(lm.F.*sin(lp.w*T));
            JDOS = FK_JDOS(sc.XUV,sp.BG,sp.mu,F_ac);
        otherwise
            m_lkp_max = (length(Cm(:,1))-1)/2;
            JDOS = zeros(length(T),length(sc.XUV));
            for m=-np.m_max:np.m_max
                prefactor = JDOS_const(sp.mu)*(1/2/pi)*(1./(sc.XUV/cnst.h_bar + 2*m*lp.w)).*sc.XUV/cnst.h_bar;
                JDOS = JDOS + selected.m(m+m_lkp_max+1)*prefactor.*(selected.cos*cos(2*m*lp.w*T)*Cm(m+m_lkp_max+1,:)+selected.sin*sin(2*m*lp.w*T)*Sm(m+m_lkp_max+1,:));
            end
    end

end