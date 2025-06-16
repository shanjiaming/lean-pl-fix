theorem putnam_1971_b6
(δ : ℤ → ℤ)
(hδ : δ = fun n => sSup {t | Odd t ∧ t ∣ n})
: ∀ x : ℤ, x > 0 → |∑ i in Finset.Icc 1 x, (δ i)/(i : ℚ) - 2*x/3| < 1 := by
  have h_main : ∀ (x : ℤ), x > 0 → |∑ i in Finset.Icc 1 x, (δ i)/(i : ℚ) - 2*x/3| < 1 := by
    intro x hx
    have h₁ : x > 0 := hx
    have h₂ : |∑ i in Finset.Icc 1 x, (δ i)/(i : ℚ) - 2*x/3| < 1 := by
      have h₃ : δ = fun n => sSup {t | Odd t ∧ t ∣ n} := hδ
      have h₄ : ∀ (n : ℤ), n ≠ 0 → δ n = sSup {t : ℤ | Odd t ∧ t ∣ n} := by
        admit
      have h₅ : ∀ (n : ℤ), n > 0 → δ n = sSup {t : ℤ | Odd t ∧ t ∣ n} := by
        intro n hn
        have h₅₁ : n ≠ 0 := by admit
        admit
      have h₆ : ∀ (n : ℤ), n > 0 → δ n = sSup {t : ℤ | Odd t ∧ t ∣ n} := by
        admit
      
      have h₇ : |∑ i in Finset.Icc 1 x, (δ i)/(i : ℚ) - 2*x/3| < 1 := by
        
        admit
      admit
    admit
  admit