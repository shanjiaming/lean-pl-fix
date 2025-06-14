import Mathlib

open Filter Topology Nat

-- 17711
/--
If $X$ is a finite set, let $|X|$ denote the number of elements in $X$. Call an ordered pair $(S,T)$ of subsets of $\{1,2,\dots,n\}$ \emph{admissible} if $s>|T|$ for each $s \in S$, and $t>|S|$ for each $t \in T$. How many admissible ordered pairs of subsets of $\{1,2,\dots,10\}$ are there? Prove your answer.
-/