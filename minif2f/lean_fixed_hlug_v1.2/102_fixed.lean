import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $a$ and $b$ be positive integers such that $ab + 1$ divides $a^{2} + b^{2}$. Show that
$
\frac {a^{2} + b^{2}}{ab + 1}
$
is the square of an integer.-/
theorem imo_1988_p6 (a b : ℕ) (h₀ : 0 < a ∧ 0 < b) (h₁ : a * b + 1 ∣ a ^ 2 + b ^ 2) :
  ∃ x : ℕ, (x ^ 2 : ℝ) = (a ^ 2 + b ^ 2) / (a * b + 1) := by
  -- First, extract the positivity hypotheses for a and b
  rcases h₀ with ⟨ha, hb⟩
  
  -- Define k as the ratio (a² + b²)/(ab + 1), which is a natural number by divisibility
  set k := (a^2 + b^2) / (a*b + 1) with hk_def
  have hk_nat : k ∈ ℕ := by
    rw [← Nat.div_eq_of_eq_mul_right (by linarith) h₁]
    exact Nat.div_mul_le_self _ _

  -- We proceed by well-founded induction using the sum a + b as the decreasing metric
  revert a b ha hb h₁
  apply Nat.strong_induction_on (a + b)