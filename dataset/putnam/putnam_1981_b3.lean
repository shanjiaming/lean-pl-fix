theorem putnam_1981_b3
    (P : ℕ → Prop)
    (hP : ∀ n, P n ↔
      ∀ p : ℕ, (Nat.Prime p ∧ p ∣ n^2 + 3) →
        ∃ k : ℕ, (p : ℤ) ∣ (k : ℤ)^2 + 3 ∧ k^2 < n) :
    ∀ n : ℕ, ∃ m : ℕ, (m : ℤ) > n ∧ P m :=
  by
  have h_main : ∀ n : ℕ, ∃ m : ℕ, (m : ℤ) > n ∧ P m := by
    intro n
    have h₁ : ∃ m : ℕ, (m : ℤ) > n ∧ P m := by
      -- We choose m = 3 * (n + 1). We ensure m > n and prove P(m).
      use 3 * (n + 1)
      constructor
      · -- Prove that (m : ℤ) > n
        norm_num [mul_add, mul_one, add_assoc]
        <;> nlinarith
      · -- Prove that P(m) holds
        rw [hP]
        intro p hp
        have h₂ : p ∣ (3 * (n + 1)) ^ 2 + 3 := by simpa [sq, mul_add, add_mul, mul_one, mul_assoc] using hp.2
        have h₃ : Nat.Prime p := hp.1
        -- We consider different cases for p
        have h₄ : p = 2 ∨ p = 3 ∨ p ≥ 5 := by
          have h₅ := h₃.two_le
          have h₆ := h₃.eq_two_or_odd
          cases h₆ with
          | inl h₆ =>
            exact Or.inl h₆
          | inr h₆ =>
            have h₇ : p ≠ 0 := by linarith
            have h₈ : p ≠ 1 := by
              intro h
              have h₉ := h₃.ne_one
              contradiction
            have h₉ : p ≥ 3 := by
              by_contra h
              interval_cases p <;> contradiction
            have h₁₀ : p = 3 ∨ p ≥ 5 := by
              omega
            cases h₁₀ with
            | inl h₁₀ =>
              exact Or.inr (Or.inl h₁₀)
            | inr h₁₀ =>
              exact Or.inr (Or.inr h₁₀)
        -- Case analysis on p
        rcases h₄ with (rfl | rfl | h₄)
        · -- Case p = 2
          use 1
          constructor
          · -- Prove that (2 : ℤ) ∣ (1 : ℤ)^2 + 3
            norm_num
          · -- Prove that 1^2 < 3 * (n + 1)
            have h₅ : 1 ^ 2 < 3 * (n + 1) := by
              nlinarith [Nat.zero_le n]
            exact h₅
        · -- Case p = 3
          use 0
          constructor
          · -- Prove that (3 : ℤ) ∣ (0 : ℤ)^2 + 3
            norm_num
          · -- Prove that 0^2 < 3 * (n + 1)
            have h₅ : 0 ^ 2 < 3 * (n + 1) := by
              nlinarith [Nat.zero_le n]
            exact h₅
        · -- Case p ≥ 5
          have h₅ : p ≥ 5 := h₄
          have h₆ : p ∣ (3 * (n + 1)) ^ 2 + 3 := h₂
          have h₇ : ∃ k : ℕ, (p : ℤ) ∣ (k : ℤ) ^ 2 + 3 ∧ k ^ 2 < 3 * (n + 1) := by
            -- We use the fact that p ≥ 5 and divide (3 * (n + 1))^2 + 3 to find k
            use 0
            constructor
            · -- Prove that (p : ℤ) ∣ (0 : ℤ)^2 + 3
              norm_num at h₆ ⊢
              <;>
              (try omega) <;>
              (try
                {
                  norm_num at h₅ ⊢
                  <;>
                  omega
                }) <;>
              (try
                {
                  norm_num [Int.emod_eq_emod_iff_emod_sub_eq_zero] at h₆ ⊢ <;>
                  omega
                })
              <;>
              (try
                {
                  omega
                })
            · -- Prove that 0^2 < 3 * (n + 1)
              have h₈ : 0 ^ 2 < 3 * (n + 1) := by
                nlinarith [Nat.zero_le n]
              exact h₈
          obtain ⟨k, h₈, h₉⟩ := h₇
          exact ⟨k, h₈, by nlinarith⟩
    exact h₁
  exact h_main