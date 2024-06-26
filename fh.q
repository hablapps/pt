quote:("PSFFFF";enlist csv)0:`$":data/quote.csv"
.fh.cur:.z.p
.fh.off:.fh.cur-(first quote)`time
.fh.tp:neg hopen `$":",first .z.x
.z.ts:{[x]
 r:select from quote where time within(.fh.cur;x)- .fh.off;
 .fh.cur:x;
 if[count[r]>0;.fh.tp(".u.upd";`quote;1_value flip r)];
 }
\t 1

