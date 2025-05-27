theorem aime_2025i_p1 (S : Finset ℕ)
    (h₀ : ∀ (b : ℕ), b ∈ S ↔ b > 9 ∧ b + 7 ∣ 9 * b + 7) :
    (∑ b in S, b) = 70 := by