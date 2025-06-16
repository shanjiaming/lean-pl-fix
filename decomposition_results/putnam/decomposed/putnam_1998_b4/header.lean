import Mathlib

open Set Function Metric

-- {nm | let ⟨n,m⟩ := nm; multiplicity 2 n ≠ multiplicity 2 m}
/--
Find necessary and sufficient conditions on positive integers $m$ and $n$ so that \[\sum_{i=0}^{mn-1} (-1)^{\lfloor i/m \rfloor +\lfloor i/n\rfloor}=0.\]
-/