theorem amc12a_2021_p8 (d : ℕ → ℕ) (h₀ : d 0 = 0) (h₁ : d 1 = 0) (h₂ : d 2 = 1) (h₃ : ∀ n ≥ 3, d n = d (n - 1) + d (n - 3)) : Even (d 2021) ∧ Odd (d 2022) ∧ Even (d 2023) :=
  by
  have h₄ :
    ∀ n : ℕ,
      (n % 7 = 0 → d n % 2 = 0) ∧
        (n % 7 = 1 → d n % 2 = 0) ∧
          (n % 7 = 2 → d n % 2 = 1) ∧
            (n % 7 = 3 → d n % 2 = 1) ∧
              (n % 7 = 4 → d n % 2 = 1) ∧ (n % 7 = 5 → d n % 2 = 0) ∧ (n % 7 = 6 → d n % 2 = 1) := by sorry
  have h₅ : Even (d 2021) := by sorry
  have h₆ : Odd (d 2022) := by sorry
  have h₇ : Even (d 2023) := by sorry
  --  exact ⟨h₅, h₆, h₇⟩
  hole