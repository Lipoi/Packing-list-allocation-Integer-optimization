param c {RIDER, ORDERSET};
param x {RIDER, ORDERSET};
param d {ORDER, ORDERSET};
param y {ORDER};
param cf;

minimize TOTAL_COST:
sum {j in RIDER, k in ORDERSET} 
c[j][k]*x[j][k] 
+ sum {l in ORDER}
cf*y[l];

subject to ORDER is(ornot) distributed:
for l in ORDER:
sum {j in RIDER, k in ORDERSET}
d[l][k]*x[j][k] = 1;

subject to One_Rider_One_Orderset:
for j in RIDER:
sum {k in ORDER}
x[j][k] <= 1;

subject to integer_distribution1:
for j in RIDER, k in ORDERSET:
0 <= x[j][k] <= 1 

subject to integer_distribution2:
for l in ORDER:
0 <= y[l] <= 1

