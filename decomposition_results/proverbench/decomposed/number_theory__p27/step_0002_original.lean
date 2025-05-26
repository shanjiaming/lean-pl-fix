theorem h₁ (x y k m n z : ℕ+) (hz : (↑x : ℕ) ^ (↑m : ℕ) + (↑y : ℕ) ^ (↑n : ℕ) = (↑z : ℕ)) : 4 * (↑k : ℕ) * (↑x : ℕ) * (↑y : ℕ) ≥ 4 := by
  have h₂ : (k : ℕ) ≥ 1 := k.2
  have h₃ : (x : ℕ) ≥ 1 := x.2
  have h₄ : (y : ℕ) ≥ 1 := y.2
  calc
    (4 * k * x * y : ℕ) = 4 * (k : ℕ) * (x : ℕ) * (y : ℕ) := by ring
    _ ≥ 4 * 1 * 1 * 1 := by gcongr <;> simp_all [PNat]
    _ = 4 := by norm_num