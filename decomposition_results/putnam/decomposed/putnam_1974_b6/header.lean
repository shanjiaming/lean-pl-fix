import Mathlib

open Set Nat Polynomial Filter Topology

-- ((2^1000 - 1)/3, (2^1000 - 1)/3, 1 + (2^1000 - 1)/3)
/--
For a set with $1000$ elements, how many subsets are there whose candinality is respectively $\equiv 0 \bmod 3, \equiv 1 \bmod 3, \equiv 2 \bmod 3$?
-/