import Mathlib

open EuclideanGeometry Topology Filter Complex

-- fun n => 2^(n - 1)
/--
How many orderings of the integers from $1$ to $n$ satisfy the condition that, for every integer $i$ except the first, there exists some earlier integer in the ordering which differs from $i$ by $1$?
-/