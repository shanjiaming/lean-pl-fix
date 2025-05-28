theorem h1 (n : ℕ → ℤ) (hn : ∀ (a : ℕ), n a = 101 * ↑a - 100 * 2 ^ a) : False := by
  have h2 := hn 0
  have h3 := hn 1
  have h4 := hn 2
  --  --  --  norm_num at h2 h3 h4 <;> simp_all (config := { decide := true }) <;> aesop
  hole