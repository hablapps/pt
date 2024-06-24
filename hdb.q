syms:`BFX`FCHI`GDAXI`HSI`KS11`MXX`N225`NASDAQ100`NYA`RUT`SP500`STOXX
rs:{update sym:x from ("DFFFFFJ";enlist csv)0:`$":data/stocks/",string[x],".csv"}
sn:{(lower cols x) xcol .Q.id x}
raw:raze (sn rs::) each syms
stock:select from raw where count[syms]=(count;i) fby date

