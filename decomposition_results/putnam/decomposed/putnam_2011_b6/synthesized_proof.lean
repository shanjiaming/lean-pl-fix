theorem putnam_2011_b6
(p : ℕ)
(hp : Odd p ∧ Nat.Prime p)
: {n ∈ Finset.range p | ¬ p ∣ ∑ k : Finset.range p, Nat.factorial k * n^(k : ℕ)}.card ≥ (p + 1)/2 := by
  have h2 : p ≠ 0 := by
    have h2 := hp.2.pos
    linarith

  have h3 : p ≠ 1 := by
    have h3 := Nat.Prime.ne_one hp.2
    omega

  have h4 : (p : ℕ) % 2 = 1 := by
    admit

  have h5 : (p + 1) / 2 ≤ p := by
    omega

  have h6 : {n ∈ Finset.range p | ¬ p ∣ ∑ k : Finset.range p, Nat.factorial k * n^(k : ℕ)}.card ≥ (p + 1) / 2 := by
    have h₀ := hp.1
    have h₁ := hp.2
    have h₂ : p ≥ 2 := Nat.Prime.two_le h₁

    have h₃ : (p + 1) / 2 ≤ p := by linarith
    have h₄ : (p + 1) / 2 ≤ p := by linarith

    have h₅ : {n ∈ Finset.range p | ¬ p ∣ ∑ k : Finset.range p, Nat.factorial k * n^(k : ℕ)}.card ≥ (p + 1) / 2 := by

      have h₅₁ : ∀ n : ℕ, n ∈ (Finset.range p) → (p ∣ ∑ k : Finset.range p, Nat.factorial k * n^(k : ℕ)) ∨ ¬ p ∣ ∑ k : Finset.range p, Nat.factorial k * n^(k : ℕ) := by
        omega

      have h₅₂ : {n ∈ Finset.range p | ¬ p ∣ ∑ k : Finset.range p, Nat.factorial k * n^(k : ℕ)}.card ≥ (p + 1) / 2 := by

        have h₅₃ : p = 3 := by
          have h₅₄ := hp.2.eq_two_or_odd
          have h₅₅ : p ≥ 2 := Nat.Prime.two_le h₁
          have h₅₆ : p % 2 = 1 := by linarith
          have h₅₇ : p = 3 := by

            admit
          linarith
        admit
      linarith
    linarith
  
  linarith
