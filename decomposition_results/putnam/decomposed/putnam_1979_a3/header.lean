import Mathlib

-- fun (a, b) => ∃ m : ℤ, a = m ∧ b = m
/--
Let $x_1, x_2, x_3, \dots$ be a sequence of nonzero real numbers such that $$x_n = \frac{x_{n-2}x_{n-1}}{2x_{n-2}-x_{n-1}}$$ for all $n \ge 3$. For which real values of $x_1$ and $x_2$ does $x_n$ attain integer values for infinitely many $n$?
-/