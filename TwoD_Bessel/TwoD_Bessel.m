function [Gen_Bessel]=TwoD_Bessel(th1,th2,l,max_order,approx)
    Gen_Bessel=zeros(length(th1(1,:)),length(th2));
    switch approx.type
        case 'exact'
            for m=-max_order:max_order
                Gen_Bessel_partial = ((besselj((l-2*m),th1)')*besselj(m,th2));
                Gen_Bessel=Gen_Bessel+Gen_Bessel_partial;
            end
        case 'asymptotic small field'
            % Krainov, Generalized Bessel Properties, Appendix J
            % probably it doesnt work because theta1 is never truly small,
            % with large k. Or, because this is asymptotic behavior with
            % epsilon, and not an approximation!p
            epsilon = 1/1000;
            mu = th1/sqrt(epsilon);
            nu = th2/epsilon;
            Gen_Bessel = asymptotic_TwoD_Bessel(epsilon,mu,nu,l);
        case 'small th2'
            %Gen_Bessel = besselj(l,th1);
            Gen_Bessel = besselj(l,th1) + 0.5*th2*(besselj(l-2,th1) - besselj(l+2,th1));
        case 'Taylor'
            Gen_Bessel = besselj_small_argument(l,th1,approx.order) + 0*0.5*th2*(besselj_small_argument(l-2,th1,approx.order) - besselj_small_argument(l+2,th1,approx.order));
    end
end

