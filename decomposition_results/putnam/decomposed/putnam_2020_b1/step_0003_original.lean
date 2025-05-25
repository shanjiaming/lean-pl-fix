theorem h₂ (d : ℕ → ℕ) (S : ℤ) (hd : d = fun n => ∑ i, (digits 2 n)[i]!) (hS : S = ∑ k ∈ sorry, (-1) ^ d sorry * sorry ^ 3) : False := by
  have h₃ := hd
  simp [Function.funext_iff] at h₃
  have h₄ := h₃ 0
  have h₅ := h₃ 1
  have h₆ := h₃ 2
  have h₇ := h₃ 3
  norm_num [Fin.sum_univ_succ] at h₄ h₅ h₆ h₇ <;> simp_all (config := { decide := true }) <;> contradiction