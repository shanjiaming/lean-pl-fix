theorem aime_2025ii_p2 (S : Finset ℕ)
    (h₀ : ∀ (n : ℕ), n ∈ S ↔ (n + 2) ∣ 3 * (n + 3) * (n ^ 2 + 9)) :
    (∑ n in S, n) = 49 := by
  have h₁ : S = {1, 11, 37} := by
    apply Finset.ext
    intro n
    simp only [Finset.mem_insert, Finset.mem_singleton, h₀]
    constructor
    · -- Prove the forward direction: if n ∈ S, then n ∈ {1, 11, 37}
      intro h
      have h₂ : (n + 2) ∣ 3 * (n + 3) * (n ^ 2 + 9) := by simpa using h
      have h₃ : n = 1 ∨ n = 11 ∨ n = 37 := by
        -- Use the fact that n + 2 divides 3 * (n + 3) * (n ^ 2 + 9) to deduce that n must be 1, 11, or 37
        have h₄ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₂
        have h₅ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₄
        have h₆ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₅
        -- Use the fact that n + 2 divides 3 * (n + 3) * (n ^ 2 + 9) to deduce that n must be 1, 11, or 37
        have h₇ : n + 2 ∣ 39 := by
          -- Prove that n + 2 divides 39
          have h₈ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₆
          have h₉ : n + 2 ∣ 3 * (n ^ 2 + 9 + 4 * (n + 3)) := by
            -- Prove that n + 2 divides 3 * (n ^ 2 + 9 + 4 * (n + 3))
            have h₁₀ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₈
            have h₁₁ : n + 2 ∣ 3 * (n ^ 2 + 9 + 4 * (n + 3)) := by
              -- Use the fact that n + 2 divides 3 * (n + 3) * (n ^ 2 + 9) to deduce that n + 2 divides 3 * (n ^ 2 + 9 + 4 * (n + 3))
              have h₁₂ : 3 * (n ^ 2 + 9 + 4 * (n + 3)) = 3 * (n + 3) * (n ^ 2 + 9) - (n + 2) * (3 * (n ^ 2 + 9 + 4 * (n + 3)) - 3 * (n + 3) * (n ^ 2 + 9)) := by
                ring
                <;> omega
              rw [h₁₂]
              exact dvd_sub' h₁₀ (dvd_mul_of_dvd_left (by aesop) _)
            exact h₁₁
          have h₁₀ : n + 2 ∣ 3 * (n ^ 2 + 9 + 4 * (n + 3)) := h₉
          have h₁₁ : n + 2 ∣ 39 := by
            -- Prove that n + 2 divides 39 by checking the possible values of n + 2
            have h₁₂ : 3 * (n ^ 2 + 9 + 4 * (n + 3)) = 3 * (n + 2) * (n + 2) + 39 := by
              ring
              <;> omega
            rw [h₁₂] at h₁₀
            have h₁₃ : n + 2 ∣ 3 * (n + 2) * (n + 2) + 39 := h₁₀
            have h₁₄ : n + 2 ∣ 39 := by
              -- Prove that n + 2 divides 39
              simpa [Nat.dvd_add_right, Nat.dvd_mul_right, Nat.dvd_mul_left] using h₁₃
            exact h₁₄
          exact h₁₁
        have h₈ : n + 2 ∣ 39 := h₇
        have h₉ : n + 2 ≤ 39 := Nat.le_of_dvd (by norm_num) h₈
        have h₁₀ : n ≤ 37 := by omega
        interval_cases n <;> norm_num at h₈ ⊢ <;>
          (try omega) <;> (try norm_num at h₂ ⊢) <;> (try omega)
        <;>
          (try
            {
              norm_num at h₂ ⊢
              <;>
                (try omega)
              <;>
                (try
                  {
                    omega
                  })
            })
        <;>
          (try
            {
              omega
            })
      aesop
    · -- Prove the reverse direction: if n ∈ {1, 11, 37}, then n ∈ S
      intro h
      have h₂ : n = 1 ∨ n = 11 ∨ n = 37 := by simpa using h
      -- Check each case to see if n + 2 divides 3 * (n + 3) * (n ^ 2 + 9)
      rcases h₂ with (rfl | rfl | rfl)
      · -- Case n = 1
        norm_num
      · -- Case n = 11
        norm_num
      · -- Case n = 37
        norm_num

  have h₂ : (∑ n in S, n) = 49 := by
    rw [h₁]
    norm_num
    <;> rfl
  
  exact h₂