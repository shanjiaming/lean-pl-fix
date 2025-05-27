theorem h₃ (m n : ℤ) (hm : (m, n) ∈ A) (h₁ : 7 * m + 12 * n = 22) : m % 12 = 10 := by
  have h₄ := congr_arg (fun x => x % 12) h₁
  norm_num at h₄ ⊢
  omega