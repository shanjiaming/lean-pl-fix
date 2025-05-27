theorem putnam_1999_b6
  (S : Finset ℤ)
  (hSgt : ∀ s, s ∈ S → s > 1)
  (hSgcd : ∀ n, ∃ s ∈ S, Int.gcd s n = 1 ∨ Int.gcd s n = s) :
  ∃ᵉ (s ∈ S) (t ∈ S), Prime (Int.gcd s t) := by
  have h_existence : ∃ (s : ℤ), s ∈ S := by
    have h₁ := hSgcd 0
    obtain ⟨s, hs, h₂⟩ := h₁
    exact ⟨s, hs⟩
  
  have h_final : ∃ᵉ (s ∈ S) (t ∈ S), Prime (Int.gcd s t) := by
    by_contra h
    -- We will derive a contradiction by constructing an integer `n` such that no `s ∈ S` satisfies `gcd(s, n) = 1` or `gcd(s, n) = s`.
    have h₁ : ∀ (s t : ℤ), s ∈ S → t ∈ S → ¬Prime (Int.gcd s t) := by
      intro s t hs ht
      by_contra h₂
      -- If there exists a pair `(s, t)` in `S × S` such that `gcd(s, t)` is prime, then the theorem's conclusion is satisfied.
      exact h ⟨s, hs, t, ht, h₂⟩
    -- We use the fact that all elements in `S` are greater than 1 to find a suitable `n`.
    have h₂ : ∀ (s : ℤ), s ∈ S → s > 1 := by
      intro s hs
      exact hSgt s hs
    -- Construct `n` as the product of all primes dividing some element of `S`.
    have h₃ : ∃ (n : ℤ), ∀ (s : ℤ), s ∈ S → Int.gcd s n ≠ 1 ∧ Int.gcd s n ≠ s := by
      classical
      -- Use the fact that `S` is finite to construct `n`.
      have h₄ : ∃ (n : ℤ), ∀ (s : ℤ), s ∈ S → Int.gcd s n ≠ 1 ∧ Int.gcd s n ≠ s := by
        -- Choose `n` to be the product of all elements in `S`.
        use 0
        intro s hs
        have h₅ : s > 1 := h₂ s hs
        have h₆ : Int.gcd s 0 = s.natAbs := by
          simp [Int.gcd_eq_zero_iff, Int.natAbs_of_nonneg (show (0 : ℤ) ≤ s.natAbs by positivity)]
        have h₇ : (Int.gcd s 0 : ℤ) = s.natAbs := by
          rw [h₆]
          <;> simp [Int.ofNat_eq_coe]
        have h₈ : (Int.gcd s 0 : ℤ) ≠ 1 := by
          intro h₈
          have h₉ : (s.natAbs : ℤ) = 1 := by
            linarith
          have h₁₀ : s.natAbs = 1 := by
            exact Int.ofNat_inj.mp (by linarith)
          have h₁₁ : s = 1 ∨ s = -1 := by
            have h₁₂ : s.natAbs = 1 := h₁₀
            have h₁₃ : s = 1 ∨ s = -1 := by
              have h₁₄ : s.natAbs = 1 := h₁₀
              have h₁₅ : s = 1 ∨ s = -1 := by
                have h₁₆ : s.natAbs = 1 := h₁₀
                have h₁₇ : s = 1 ∨ s = -1 := by
                  rw [Int.natAbs_eq_iff] at h₁₆
                  tauto
                exact h₁₇
              exact h₁₅
            exact h₁₃
          cases h₁₁ with
          | inl h₁₁ =>
            have h₁₂ : s = 1 := h₁₁
            have h₁₃ : s > 1 := h₂ s hs
            linarith
          | inr h₁₁ =>
            have h₁₂ : s = -1 := h₁₁
            have h₁₃ : s > 1 := h₂ s hs
            linarith
        have h₉ : (Int.gcd s 0 : ℤ) ≠ s := by
          intro h₉
          have h₁₀ : (s.natAbs : ℤ) = s := by
            linarith
          have h₁₁ : s ≥ 0 := by
            by_contra h₁₁
            have h₁₂ : s < 0 := by linarith
            have h₁₃ : (s.natAbs : ℤ) = -s := by
              simp [Int.natAbs_of_nonpos, h₁₂.le]
              <;> omega
            have h₁₄ : (-s : ℤ) = s := by
              linarith
            have h₁₅ : s = 0 := by linarith
            linarith
          have h₁₂ : s.natAbs = s := by
            simp [Int.natAbs_of_nonneg, h₁₁]
          have h₁₃ : s > 1 := h₂ s hs
          have h₁₄ : s.natAbs > 1 := by
            have h₁₅ : s.natAbs > 1 := by
              have h₁₆ : s > 1 := h₂ s hs
              have h₁₇ : s.natAbs > 1 := by
                by_contra h₁₇
                have h₁₈ : s.natAbs ≤ 1 := by linarith
                have h₁₉ : s ≤ 1 := by
                  by_contra h₁₉
                  have h₂₀ : s > 1 := h₂ s hs
                  have h₂₁ : s.natAbs > 1 := by
                    have h₂₂ : s > 1 := h₂ s hs
                    have h₂₃ : s.natAbs > 1 := by
                      omega
                    exact h₂₃
                  linarith
                have h₂₀ : s > 1 := h₂ s hs
                linarith
              exact h₁₇
            exact h₁₅
          have h₁₅ : s.natAbs > 1 := h₁₄
          have h₁₆ : (s.natAbs : ℤ) > 1 := by
            exact_mod_cast h₁₅
          have h₁₇ : (s.natAbs : ℤ) = s := by
            linarith
          linarith
        exact ⟨by simpa [h₆] using h₈, by simpa [h₆] using h₉⟩
      exact h₄
    obtain ⟨n, hn⟩ := h₃
    -- Find `s ∈ S` such that either `gcd(s, n) = 1` or `gcd(s, n) = s`.
    have h₄ := hSgcd n
    obtain ⟨s, hs, h₅⟩ := h₄
    -- Check which case of `h₅` holds.
    cases h₅ with
    | inl h₅ =>
      -- Case `gcd(s, n) = 1`.
      have h₆ := hn s hs
      have h₇ : Int.gcd s n ≠ 1 := h₆.1
      have h₈ : Int.gcd s n ≠ s := h₆.2
      -- Derive a contradiction.
      have h₉ : Int.gcd s n = 1 := h₅
      have h₁₀ : Int.gcd s n ≠ 1 := h₇
      contradiction
    | inr h₅ =>
      -- Case `gcd(s, n) = s`.
      have h₆ := hn s hs
      have h₇ : Int.gcd s n ≠ 1 := h₆.1
      have h₈ : Int.gcd s n ≠ s := h₆.2
      -- Derive a contradiction.
      have h₉ : Int.gcd s n = s := h₅
      have h₁₀ : Int.gcd s n ≠ s := h₈
      contradiction
  
  exact h_final