theorem putnam_2021_b4 (F : ℕ → ℕ) (hF : ∀ n, F (n + 2) = F (n + 1) + F n) (F01 : F 0 = 0 ∧ F 1 = 1) :
  ∀ m, m > 2 → (∃ p, (∏ k : Set.Icc 1 (F m - 1), (k.1 ^ k.1)) % F m = F p):=
  by
  have h₁ : F 2 = 1:= by
    have h₂ := hF 0
    have h₃ := hF 1
    have h₄ := hF 2
    have h₅ := hF 3
    --  --  norm_num [F01] at h₂ h₃ h₄ h₅ ⊢ <;> omega
    linarith
  have h₂ : ∀ n, n ≥ 1 → F n ≥ 1:= by
    --  intro n hn
    --  induction' hn with n hn IH
    --  · norm_num [F01]
    ·
    --    cases n with
    --    | zero => norm_num [F01] at hn ⊢ <;> simp_all [hF, F01]
    --    | succ n =>
    --      cases n with
    --      | zero => norm_num [F01, hF] at hn ⊢ <;> simp_all [hF, F01]
    --      | succ n =>
    --        have h₃ := hF n
    --        have h₄ := hF (n + 1)
    --        have h₅ := hF (n + 2)
    --        simp_all [Nat.succ_eq_add_one, F01, hF] <;> omega
    hole
  have h₃ : ∀ m, m > 2 → F m ≥ 2:= by
    --  intro m hm
    have h₄ : ∀ n, n ≥ 3 → F n ≥ 2:= by
      --  intro n hn
      --  induction' hn with n hn IH
      --  · norm_num [hF, F01, h₁]
      ·
      --    cases n with
      --    | zero => contradiction
      --    | succ n =>
      --      cases n with
      --      | zero => contradiction
      --      | succ n =>
      --        cases n with
      --        | zero => contradiction
      --        | succ n => simp_all [hF, Nat.succ_eq_add_one, Nat.add_assoc] <;> (try omega) <;> (try nlinarith)
      hole
    have h₅ : m ≥ 3:= by -- omega
      linarith
    have h₆ : F m ≥ 2 := h₄ m h₅
    --  exact h₆
    hole
  have h₄ : ∀ (m : ℕ), m > 2 → (∃ p, (∏ k : Set.Icc 1 (F m - 1), (k.1 ^ k.1)) % F m = F p):=
    by
    --  intro m hm
    have h₅ : m ≥ 3:= by -- omega
      linarith
    have h₆ : F m ≥ 2 := h₃ m hm
    have h₇ : F m - 1 ≥ 1:= by
      have h₇₁ : F m ≥ 2 := h₆
      --  omega
      omega
    have h₈ : m = 3 ∨ m = 4 ∨ m = 5 ∨ m = 6 ∨ m = 7 ∨ m = 8 ∨ m = 9 ∨ m ≥ 10:= by -- omega
      omega
    --  rcases h₈ with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | h₈)
    --  · use 1
      have h₉ : F 3 = 2:= by
        have h₉₁ := hF 1
        have h₉₂ := hF 0
        --  --  norm_num [F01, h₁] at h₉₁ h₉₂ ⊢ <;> omega
        linarith
      have h₁₀ : (∏ k : Set.Icc 1 (F 3 - 1), (k.1 ^ k.1)) % F 3 = F 1:= by -- -- rw [h₉] <;> rfl
        hole
    --    exact h₁₀
    --  · use 1
      have h₉ : F 4 = 3 := by sorry
      have h₁₀ : (∏ k : Set.Icc 1 (F 4 - 1), (k.1 ^ k.1)) % F 4 = F 1 := by sorry
    --    exact h₁₀
    --  · use 4
      have h₉ : F 5 = 5 := by sorry
      have h₁₀ : (∏ k : Set.Icc 1 (F 5 - 1), (k.1 ^ k.1)) % F 5 = F 4 := by sorry
    --    exact h₁₀
    --  · use 0
      have h₉ : F 6 = 8 := by sorry
      have h₁₀ : (∏ k : Set.Icc 1 (F 6 - 1), (k.1 ^ k.1)) % F 6 = F 0 := by sorry
    --    exact h₁₀
    --  · use 4
      have h₉ : F 7 = 13 := by sorry
      have h₁₀ : (∏ k : Set.Icc 1 (F 7 - 1), (k.1 ^ k.1)) % F 7 = F 4 := by sorry
    --    exact h₁₀
    --  · use 0
      have h₉ : F 8 = 21 := by sorry
      have h₁₀ : (∏ k : Set.Icc 1 (F 8 - 1), (k.1 ^ k.1)) % F 8 = F 0 := by sorry
    --    exact h₁₀
    --  · use 0
      have h₉ : F 9 = 34 := by sorry
      have h₁₀ : (∏ k : Set.Icc 1 (F 9 - 1), (k.1 ^ k.1)) % F 9 = F 0 := by sorry
    --    exact h₁₀
    --  · use 0
      have h₉ : F m ≥ 55 := by sorry
      have h₁₀ : (∏ k : Set.Icc 1 (F m - 1), (k.1 ^ k.1)) % F m = F 0 := by sorry
    --    exact h₁₀
    hole
  --  intro m hm
  have h₅ := h₄ m hm
  --  exact h₅
  hole