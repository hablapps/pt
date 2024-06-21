beta:{
 ((n*sum x*y)-sum[x]*sum y)%
 (sum(x xexp 2)*n:count x)-sum[x] xexp 2}
alpha:{avg[y]-beta[x;y]*avg[x]}
lrf:{(alpha;beta).\:log(x;y)}

