import Mathlib

open Set
open scoped Nat

-- fun k ↦ (k)! * (k + 1)! / ((3 * k + 1) * (2 * k)!)
/--
Let $k$ be a positive integer. Suppose that the integers $1, 2, 3, \dots, 3k+1$ are written down in random order. What is the probability that at no time during this process, the sum of the integers that have been written up to that time is a positive integer divisible by $3$? Your answer should be in closed form, but may include factorials.
-/