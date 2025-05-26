theorem solutions_of_quadratic_congruence  : (∀ (x : ℤ), x ^ 2 ≡ sorry [ZMOD sorry] → x ≡ sorry ^ sorry [ZMOD sorry] ∨ x ≡ -sorry ^ sorry [ZMOD sorry]) ∧
    (sorry ^ sorry) ^ 2 ≡ sorry [ZMOD sorry] :=
  by
  have h_main : (a ^ k) ^ 2 ≡ a [ZMOD p] := by sorry
  have h_main₂ : ∀ (y : ℤ), y ^ 2 ≡ a [ZMOD p] → (y ≡ a ^ k [ZMOD p] ∨ y ≡ -a ^ k [ZMOD p]) := by sorry
  exact ⟨h_main₂, h_main⟩