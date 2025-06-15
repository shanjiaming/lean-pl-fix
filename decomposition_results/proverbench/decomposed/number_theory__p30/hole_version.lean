macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem solutions_of_quadratic_congruence :
  (∀ x : ℤ, x^2 ≡ a [ZMOD p] → (x ≡ a^k [ZMOD p] ∨ x ≡ -a^k [ZMOD p])) ∧
  ((a^k)^2 ≡ a [ZMOD p]) := by
  have h_main : (a^k)^2 ≡ a [ZMOD p] := by
    have h₁ : ∃ (x : ℤ), x ^ 2 ≡ a [ZMOD p] := ha
    obtain ⟨b, hb⟩ := h₁
    have h₂ : b ^ 2 ≡ a [ZMOD p] := hb
    have h₃ : (a ^ k : ℤ) ≡ (b ^ 2) ^ k [ZMOD p] := by
      hole_3
    have h₄ : (a ^ k : ℤ) ^ 2 ≡ (b ^ 2 : ℤ) ^ (2 * k) [ZMOD p] := by
      hole_6
    have h₅ : (p : ℕ) = 4 * k - 1 := by hole_8
    have h₆ : (4 * k : ℕ) = (p : ℕ) + 1 := by
      have h₇ : (p : ℕ) = 4 * k - 1 := by hole_10
      have h₈ : (4 * k : ℕ) ≥ 1 := by
        have h₉ : Nat.Prime p := hp_prime
        have h₁₀ : (p : ℕ) ≥ 2 := Nat.Prime.two_le h₉
        hole_11
      hole_9
    have h₇ : (b : ℤ) ^ (p : ℕ) ≡ (b : ℤ) [ZMOD p] := by
      
      haveI : Fact p.Prime := ⟨hp_prime⟩
      have h₈ : (b : ZMod p) ^ p = (b : ZMod p) := by
        hole_13
      have h₉ : (b : ℤ) ^ (p : ℕ) ≡ (b : ℤ) [ZMOD p] := by
        hole_14
      hole_12
    have h₈ : (b : ℤ) ^ (p + 1 : ℕ) ≡ (b : ℤ) ^ 2 [ZMOD p] := by
      hole_15
    have h₉ : (b : ℤ) ^ (2 * k : ℕ) ≡ (b : ℤ) ^ (2 * k : ℕ) [ZMOD p] := by hole_17
    have h₁₀ : (b : ℤ) ^ (4 * k : ℕ) ≡ (b : ℤ) ^ 2 [ZMOD p] := by
      have h₁₁ : (4 * k : ℕ) = (p : ℕ) + 1 := by hole_19
      hole_18
    have h₁₁ : (b : ℤ) ^ (2 * k : ℕ) ≡ (b : ℤ) ^ (2 * k : ℕ) [ZMOD p] := by hole_20
    have h₁₂ : ((a ^ k : ℤ) ^ 2 : ℤ) ≡ (a : ℤ) [ZMOD p] := by
      hole_21
    hole_2
  
  have h_main₂ : ∀ (y : ℤ), y^2 ≡ a [ZMOD p] → (y ≡ a^k [ZMOD p] ∨ y ≡ -a^k [ZMOD p]) := by
    intro y hy
    have h₁ : y ^ 2 ≡ a [ZMOD p] := hy
    have h₂ : (a ^ k : ℤ) ^ 2 ≡ a [ZMOD p] := h_main
    have h₃ : (y : ℤ) ^ 2 ≡ (a ^ k : ℤ) ^ 2 [ZMOD p] := by
      hole_24
    have h₄ : y ≡ a ^ k [ZMOD p] ∨ y ≡ -a ^ k [ZMOD p] := by
      have h₅ : (y : ℤ) ^ 2 ≡ (a ^ k : ℤ) ^ 2 [ZMOD p] := h₃
      have h₆ : (y - a ^ k : ℤ) * (y + a ^ k : ℤ) ≡ 0 [ZMOD p] := by
        hole_26
      have h₇ : (p : ℤ) ∣ (y - a ^ k : ℤ) * (y + a ^ k : ℤ) := by
        hole_27
      have h₈ : (p : ℤ) ∣ (y - a ^ k : ℤ) ∨ (p : ℤ) ∣ (y + a ^ k : ℤ) := by
        have h₉ : (Nat.Prime p) := hp_prime
        have h₁₀ : (p : ℤ) ∣ (y - a ^ k : ℤ) * (y + a ^ k : ℤ) := h₇
        have h₁₁ : (p : ℤ) ∣ (y - a ^ k : ℤ) ∨ (p : ℤ) ∣ (y + a ^ k : ℤ) := by
          
          have h₁₂ : (p : ℤ) ∣ (y - a ^ k : ℤ) * (y + a ^ k : ℤ) := h₁₀
          hole_29
        hole_28
      hole_25
    hole_23
  hole_1