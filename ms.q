\l pykx.q
co:.pykx.import[`statsmodels.tsa.stattools]`:coint

rs:{select sym,close from stock where date within(.z.d-x;.z.d)}
hdb:`$":",.z.x 0
cls:`sym xgroup hdb(rs;2*365)

aeg:{@[0f^co[x;y]`;1]}
syms:exec sym from cls
ps:sx where (<).' sx:syms cross syms
pv:aeg .' 0f^({x`close}')cls([]sym:ps)

lrf:{enlist[y]lsq x xexp/:0 1}
sm:{
 (a;b):first lrf . log(cls([]sym:x))`close;
 {[a;b;x;y]y-a+b*x}[a;b]}

/
pyhm:.pykx.import[`seaborn]`:heatmap
mx:flip("f"$1,'not null reverse m),'m:(0,sums[reverse 1_til count[syms]])_ pv
pyhm[mx;`xticklabels pykw syms;`yticklabels pykw syms;`cmap pykw `RdYlGn_r]
pysh:.pykx.import[`matplotlib.pyplot]`:show
pysh[::]
\

