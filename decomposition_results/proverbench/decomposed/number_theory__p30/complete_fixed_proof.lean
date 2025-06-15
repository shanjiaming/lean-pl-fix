theorem solutions_of_quadratic_congruence :
  (∀ x : ℤ, x^2 ≡ a [ZMOD p] → (x ≡ a^k [ZMOD p] ∨ x ≡ -a^k [ZMOD p])) ∧
  ((a^k)^2 ≡ a [ZMOD p]) := by
  have h_main : (a^k)^2 ≡ a [ZMOD p] := by
    have h₁ : ∃ (x : ℤ), x ^ 2 ≡ a [ZMOD p] := ha
    obtain ⟨b, hb⟩ := h₁
    have h₂ : b ^ 2 ≡ a [ZMOD p] := hb
    have h₃ : (a ^ k : ℤ) ≡ (b ^ 2) ^ k [ZMOD p] := by
      admit
    have h₄ : (a ^ k : ℤ) ^ 2 ≡ (b ^ 2 : ℤ) ^ (2 * k) [ZMOD p] := by
      admit
    have h₅ : (p : ℕ) = 4 * k - 1 := by admit
    have h₆ : (4 * k : ℕ) = (p : ℕ) + 1 := by
      have h₇ : (p : ℕ) = 4 * k - 1 := by admit
      have h₈ : (4 * k : ℕ) ≥ 1 := by
        have h₉ : Nat.Prime p := hp_prime
        have h₁₀ : (p : ℕ) ≥ 2 := Nat.Prime.two_le h₉
        admit
      admit
    have h₇ : (b : ℤ) ^ (p : ℕ) ≡ (b : ℤ) [ZMOD p] := by
      
      haveI : Fact p.Prime := ⟨hp_prime⟩
      have h₈ : (b : ZMod p) ^ p = (b : ZMod p) := by
        admit
      have h₉ : (b : ℤ) ^ (p : ℕ) ≡ (b : ℤ) [ZMOD p] := by
        admit
      admit
    have h₈ : (b : ℤ) ^ (p + 1 : ℕ) ≡ (b : ℤ) ^ 2 [ZMOD p] := by
      admit
    have h₉ : (b : ℤ) ^ (2 * k : ℕ) ≡ (b : ℤ) ^ (2 * k : ℕ) [ZMOD p] := by admit
    have h₁₀ : (b : ℤ) ^ (4 * k : ℕ) ≡ (b : ℤ) ^ 2 [ZMOD p] := by
      have h₁₁ : (4 * k : ℕ) = (p : ℕ) + 1 := by admit
      admit
    have h₁₁ : (b : ℤ) ^ (2 * k : ℕ) ≡ (b : ℤ) ^ (2 * k : ℕ) [ZMOD p] := by admit
    have h₁₂ : ((a ^ k : ℤ) ^ 2 : ℤ) ≡ (a : ℤ) [ZMOD p] := by
      admit
    admit
  
  have h_main₂ : ∀ (y : ℤ), y^2 ≡ a [ZMOD p] → (y ≡ a^k [ZMOD p] ∨ y ≡ -a^k [ZMOD p]) := by
    intro y hy
    have h₁ : y ^ 2 ≡ a [ZMOD p] := hy
    have h₂ : (a ^ k : ℤ) ^ 2 ≡ a [ZMOD p] := h_main
    have h₃ : (y : ℤ) ^ 2 ≡ (a ^ k : ℤ) ^ 2 [ZMOD p] := by
      admit
    have h₄ : y ≡ a ^ k [ZMOD p] ∨ y ≡ -a ^ k [ZMOD p] := by
      have h₅ : (y : ℤ) ^ 2 ≡ (a ^ k : ℤ) ^ 2 [ZMOD p] := h₃
      have h₆ : (y - a ^ k : ℤ) * (y + a ^ k : ℤ) ≡ 0 [ZMOD p] := by
        admit
      have h₇ : (p : ℤ) ∣ (y - a ^ k : ℤ) * (y + a ^ k : ℤ) := by
        admit
      have h₈ : (p : ℤ) ∣ (y - a ^ k : ℤ) ∨ (p : ℤ) ∣ (y + a ^ k : ℤ) := by
        have h₉ : (Nat.Prime p) := hp_prime
        have h₁₀ : (p : ℤ) ∣ (y - a ^ k : ℤ) * (y + a ^ k : ℤ) := h₇
        have h₁₁ : (p : ℤ) ∣ (y - a ^ k : ℤ) ∨ (p : ℤ) ∣ (y + a ^ k : ℤ) := by
          
          have h₁₂ : (p : ℤ) ∣ (y - a ^ k : ℤ) * (y + a ^ k : ℤ) := h₁₀
          admit
        admit
      admit
    admit
  admit