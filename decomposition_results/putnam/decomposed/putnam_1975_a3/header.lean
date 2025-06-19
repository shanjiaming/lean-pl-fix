import Mathlib

open Polynomial

-- (fun (a, b, c) => ((a/b)^(1/(b - a)), (1 - ((a/b)^(1/(b - a)))^b)^(1/b), 0), fun (a, b, c) => (0, (1 - ((b/c)^(1/(c - b)))^b)^(1/b), (b/c)^(1/(c - b))))
/--
If $a$, $b$, and $c$ are real numbers satisfying $0 < a < b < c$, at what points in the set $$\{(x, y, z) \in \mathbb{R}^3 : x^b + y^b + z^b = 1, x \ge 0, y \ge 0, z \ge 0\}$$ does $f(x, y, z) = x^a + y^b + z^c$ attain its maximum and minimum?
-/