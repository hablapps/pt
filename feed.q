syms:`FCHI`GDAXI
rs:{update sym:x from ("PFFFF";enlist csv)0:`$":data/",string[x],".csv"}
sn:{(lower cols x) xcol .Q.id x}
raw:`timestamp xasc raze (sn rs::) each syms
quote:`timestamp`sym xcols raw

.fd.cur:.z.p
.fd.off:.fd.cur-(first quote)`timestamp
.fd.tp:neg hopen `$":localhost:",first .z.x
.z.ts:{[x]
 r:select from quote where timestamp within (.fd.cur;x)- .fd.off;
 .fd.cur:x;
 if[count[r]>0;.fd.tp(".u.upd";`quote;1_value flip r)]
 }
\t 100

