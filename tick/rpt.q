\l tick/u.q

spread:([]time:`timespan$();spread:`float$())

.u.init[]
.u.snap:{0#spread}
.u.end:{}

ms:`$":",.z.x 1
(ix;sp):ms({enlist[ix],sm ix:ps pv?min pv};::)

d:ix!2#0f
upd:{d^:exec sym!log(ask+bid)%2 from select by sym from y}
.z.ts:{.u.pub[`spread;([]time:1#.z.N;spread:sp . d ix)]}
\t 16

tp:hopen`$":",.z.x 0
tp(".u.sub";`quote;ix)

