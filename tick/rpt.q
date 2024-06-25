spread:([]time:`timespan$();spread:`float$())

\l tick/u.q
\l aeg.q

.u.init[];

.u.snap:{0#spread};

.u.end:{};

d:.pt.ix!2#0f

upd:{d^:exec sym!log(ask+bid)%2 from select by sym from y};

.z.ts:{.u.pub[`spread;([]time:1#.z.N;spread:.pt.sp . d .pt.ix)]}
\t 16

(hopen `$":",.z.x 0)"(.u.sub[`quote;",(.Q.s1 .pt.ix),"])"

