theorem h_main₂ (h_main : (sorry ^ sorry) ^ 2 ≡ sorry [ZMOD sorry]) : ∀ (y : ℤ), y ^ 2 ≡ sorry [ZMOD sorry] → y ≡ sorry ^ sorry [ZMOD sorry] ∨ y ≡ -sorry ^ sorry [ZMOD sorry] :=
  by
  --  intro y hy
  have h₁ : y ^ 2 ≡ a [ZMOD p] := hy
  have h₂ : (a ^ k : ℤ) ^ 2 ≡ a [ZMOD p] := h_main
  have h₃ : (y : ℤ) ^ 2 ≡ (a ^ k : ℤ) ^ 2 [ZMOD p] := by sorry
  have h₄ : y ≡ a ^ k [ZMOD p] ∨ y ≡ -a ^ k [ZMOD p] := by sorry
  --  exact h₄
  hole