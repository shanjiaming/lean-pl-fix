theorem h₃ (k : ℤ) (h_forward : -44 + 5 * k ∈ B → ∃ k_1, -44 + 5 * k = -44 + 5 * k_1) (m n : ℤ) (hm : m = -110 + 12 * k) (hn : n = 66 - 7 * k) (h_eq : 7 * m + 12 * n = 22) (h₂ : (m, n) ∈ A) : -44 + 5 * k = m + n := by
  have h₄ : m = -110 + 12 * k := hm
  have h₅ : n = 66 - 7 * k := hn
  --  --  rw [h₄, h₅] <;> ring_nf <;> omega
  linarith