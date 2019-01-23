function U = squarePotentialBarrier(N)

U = zeros(N,1);
x= linspace(-2,2, N);
for i = 1 : N
   if abs(x(i)) <= 1
       U(i) = 2; 
   end 
end
U=[x',U];
end
