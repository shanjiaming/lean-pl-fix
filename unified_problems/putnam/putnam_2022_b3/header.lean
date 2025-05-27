import Mathlib

open Polynomial

-- Note: boosts domain of "isred" to all reals instead of just positive reals
-- True
/--
Assign to each positive real number a color, either red or blue. Let $D$ be the set of all distances $d>0$ such that there are two points of the same color at distance $d$ apart. Recolor the positive reals so that the numbers in $D$ are red and the numbers not in $D$ are blue. If we iterate this recoloring process, will we always end up with all the numbers red after a finite number of steps?
-/