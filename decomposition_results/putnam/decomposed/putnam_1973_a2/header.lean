import Mathlib

open Nat Set MeasureTheory Topology Filter

-- True
/--
Consider an infinite series whose $n$th term is given by $\pm \frac{1}{n}$, where the actual values of the $\pm$ signs repeat in blocks of $8$ (so the $\frac{1}{9}$ term has the same sign as the $\frac{1}{1}$ term, and so on). Call such a sequence balanced if each block contains four $+$ and four $-$ signs. Prove that being balanced is a sufficient condition for the sequence to converge. Is being balanced also necessary for the sequence to converge?
-/