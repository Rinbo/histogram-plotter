# Histogram Plotter
# Robin Börjesson 2018-11-26
# Plot two probability distribution as defined by matrix A and B in a unified graph

graphics_toolkit("gnuplot")

A = normrnd(70,15,1,[1000000]); # Distribution 1 - normrnd(Mu, Sigma, rank, [sample size])
B = normrnd(70,25,1,[1000000]); # Distribution 2 - normrnd(Mu, Sigma, rank, [sample size])
A = A(find(A>0)); #[optional] - eliminates all samples below 0
B = B(find(B>0)); #[optional] - eliminates all samples below 0

[y1 x1] = hist(A,200);
[y2 x2] = hist(B,200); 

[ys1 xs1] = stairs(y1, x1);
[ys2 xs2] = stairs(y2, x2);

xs1 = [xs1(1); xs1; xs1(end)];  xs2 = [xs2(1); xs2; xs2(end)];
ys1 = [0; ys1; 0];  ys2 = [0; ys2; 0];

clf
hold on; 
h1=fill(xs1,ys1,"red");
h2=fill(xs2,ys2,"green");

set(h1,'facealpha',0.5);
set(h2,'facealpha',0.5);
title ("Title goes here");
h = legend ({"population 1: Mu=50, Sigma=15"}, "Population 2: Mu=50,  Sigma=25");
legend (h, "location", "northeastoutside");
xlabel ("Label x-axis"); ylabel ("Label y-axis");
set (h, "fontsize", 20);

hold off;