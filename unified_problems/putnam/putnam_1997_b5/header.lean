import Mathlib

def tetration : ℕ → ℕ → ℕ
  | _, 0 => 1
  | b, (m + 1) => b^(tetration b m)
/--
Prove that for $n\geq 2$, \[\overbrace{2^{2^{\cdots^{2}}}}^{\mbox{$n$ terms}} \equiv \overbrace{2^{2^{\cdots^{2}}}}^{\mbox{$n-1$ terms}} \quad \pmod{n}.\]
-/