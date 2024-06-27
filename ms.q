rs:{select close by sym from stock where date within(.z.d-x;.z.d)}
hdb:`$":",.z.x 0
cls:hdb(rs;2*365)

syms:exec sym from cls
ps:sx where (<).' sx:syms cross syms

\l pykx.q
co:.pykx.import[`statsmodels.tsa.stattools]`:coint
aeg:@[;1]co[<]::
pv:aeg .'({x`close}')cls([]sym:ps)

/
pyhm:.pykx.import[`seaborn]`:heatmap
mx:flip("f"$1,'not null reverse m),'m:(0,sums[reverse 1_til count[syms]])_ pv
pyhm[mx;`xticklabels pykw syms;`yticklabels pykw syms;`cmap pykw `RdYlGn_r]
pysh:.pykx.import[`matplotlib.pyplot]`:show
pysh[::]
\

lrf:{first enlist[y]lsq x xexp/:0 1}
ab:{lrf . log(cls([]sym:x))`close}
sm:{[a;b;x;y]y-a+b*x}. ab@

