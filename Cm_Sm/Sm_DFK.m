function [Sm]=Sm_DFK(XUV,lm,lp,sp,Ak,th1,ikmax,Eint,dEint,m)

ek_array=[0:dEint:Eint]';
ek_sq = sqrt(ek_array);

w_ln=length(XUV);
sz = size(Ak);   
l_ln=(sz(3)-1)/2;
n_ln=(sz(4)-1)/2;
e_ln = length(ek_array);

[Sm,ones_ek_t,ones_w_t,singular,regular] = Sm_init_arrays(w_ln,e_ln);
ek_mtr = ek_array*ones_w_t;

tc = sqrt(2)*(cnst.c_light)*lm.F./(sqrt(sp.mu)*cnst.h_bar*(lp.w^2)); % a constant for easy evaluation of theta1 from energy: theta1=tc*sqrt(Energy)

for ik=-ikmax:ikmax
    % This integral is the result of coutour integration of the resonances, giving a i*2pi*cos
    % term (Cm) and a prinicipal-value sin term (Sm), calculated here. A Principal
    % Value intagral is calculated via antithetic method.
    
    % left part of integral
    % I have checked, that inclusion of the singular part of the integral
    % is crucial. Otherwise, the result is inaccurate. For this, I have
    % compared the results from Otobe at 5MV/cm. Further, the left part of
    % integral is more likely to have a singularity, whereas the right part
    % is almost always non-resonant, exept when ek+XUV+BG+Up <= 2mW + lW,
    % which is an emission process involving many virtual pump photons.
    %The left resonance describes absoprtion process: w = BG+ek+Up+lW+-2mW,
    % and a close inspection reveals channel openings

    Ak_obj = interp1(th1,Ak(:,1,l_ln+1+ik,n_ln+1+m),tc*ek_sq);
    num_aux = (ek_sq.*Ak_obj)*ones_w_t; % numerator for the regular part of integral
    resonance_left=XUV+2*m*cnst.h_bar*lp.w-(sp.BG+lm.U_pond+ik*cnst.h_bar*lp.w);
    
    freq_denom_left = ek_mtr - ones_ek_t*resonance_left;
    %H = heaviside(2*ones_ek_t*resonance_left - ek_array*ones_w_t);
    H = my_heaviside(2*ones_ek_t*resonance_left - ek_array*ones_w_t);
    mirror_ek_sq = sqrt(abs(2*ones_ek_t*resonance_left - ek_array*ones_w_t)).*H; % where mirror point is 2x0-x
    
    Ak_mirror=interp1(th1,Ak(:,1,l_ln+1+ik,n_ln+1+m),tc*mirror_ek_sq);

    freq_numerator_left_s=0.5*(num_aux - mirror_ek_sq.*Ak_mirror); % singular numerator left

    % cropping matrix for singular vs regular
    c1 = ((ek_mtr - ones_ek_t*((2*resonance_left-Eint)))>=0); 
    c2 = ((ek_mtr - ones_ek_t*((2*resonance_left)))<=0);
    
    singular(c1&c2) = 1;
    singular(~(c1&c2)) = 0;
    regular(c1&c2) = 0;
    regular(~(c1&c2)) = 1;

    Intcore_left  = -((freq_numerator_left_s.*singular + num_aux.*regular))./freq_denom_left; % singular plus regular part left
    % Why minus? Because left part is (w0-w) resonant.

    % now the right part
    % Ak product is symmettric for n=2m and antisymmteric for n = 2m+1
    Ak_obj = interp1(th1,Ak(:,1,l_ln+1+ik,n_ln+1-m),tc*ek_sq);
    num_aux = (ek_sq.*Ak_obj)*ones_w_t; % numerator for the regular part of integral
    
    resonance_right=-(XUV-2*m*cnst.h_bar*lp.w+(sp.BG+lm.U_pond+ik*cnst.h_bar*lp.w)); % checked on 06.06.2021. Note that this is the resonance frequency only, not the full denominator
    freq_denom_right = ek_mtr - ones_ek_t*resonance_right;
    %H = heaviside(2*ones_ek_t*resonance_right - ek_array*ones_w_t);
    H = my_heaviside(2*ones_ek_t*resonance_right - ek_array*ones_w_t);
    mirror_ek_sq = sqrt(abs(2*ones_ek_t*resonance_right - ek_array*ones_w_t)).*H;
        
    Ak_mirror=interp1(th1,Ak(:,1,l_ln+1+ik,n_ln+1-m),tc*mirror_ek_sq); % 09.05.2020 Found that instead of -m there was a +m! Changed.
    
    freq_numerator_right_s=0.5*(num_aux - mirror_ek_sq.*Ak_mirror); % singular numerator right
    c1 = ((ek_mtr - ones_ek_t*((2*resonance_right-Eint)))>=0); 
    c2 = ((ek_mtr - ones_ek_t*((2*resonance_right)))<=0);

    singular(c1&c2) = 1;
    singular(~(c1&c2)) = 0;
    regular(c1&c2) = 0;
    regular(~(c1&c2)) = 1;
    
    Intcore_right  = ((freq_numerator_right_s.*singular + num_aux.*regular))./freq_denom_right; % singular plus regular part left
    % Now put together left and right parts
    Sm=Sm-trapz(ek_array,Intcore_left)-trapz(ek_array,Intcore_right);
end
end
