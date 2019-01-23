function U = squarePotentialWell(N)

U = ones(N,1)*100;
x= linspace(-2,2, N);
for i = 1 : N
   if abs(x(i)) <= 1
       U(i) = 0; 
   end 
end
U=[x',U];
 end