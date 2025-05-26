theorem h_main (n : ℕ) : n ∈ {n | n = 1 ∨ n ≡ 2 [MOD 4]} ↔
    0 < n ∧
      ∀ (m : ℤ),
        IsRelPrime m (↑n : ℤ) →
          ∃ p,
            ∀ (k : Fin n),
              (↑(↑((p : Fin n → Fin n) ((p : Fin n → Fin n) k)) : ℕ) : ℤ) + 1 ≡ m * ((↑(↑k : ℕ) : ℤ) + 1) [ZMOD
                (↑n : ℤ)] :=
  by
  constructor
  · intro h
    have h₁ : n = 1 ∨ n ≡ 2 [MOD 4] := by sorry
    have h₂ : 0 < n := by sorry
    have h₃ :
      ∀ m : ℤ, IsRelPrime m n → ∃ p : Equiv.Perm (Fin n), ∀ k : Fin n, (p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n] :=
      by
      intro m hm
      have h₄ : n = 1 ∨ n ≡ 2 [MOD 4] := by simpa using h₁
      cases h₄ with
      | inl h₄ =>
        subst_vars
        use 1
        intro k
        fin_cases k <;> simp [Fin.val_zero, Int.ModEq] <;> (try decide) <;> (try ring_nf at hm ⊢) <;>
              (try norm_num at hm ⊢) <;>
            (try omega) <;>
          (try {simp_all [IsRelPrime, Int.gcd_eq_right] <;> omega
            })
      | inr h₄ =>
        have h₅ : n % 4 = 2 := by simpa [Nat.ModEq, Nat.ModEq] using h₄
        have h₆ : 0 < n := by
          by_contra h₇
          have h₈ : n = 0 := by omega
          rw [h₈] at h₅
          norm_num at h₅
        have h₇ : ∃ p : Equiv.Perm (Fin n), ∀ k : Fin n, (p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n] :=
          by
          have h₈ : n % 2 = 0 := by omega
          have h₉ : Even n := by
            rw [even_iff_two_dvd]
            omega
          exfalso
          have h₁₀ : False := by
            have h₁₁ : n % 4 = 2 := by simpa [Nat.ModEq, Nat.ModEq] using h₄
            have h₁₂ : n % 2 = 0 := by omega
            omega
          exact False.elim h₁₀
        exact h₇
    exact ⟨h₂, h₃⟩
  · intro h
    have h₁ : 0 < n := h.1
    have h₂ :
      ∀ m : ℤ, IsRelPrime m n → ∃ p : Equiv.Perm (Fin n), ∀ k : Fin n, (p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n] := h.2
    have h₃ : n = 1 ∨ n ≡ 2 [MOD 4] := by sorry
    have h₃ : ∀ m : ℤ, IsRelPrime m n → ∃ p : Equiv.Perm (Fin n), ∀ k : Fin n, (p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n] := by sorry
have h_main :
  n ∈ ({n : ℕ | n = 1 ∨ n ≡ 2 [MOD 4]} : Set ℕ) ↔
    0 < n ∧
      (∀ m : ℤ, IsRelPrime m n → ∃ p : Equiv.Perm (Fin n), ∀ k : Fin n, (p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n]) :=
  by
  constructor
  · intro h
    have h₁ : n = 1 ∨ n ≡ 2 [MOD 4] := by sorry
    have h₂ : 0 < n := by sorry
    have h₃ :
      ∀ m : ℤ, IsRelPrime m n → ∃ p : Equiv.Perm (Fin n), ∀ k : Fin n, (p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n] :=
      by
      intro m hm
      have h₄ : n = 1 ∨ n ≡ 2 [MOD 4] := by simpa using h₁
      cases h₄ with
      | inl h₄ =>
        subst_vars
        use 1
        intro k
        fin_cases k <;> simp [Fin.val_zero, Int.ModEq] <;> (try decide) <;> (try ring_nf at hm ⊢) <;>
              (try norm_num at hm ⊢) <;>
            (try omega) <;>
          (try {simp_all [IsRelPrime, Int.gcd_eq_right] <;> omega
            })
      | inr h₄ =>
        have h₅ : n % 4 = 2 := by simpa [Nat.ModEq, Nat.ModEq] using h₄
        have h₆ : 0 < n := by
          by_contra h₇
          have h₈ : n = 0 := by omega
          rw [h₈] at h₅
          norm_num at h₅
        have h₇ : ∃ p : Equiv.Perm (Fin n), ∀ k : Fin n, (p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n] :=
          by
          have h₈ : n % 2 = 0 := by omega
          have h₉ : Even n := by
            rw [even_iff_two_dvd]
            omega
          exfalso
          have h₁₀ : False := by
            have h₁₁ : n % 4 = 2 := by simpa [Nat.ModEq, Nat.ModEq] using h₄
            have h₁₂ : n % 2 = 0 := by omega
            omega
          exact False.elim h₁₀
        exact h₇
    exact ⟨h₂, h₃⟩
  · intro h
    have h₁ : 0 < n := h.1
    have h₂ :
      ∀ m : ℤ, IsRelPrime m n → ∃ p : Equiv.Perm (Fin n), ∀ k : Fin n, (p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n] := h.2
    have h₃ : n = 1 ∨ n ≡ 2 [MOD 4] := by
      by_cases h₄ : n = 1
      · exact Or.inl h₄
      ·
        have h₅ : n ≠ 1 := h₄
        have h₆ : n ≡ 2 [MOD 4] := by
          by_contra h₇
          have h₈ : ¬n ≡ 2 [MOD 4] := h₇
          have h₉ : n % 4 ≠ 2 := by
            intro h₉
            have h₁₀ : n ≡ 2 [MOD 4] := by simpa [Nat.ModEq, Nat.ModEq] using h₉
            contradiction
          have h₁₀ : n % 4 = 0 ∨ n % 4 = 1 ∨ n % 4 = 3 :=
            by
            have h₁₁ : n % 4 = 0 ∨ n % 4 = 1 ∨ n % 4 = 2 ∨ n % 4 = 3 := by omega
            rcases h₁₁ with (h₁₁ | h₁₁ | h₁₁ | h₁₁) <;> simp_all (config := { decide := true }) <;> omega
          have h₁₁ :
            ∃ m : ℤ,
              IsRelPrime m n ∧ ∀ p : Equiv.Perm (Fin n), ∃ k : Fin n, ¬(p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n] :=
            by
            use -1
            constructor
            ·
              have h₁₂ : IsRelPrime (-1 : ℤ) n := by simp [IsRelPrime, Int.gcd_eq_right] <;> norm_num <;> omega
              exact h₁₂
            · intro p
              by_contra h₁₂
              have h₁₃ : ∀ k : Fin n, (p (p k)).1 + 1 ≡ (-1 : ℤ) * (k.1 + 1) [ZMOD n] :=
                by
                intro k
                have h₁₄ := h₁₂
                simp_all <;> aesop
              have h₁₄ : n % 4 = 0 ∨ n % 4 = 1 ∨ n % 4 = 3 := h₁₀
              rcases h₁₄ with (h₁₄ | h₁₄ | h₁₄)
              ·
                have h₁₅ : n % 4 = 0 := h₁₄
                have h₁₆ : 4 ∣ n := by omega
                have h₁₇ := h₁₃ (⟨0, by omega⟩ : Fin n)
                have h₁₈ := h₁₃ (⟨1, by omega⟩ : Fin n)
                have h₁₉ := h₁₃ (⟨2, by omega⟩ : Fin n)
                have h₂₀ := h₁₃ (⟨3, by omega⟩ : Fin n)
                simp [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] at h₁₇ h₁₈ h₁₉ h₂₀ <;> (try omega) <;>
                    (try {norm_num at h₁₇ h₁₈ h₁₉ h₂₀ ⊢ <;> omega
                      }) <;>
                  (try {ring_nf at h₁₇ h₁₈ h₁₉ h₂₀ ⊢ <;> norm_num at h₁₇ h₁₈ h₁₉ h₂₀ ⊢ <;> omega
                    })
              ·
                have h₁₅ : n % 4 = 1 := h₁₄
                have h₁₆ : n % 4 = 1 := h₁₅
                have h₁₇ := h₁₃ (⟨0, by omega⟩ : Fin n)
                have h₁₈ := h₁₃ (⟨1, by omega⟩ : Fin n)
                have h₁₉ := h₁₃ (⟨2, by omega⟩ : Fin n)
                have h₂₀ := h₁₃ (⟨3, by omega⟩ : Fin n)
                simp [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] at h₁₇ h₁₈ h₁₉ h₂₀ <;> (try omega) <;>
                    (try {norm_num at h₁₇ h₁₈ h₁₉ h₂₀ ⊢ <;> omega
                      }) <;>
                  (try {ring_nf at h₁₇ h₁₈ h₁₉ h₂₀ ⊢ <;> norm_num at h₁₇ h₁₈ h₁₉ h₂₀ ⊢ <;> omega
                    })
              ·
                have h₁₅ : n % 4 = 3 := h₁₄
                have h₁₆ : n % 4 = 3 := h₁₅
                have h₁₇ := h₁₃ (⟨0, by omega⟩ : Fin n)
                have h₁₈ := h₁₃ (⟨1, by omega⟩ : Fin n)
                have h₁₉ := h₁₃ (⟨2, by omega⟩ : Fin n)
                have h₂₀ := h₁₃ (⟨3, by omega⟩ : Fin n)
                simp [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] at h₁₇ h₁₈ h₁₉ h₂₀ <;> (try omega) <;>
                    (try {norm_num at h₁₇ h₁₈ h₁₉ h₂₀ ⊢ <;> omega
                      }) <;>
                  (try {ring_nf at h₁₇ h₁₈ h₁₉ h₂₀ ⊢ <;> norm_num at h₁₇ h₁₈ h₁₉ h₂₀ ⊢ <;> omega
                    })
          rcases h₁₁ with ⟨m, hm₁, hm₂⟩
          have h₁₂ : ∃ p : Equiv.Perm (Fin n), ∀ k : Fin n, (p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n] := h₂ m hm₁
          rcases h₁₂ with ⟨p, hp⟩
          have h₁₃ : ∀ k : Fin n, (p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n] := hp
          have h₁₄ : ∃ k : Fin n, ¬(p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n] := hm₂ p
          rcases h₁₄ with ⟨k, hk⟩
          have h₁₅ : (p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n] := h₁₃ k
          contradiction
        exact Or.inr h₆
    exact h₃