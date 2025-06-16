import Mathlib

open Set Topology Filter

-- fun (a, b) => (Real.exp (-1))*(b^b/a^a)^(1/(b-a))
/--
If $0 < a < b$, find $$\lim_{t \to 0} \left( \int_{0}^{1}(bx + a(1-x))^t dx \right)^{\frac{1}{t}}$$ in terms of $a$ and $b$.
-/