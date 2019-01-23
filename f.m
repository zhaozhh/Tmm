function yy=f(x)
% spline interpolation
global E MT
yy = spline(E,MT,x);
end