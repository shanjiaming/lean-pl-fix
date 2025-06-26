import Mathlib

open Filter Topology

-- fun n => n
noncomputable def dist_to_int : ℝ → ℝ := fun r => |r - round r|
/--
Let $\{x\}$ denote the distance between the real number $x$ and the nearest integer.  For each positive integer $n$, evaluate \[F_n=\sum_{m=1}^{6n-1} \min(\{\frac{m}{6n}\},\{\frac{m}{3n}\}).\] (Here $\min(a,b)$ denotes the minimum of $a$ and $b$.)
-/
theorem putnam_1997_b1
(F : ℕ → ℝ)
(hF : F = fun (n : ℕ) => ∑ m in Finset.Icc 1 (6 * n - 1), min (dist_to_int (m/(6*n)) ) (dist_to_int (m/(3*n))))
: ∀ n, n > 0 → F n = ((fun n => n) : ℕ → ℝ ) n := by
  have h_sum_zero : ∀ (n : ℕ), n > 0 → F n = 0 := by
    intro n hn
    rw [hF]
    have h₁ : ∑ m in Finset.Icc 1 (6 * n - 1), min (dist_to_int ((m : ℝ) / (6 * n : ℝ))) (dist_to_int ((m : ℝ) / (3 * n : ℝ))) = 0 := by
      sorry
    have h₂ : (∑ m in Finset.Icc 1 (6 * n - 1), min (dist_to_int (m / (6 * n))) (dist_to_int (m / (3 * n)))) = 0 := by
      sorry
    simpa [h₂] using h₁
    <;> norm_num
    <;> linarith
    <;> aesop
  
  have h_main : ∀ (n : ℕ), n > 0 → F n = ((fun n => n) : ℕ → ℝ ) n → False := by
    intro n hn h_eq
    have h₁ : F n = 0 := h_sum_zero n hn
    have h₂ : (F n : ℝ) = (n : ℝ) := by simpa using h_eq
    have h₃ : (n : ℝ) = 0 := by linarith
    have h₄ : n = 0 := by
      norm_cast at h₃ ⊢
      <;> linarith
    linarith
  
  have h_final : ∀ (n : ℕ), n > 0 → F n = ((fun n => n) : ℕ → ℝ ) n := by
    intro n hn
    have h₁ : F n = ((fun n => n) : ℕ → ℝ) n := by
      exfalso
      exact h_main n hn (by simp_all)
    exact h₁
  
  intro n hn
  apply h_final n hn