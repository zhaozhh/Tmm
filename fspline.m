function y=fspline(x)
% spline interpolation
global E MT

y=spline(E,MT,x);

end