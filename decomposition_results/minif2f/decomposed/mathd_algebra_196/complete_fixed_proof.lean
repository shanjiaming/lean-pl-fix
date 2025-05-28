theorem mathd_algebra_196 (S : Finset ℝ) (h₀ : ∀ x : ℝ, x ∈ S ↔ abs (2 - x) = 3) : (∑ k in S, k) = 4:=
  by
  have h₁ : S = {-1, 5}:= by
    --  apply Finset.ext
    --  intro x
    --  simp only [Finset.mem_insert, Finset.mem_singleton, h₀]
    --  constructor
    --  · intro h
      have h₂ : abs (2 - x) = 3 := h
      have h₃ : 2 - x = 3 ∨ 2 - x = -3:= by -- -- apply eq_or_eq_neg_of_abs_eq <;> linarith
        hole
    --    cases h₃ with
    --    | inl h₃ =>
    --      have h₄ : x = -1 := by linarith
    --      rw [h₄]
    --      norm_num
    --    | inr h₃ =>
    --      have h₄ : x = 5 := by linarith
    --      rw [h₄]
    --      norm_num
    --  · intro h
    --    cases h with
    --    | inl h =>
    --      rw [h]
    --      norm_num [abs_of_nonneg, abs_of_nonpos]
    --    | inr h =>
    --      rw [h]
    --      norm_num [abs_of_nonneg, abs_of_nonpos]
    hole
  have h₂ : (∑ k in S, k) = 4:= by
    --  rw [h₁]
    --  norm_num [Finset.sum_pair (show (-1 : ℝ) ≠ 5 by norm_num)] <;> simp_all [Finset.sum_singleton] <;> norm_num <;>
      linarith
    hole
  --  exact h₂
  linarith