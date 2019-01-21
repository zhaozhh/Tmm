function T = Tp(U, E)
% Algorithm form the book "ELEMENTARY QUANTUM MECHANICS in ONE DIMENSION"
% Date   : 2019-01-20
% Author : Zhen-Hua Zhao,
% Email  : 147957454@qq.com
% Purpose: calculte the transmission probability spectrum.
% Space dimension =1;
% Corresponding equation of motion  is d^2 y / dx^2 = (V - E) y
% Function: return the transmission probability 
%                 T = T 
% for scattering states.

  x = U(:,1);
  V = U(:,2);
  M = eye(2);
 
        for i = 2:length(x)-1
            Ustep=(V(i-1)+V(i))/2;
            dx=x(i)-x(i-1);
            if E > Ustep
                k = sqrt(E - Ustep);
                Mt = [cos(k*dx), -(1/k)*sin(k*dx); k*sin(k*dx), cos(k*dx)];
            elseif E < Ustep
                k = sqrt(Ustep - E);
                Mt = [cosh(k*dx), -(1/k)*sinh(k*dx); -k*sinh(k*dx), cosh(k*dx)];
            else 
                Mt = [1, -dx; 0, 1];
            end %if

            M = M*Mt;

        end
       if E>V(1)&& E>V(end) % scattering state.
           kl = sqrt(E - V(1));
           kr = sqrt(E - V(end)) ;
         %T11 =  (M(1, 1) +kr*M(2, 2)/kl- kr*M(1,2) + M(2,1)/kl)/2;
         %  T=1/(abs(T11)^2);
        T=4*(kr/kl)/((M(1,1)+(kr/kl*M(2,2)))^2+(kr*M(1,2)-M(2,1)/kl)^2);
       else
           warning( "Not scattering state") 
       end  

end