system "l ml.q"
system "l pykx.q"
co:.pykx.import[`statsmodels.tsa.stattools]`:coint

rs:{select date,sym,close from stock where date within(.z.d-x;.z.d)}
hdb:`$"::5009" / TODO hardcoded port
t:`sym xgroup hdb(rs;2*365)
syms:exec sym from t
ps:sx where (<).' sx:syms cross syms

aeg:{@[0f^co[x;y]`;1]}
pv:aeg .' 0f^({x`close}')t([]sym:ps)
.pt.ix:ps pv?lw:min pv
(a;b):lrf . log(t([]sym:.pt.ix))`close
.pt.sp:sp:{y-a+b*x}

/
pyhm:.pykx.import[`seaborn]`:heatmap
mx:flip("f"$1,'not null reverse m),'m:(0,sums[reverse 1_til count[syms]])_ pv
pyhm[mx;`xticklabels pykw syms;`yticklabels pykw syms;`cmap pykw `RdYlGn_r]
pysh:.pykx.import[`matplotlib.pyplot]`:show
pysh[::]
\

