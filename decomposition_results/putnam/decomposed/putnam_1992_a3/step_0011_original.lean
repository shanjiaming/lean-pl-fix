theorem h₁₈ (m : ℕ) (mpos : m > 0) (S : Set (ℕ × ℕ × ℕ)) (hS : ∀ (n x y : ℕ), (n, x, y) ∈ S ↔ n > 0 ∧ x > 0 ∧ y > 0 ∧ n.Coprime m ∧ (x ^ 2 + y ^ 2) ^ m = (x * y) ^ n) (h : Odd m) (n x y : ℕ) (h₂ : (n, x, y) ∈ S) (h₃ : n > 0 ∧ x > 0 ∧ y > 0 ∧ n.Coprime m ∧ (x ^ 2 + y ^ 2) ^ m = (x * y) ^ n) (h₄ : (x ^ 2 + y ^ 2) ^ m = (x * y) ^ n) (h₅ : x > 0) (h₆ : y > 0) (h₇ : n > 0) (h₈ : n.Coprime m) (h₉ : Odd m) (k : ℕ) (hk : m = 2 * k + 1) (h₁₁ : (x ^ 2 + y ^ 2) ^ m = (x * y) ^ n) (h₁₂ : x ^ 2 + y ^ 2 > 0) (h₁₃ : x * y > 0) (h₁₄ : (x ^ 2 + y ^ 2) ^ m > 0) (h₁₅ : (x * y) ^ n > 0) (h₁₆ : (x ^ 2 + y ^ 2) ^ m = (x * y) ^ n) (h₁₇ : x ^ 2 + y ^ 2 > x * y) : (x ^ 2 + y ^ 2) ^ m > (x * y) ^ m := by
  exact
    pow_lt_pow_of_lt_left h₁₇ (by positivity)
      (by
        have h₁₉ : m > 0 := mpos
        omega)