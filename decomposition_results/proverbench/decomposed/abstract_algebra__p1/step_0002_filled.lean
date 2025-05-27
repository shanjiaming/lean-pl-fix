theorem h_main (P : Polynomial ℤ) (h : ∃ a b c, a ≠ b ∧ b ≠ c ∧ a ≠ c ∧ Polynomial.eval a P = 1 ∧ Polynomial.eval b P = -1 ∧ Polynomial.eval c P = 1) : ∀ (z : ℤ), Polynomial.eval z P = 0 → False := by
  --  intro z hz
  --  rcases h with ⟨a, b, c, hab, hbc, hac, hP_a, hP_b, hP_c⟩
  have h₁ : a - z = 1 ∨ a - z = -1 := by sorry
  have h₂ : b - z = 1 ∨ b - z = -1 := by sorry
  have h₃ : c - z = 1 ∨ c - z = -1 := by sorry
  have h₄ : a = z + 1 ∨ a = z - 1 := by sorry
  have h₅ : b = z + 1 ∨ b = z - 1 := by sorry
  have h₆ : c = z + 1 ∨ c = z - 1 := by sorry
  --  --  --  rcases h₄ with (h₄ | h₄) <;> rcases h₅ with (h₅ | h₅) <;> rcases h₆ with (h₆ | h₆) <;>
  --            simp_all [sub_eq_add_neg, add_assoc] <;>
          (try omega) <;>
        (try {nlinarith
          }) <;>
      (try {aesop
        }) <;>
    (try {nlinarith
      })
  hole