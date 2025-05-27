theorem h₆₄₅₄ (a b c x y z : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) (S : ℝ) (hS : a + x = S ∧ b + y = S ∧ c + z = S) (h₁ : x = S - a) (h₂ : y = S - b) (h₃ : z = S - c) (h₄ : a * y + b * z + c * x = S * (a + b + c) - (a * b + b * c + c * a)) (h₅ h₆₁ : (S - a) * (S - b) * (S - c) > 0) (h₆₂ : 0 < S) (h₆₃ h₆₄₁ : S ^ 3 - S ^ 2 * (a + b + c) + S * (a * b + b * c + c * a) - a * b * c > 0) (h₆₄₂ : 0 < S) (h₆₄₃ : 0 < a * b * c) (h₆₄₄ : 0 < a * b * c / S) (h₆₄₅₁ : S * (S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a)) > a * b * c) (h₆₄₅₂ : S > 0) (h₆₄₅₃ : S * (S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a)) > a * b * c) : S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a) > a * b * c / S := by
  calc
    S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a) = (S * (S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a))) / S :=
      by field_simp [h₆₂.ne'] <;> ring_nf <;> nlinarith
    _ > (a * b * c) / S :=
      by
      have h₆₄₅₅ : S * (S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a)) > a * b * c := h₆₄₅₁
      have h₆₄₅₆ : 0 < S := h₆₂
      have h₆₄₅₇ : 0 < a * b * c := by positivity
      have h₆₄₅₈ : 0 < a * b * c / S := by positivity
      have h₆₄₅₉ : (S * (S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a))) / S > (a * b * c) / S :=
        by
        apply (div_lt_div_iff (by positivity) (by positivity)).mpr
        nlinarith
      exact h₆₄₅₉