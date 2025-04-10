import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $P(n)$ and $S(n)$ denote the product and the sum, respectively, of the digits
of the integer $n$. For example, $P(23) = 6$ and $S(23) = 5$. Suppose $N$ is a
two-digit number such that $N = P(N)+S(N)$. What is the units digit of $N$?

$\text{(A)}\ 2\qquad \text{(B)}\ 3\qquad \text{(C)}\ 6\qquad \text{(D)}\ 8\qquad \text{(E)}\ 9$ Show that it is (\text{E})9.-/
theorem amc12_2001_p2 (a b n : ℕ) (h₀ : 1 ≤ a ∧ a ≤ 9) (h₁ : 0 ≤ b ∧ b ≤ 9) (h₂ : n = 10 * a + b)
  (h₃ : n = a * b + a + b) : b = 9 := by
  -- First, substitute the expression for n from h₂ into the equation h₃
  rw [h₂] at h₃
  -- Now we have: 10 * a + b = a * b + a + b
  -- Simplify the equation by subtracting b from both sides
  simp at h₃
  -- Equation becomes: 10 * a = a * b + a
  -- Factor out a on the right side: 10 * a = a * (b + 1)
  rw [mul_add] at h₃
  simp at h₃
  -- Since a is between 1 and 9 (from h₀), we can divide both sides by a
  have h₄ : a ≠ 0 := by linarith [h₀.1]
  -- Division gives us: 10 = b + 1
  rw [← mul_right_inj' h₄] at h₃
  simp at h₃
  -- Now we have b + 1 = 10
  -- Subtract 1 from both sides to solve for b
  rw [add_left_inj] at h₃
  -- Final equation: b = 9
  exact h₃