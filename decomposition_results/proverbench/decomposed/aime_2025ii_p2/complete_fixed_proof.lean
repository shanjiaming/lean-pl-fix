theorem aime_2025ii_p2 (S : Finset ℕ) (h₀ : ∀ (n : ℕ), n ∈ S ↔ (n + 2) ∣ 3 * (n + 3) * (n ^ 2 + 9)) : (∑ n in S, n) = 49:=
  by
  have h₁ : S = { 1, 11, 37 }:= by
    --  apply Finset.ext
    --  intro n
    --  simp only [Finset.mem_insert, Finset.mem_singleton, h₀]
    --  constructor
    --  · intro h
      have h₂ : (n + 2) ∣ 3 * (n + 3) * (n ^ 2 + 9):= by -- simpa using h
        omega
      have h₃ : n = 1 ∨ n = 11 ∨ n = 37:=
        by
        have h₄ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₂
        have h₅ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₄
        have h₆ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₅
        have h₇ : n + 2 ∣ 39:= by
          have h₈ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₆
          have h₉ : n + 2 ∣ 3 * (n ^ 2 + 9 + 4 * (n + 3)):=
            by
            have h₁₀ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₈
            have h₁₁ : n + 2 ∣ 3 * (n ^ 2 + 9 + 4 * (n + 3)):=
              by
              have h₁₂ :
                3 * (n ^ 2 + 9 + 4 * (n + 3)) =
                  3 * (n + 3) * (n ^ 2 + 9) - (n + 2) * (3 * (n ^ 2 + 9 + 4 * (n + 3)) - 3 * (n + 3) * (n ^ 2 + 9)) := by sorry
              --  rw [h₁₂]
              --  exact dvd_sub' h₁₀ (dvd_mul_of_dvd_left (by aesop) _)
              hole
            --  exact h₁₁
            omega
          have h₁₀ : n + 2 ∣ 3 * (n ^ 2 + 9 + 4 * (n + 3)) := h₉
          have h₁₁ : n + 2 ∣ 39:=
            by
            have h₁₂ : 3 * (n ^ 2 + 9 + 4 * (n + 3)) = 3 * (n + 2) * (n + 2) + 39:= by -- -- ring <;> omega
              hole
            --  rw [h₁₂] at h₁₀
            have h₁₃ : n + 2 ∣ 3 * (n + 2) * (n + 2) + 39 := h₁₀
            have h₁₄ : n + 2 ∣ 39:= by -- simpa [Nat.dvd_add_right, Nat.dvd_mul_right, Nat.dvd_mul_left] using h₁₃
              linarith
            --  exact h₁₄
            hole
          --  exact h₁₁
          omega
        have h₈ : n + 2 ∣ 39 := h₇
        have h₉ : n + 2 ≤ 39 := Nat.le_of_dvd (by norm_num) h₈
        have h₁₀ : n ≤ 37:= by -- omega
          linarith
        --  --  interval_cases n <;> norm_num at h₈ ⊢ <;> (try omega) <;> (try norm_num at h₂ ⊢) <;> (try omega) <;>
            (try
                {norm_num at h₂ ⊢ <;> (try omega) <;>
                  (try {omega
                    })
              }) <;>
          (try {omega
            })
        hole
    --    aesop
    --  · intro h
      have h₂ : n = 1 ∨ n = 11 ∨ n = 37 := by sorry
    --    rcases h₂ with (rfl | rfl | rfl)
    --    · norm_num
    --    · norm_num
    --    · norm_num
    hole
  have h₂ : (∑ n in S, n) = 49:= by
    --  rw [h₁]
    --  norm_num <;> rfl
    hole
  --  exact h₂
  linarith