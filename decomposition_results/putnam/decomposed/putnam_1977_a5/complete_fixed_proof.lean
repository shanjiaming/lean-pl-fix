theorem putnam_1977_a5
(p m n : ℕ)
(hp : Nat.Prime p)
(hmgen : m ≥ n)
: (choose (p * m) (p * n) ≡ choose m n [MOD p]) := by
  have h₁ : choose (p * m) (p * n) ≡ choose m n [MOD p] := by
    have h₂ : p > 0 := Nat.Prime.pos hp
    have h₃ : choose (p * m) (p * n) ≡ choose m n [MOD p] := by
      have h₄ : choose (0 + p * m) (0 + p * n) ≡ choose 0 0 * choose m n [MOD p] := by
        
        have h₅ : choose (0 + p * m) (0 + p * n) ≡ choose 0 0 * choose m n [MOD p] := by
          apply Nat.ModEq.symm
          apply Nat.ModEq.symm
          
          have h₆ : choose (0 + p * m) (0 + p * n) % p = (choose 0 0 * choose m n) % p := by
            have h₇ : p ≠ 0 := by admit
            have h₈ : choose (0 + p * m) (0 + p * n) % p = (choose 0 0 * choose m n) % p := by
              
              admit
            admit
          admit
        admit
      have h₅ : choose 0 0 = 1 := by admit
      have h₆ : choose (0 + p * m) (0 + p * n) = choose (p * m) (p * n) := by admit
      have h₇ : choose 0 0 * choose m n = choose m n := by admit
      admit
    admit
  admit