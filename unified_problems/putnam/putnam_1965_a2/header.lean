import Mathlib

open EuclideanGeometry

/--
Prove that $$\sum_{r=0}^{\lfloor\frac{n-1}{2}\rfloor} \left(\frac{n - 2r}{n} {n \choose r}\right)^2 = \frac{1}{n} {{2n - 2} \choose {n - 1}}$$ for every positive integer $n$.
-/