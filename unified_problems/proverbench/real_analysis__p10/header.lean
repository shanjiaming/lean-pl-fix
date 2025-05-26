import Mathlib

/-
Let $f$ be a function defined in a punctured neighborhood of $x_0$. If $\lim_{x \rightarrow x_0} f(x) = A$ and $A > 0$, then there exists $\delta > 0$ such that for all $x$ satisfying $0 < |x - x_0| < \delta$, we have $f(x) > 0$.
-/

open Filter Topology

variable {X Y : Type} [MetricSpace X] [MetricSpace Y] [LinearOrderedField Y]
variable {f : X → Y} {x₀ : X} {A : Y}