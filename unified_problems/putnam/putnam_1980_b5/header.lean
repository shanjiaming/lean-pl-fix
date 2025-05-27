import Mathlib

open Set

-- fun t : ℝ => 1 ≥ t
/--
A function $f$ is convex on $[0, 1]$ if and only if $$f(su + (1-s)v) \le sf(u) + (1 - s)f(v)$$ for all $s \in [0, 1]$.
Let $S_t$ denote the set of all nonnegative increasing convex continuous functions $f : [0, 1] \rightarrow \mathbb{R}$ such that $$f(1) - 2f\left(\frac{2}{3}\right) + f\left(\frac{1}{3}\right) \ge t\left(f\left(\frac{2}{3}\right) - 2f\left(\frac{1}{3}\right) + f(0)\right).$$
For which real numbers $t \ge 0$ is $S_t$ closed under multiplication?
-/