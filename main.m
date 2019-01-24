% Algorithm form the book "ELEMENTARY QUANTUM MECHANICS in ONE DIMENSION"
% Date   : 2019-01-20
% Author : Zhen-Hua Zhao,
% Email  : 147957454@qq.com
% Purpose: calculte the transmission probability spectrum.
% Space dimension =1;
% Equation of motion  is d^2 y / dx^2 = (V - E) y
% main.m
% Be tested can be ran in octave

clc
% First you need to provide the file which hold the potential datas or
% provide the function of the potential.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The structure of 'potentail.dat' is that the first column stores the values of coordinate
% and second column stores the corresponding values of potential.
%  
% pathname=pwd;
% U=load([pathname,'\','potentail.dat']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bound state,
global E MT
U = squarePotentialWell(1000);
figure
plot(U(:,1),U(:,2),'LineWidth',1);  
N=100;   % The number of the values of energy you want to calculate, it can be adjusted
E = linspace(0.001,max(U(:,2))-0.1, N);
MT=zeros(N,1); % The array stores the value transmission probability T  for scattering
% states, or stores the transmission coefficent T11 for bound states.

for i=1:N
    T = Tc(U, E(i));
    MT(i)=T;
end
figure
plot(E,MT,'LineWidth',1);  
    xlabel('E')
    ylabel('T ')
axis([E(1) E(end) -1 1])
options = optimset('TolFun',1e-3);
En=fsolve(@fspline,(1:10:100),options);
En=round(En*1000)/1000;% Keep three decimal places after the decimal point, rounded
En=unique(En); % Remove the same item.
fprintf('The number of eigenvalues is: %i\n', length(En));
disp('The corresponding reduced eigenvalues of energy are: ');
fprintf('E  ->: %f\n', En);
disp('------------------');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Scattering state,
% U = square_potential_barrier(1000);
% figure
% plot(U(:,1),U(:,2),'LineWidth',1);  
% N=1000;   % The number of the values of energy you want to calculate, it can be adjusted
% % E = linspace(0.001,max(U(:,2))-0.1, N);
% E = linspace(1,10, N);
% MT=zeros(N,1); % The array stores the value transmission probability T  for scattering
% % states, or stores the transmission coefficent T11 for bound states.
% 
% for i=1:N
%     T = Tp(U, E(i));
%     % T = Tc(U, E(i));
%     MT(i)=T;
% end
% figure
% plot(E,MT,'LineWidth',1);  
%     xlabel('E')
%     ylabel('T ')
% %axis([E(1) E(end) -10 10])
% pointPeakes=find(diff(sign(diff(MT)))<0)+1;%find out all the maximum.
% fprintf('The number of peaks is: %i\n', length(pointPeakes));
% disp('The corresponding reduced values of energy are :');
% fprintf('E  ->: %f\n', E(pointPeakes));
% disp('------------------');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





