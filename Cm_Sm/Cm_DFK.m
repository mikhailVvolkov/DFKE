function Cm=Cm_DFK(XUV,lm,lp,sp,Ak,th1,ikmax,m)
    Cm=zeros(1,length(XUV)); 
    sz = size(Ak);
    l_ln=(sz(3)-1)/2;
    n_ln=(sz(4)-1)/2;
    l_array = [-ikmax:ikmax];
    E_k_p=Ek(XUV,lp.w,sp.BG,lm.U_pond,m,l_array,1);
    E_k_m=Ek(XUV,lp.w,sp.BG,lm.U_pond,m,l_array,-1);
    th_p = E2th(lm.F,sp.mu,lp.w,E_k_p);
    th_m = E2th(lm.F,sp.mu,lp.w,E_k_m);
    for ik=-ikmax:ikmax     
        AK_p = interp1(th1,Ak(:,1,l_ln+1+ik,n_ln+1+m),th_p(l_ln+1+ik,:));
        AK_m = interp1(th1,Ak(:,1,l_ln+1+ik,n_ln+1-m),th_m(l_ln+1+ik,:)); % correction from 2020: noticed -m missing
        Cm=Cm+pi*(sqrt(E_k_p(l_ln+1+ik,:)).*AK_p-sqrt(E_k_m(l_ln+1+ik,:)).*AK_m);
    end
end

