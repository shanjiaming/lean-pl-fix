theorem putnam_1978_a1 (S T : Set ℤ) (hS : S = {k | ∃ j : ℤ, 0 ≤ j ∧ j ≤ 33 ∧ k = 3 * j + 1}) (hT : T ⊆ S ∧ T.ncard = 20) :
  (∃ m ∈ T, ∃ n ∈ T, m ≠ n ∧ m + n = 104):=
  by
  have h_main : ∃ m ∈ T, ∃ n ∈ T, m ≠ n ∧ m + n = 104:=
    by
    --  by_contra! h
    have h₁ : T ⊆ S := hT.1
    have h₂ : T.ncard = 20 := hT.2
    have h₃ : ∀ m ∈ T, ∀ n ∈ T, m ≠ n → m + n ≠ 104:=
      by
      --  intro m hm n hn hne
      have h₄ := h m hm n hn
      --  tauto
      hole
    have h₄ :
      T ⊆
        ({ 1, 52 } ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({3 * j + 1} : Set ℤ)) ∪
          (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ))) := by sorry
    have h₅ : T.ncard ≤ 18:=
      by
      have h₅₁ :
        T ⊆
          ({ 1, 52 } ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({3 * j + 1} : Set ℤ)) ∪
            (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ))) :=
        h₄
      have h₅₂ :
        T.ncard ≤
          (({ 1, 52 } ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({3 * j + 1} : Set ℤ)) ∪
                (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ)) :
              Set ℤ)).ncard := by sorry
      have h₅₃ :
        (({ 1, 52 } ∪ (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({3 * j + 1} : Set ℤ)) ∪
                (⋃ (j : ℤ) (_ : 1 ≤ j ∧ j ≤ 16), ({103 - 3 * j} : Set ℤ)) :
              Set ℤ)).ncard ≤
          18 := by sorry
      have h₅₄ : T.ncard ≤ 18:= by -- linarith
        linarith
      --  exact h₅₄
      linarith
    have h₆ : T.ncard = 20 := h₂
    --  linarith
    linarith
  --  exact h_main
  simpa