import Mathlib

open Filter Topology Real Nat

-- Note: Boosted the domain/range of digits_set to ℕ because of membership problems in Finset.range 10
-- fun n => if n = 1 then 45 else if n = 2 then 10 * 45^2 else 0
/--
To each positive integer with $n^{2}$ decimal digits, we associate the determinant of the matrix obtained by writing the digits in order across the rows. For example, for $n=2$, to the integer 8617 we associate $\det \left( \begin{array}{cc} 8 & 6 \ 1 & 7 \end{array} \right) = 50$. Find, as a function of $n$, the sum of all the determinants associated with $n^{2}$-digit integers. (Leading digits are assumed to be nonzero; for example, for $n=2$, there are 9000 determinants.)
-/