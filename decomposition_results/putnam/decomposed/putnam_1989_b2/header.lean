import Mathlib

open Nat

-- Note: This formalization uses "Type" rather than "Type*" as the underlying structure for a semigroup.
-- True
/--
Let $S$ be a non-empty set with an associative operation that is left and right cancellative ($xy=xz$ implies $y=z$, and $yx=zx$ implies $y=z$). Assume that for every $a$ in $S$ the set $\{a^n:\,n=1, 2, 3, \ldots\}$ is finite. Must $S$ be a group?
-/