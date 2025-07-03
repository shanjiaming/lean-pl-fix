import Mathlib

open Matrix Filter Topology Set Nat

/--
Let $n$ be a positive integer such that $n+1$ is divisible by $24$. Prove that the sum of all the divisors of $n$ is divisible by $24$.
-/
theorem putnam_1969_b1
(n : ℕ)
(hnpos : n > 0)
(hn : 24 ∣ n + 1)
: 24 ∣ ∑ d in divisors n, d := by
  have h₀ : n % 2 = 1 := by
    have h₁ : (n + 1) % 2 = 0 := by omega
    omega
  
  have h₁ : n % 8 = 7 := by
    have h₂ : (n + 1) % 24 = 0 := by omega
    omega
  
  have h₂ : n % 3 = 2 := by
    have h₃ : (n + 1) % 24 = 0 := by omega
    omega
  
  have h₃ : ¬ IsSquare n := by
    intro h
    rcases h with ⟨k, rfl⟩
    have h₄ : k ^ 2 % 8 = 0 ∨ k ^ 2 % 8 = 1 ∨ k ^ 2 % 8 = 4 := by
      have : k % 8 = 0 ∨ k % 8 = 1 ∨ k % 8 = 2 ∨ k % 8 = 3 ∨ k % 8 = 4 ∨ k % 8 = 5 ∨ k % 8 = 6 ∨ k % 8 = 7 := by omega
      rcases this with (h | h | h | h | h | h | h | h) <;>
      (try omega) <;>
      (try {
        simp [h, pow_two, Nat.mul_mod, Nat.add_mod]
      }) <;>
      (try omega)
    have h₅ : k ^ 2 % 8 = 0 ∨ k ^ 2 % 8 = 1 ∨ k ^ 2 % 8 = 4 := by assumption
    have h₆ : (k ^ 2) % 8 = 7 → False := by
      intro h₇
      rcases h₅ with (h₅ | h₅ | h₅) <;> omega
    have h₇ : (k ^ 2) % 8 = 7 → False := by assumption
    have h₈ : (k ^ 2) % 8 ≠ 7 := by
      intro h₉
      exact h₇ h₉
    omega
  
  have h₄ : ∀ (d : ℕ), d ∣ n → (d + n / d) % 8 = 0 := by
    intro d hd
    have h₅ : d ∣ n := hd
    have h₆ : d % 2 = 1 := by
      by_contra h
      have h₇ : d % 2 = 0 := by omega
      have h₈ : 2 ∣ d := by
        omega
      have h₉ : 2 ∣ n := by
        exact Nat.dvd_trans h₈ h₅
      have h₁₀ : n % 2 = 0 := by
        omega
      omega
    have h₇ : d * (n / d) = n := by
      have h₈ : d * (n / d) = n := Nat.mul_div_cancel' h₅
      exact h₈
    have h₈ : (d * (n / d)) % 8 = 7 := by
      rw [h₇]
      omega
    have h₉ : (d % 8 = 1 ∧ (n / d) % 8 = 7) ∨ (d % 8 = 7 ∧ (n / d) % 8 = 1) ∨ (d % 8 = 3 ∧ (n / d) % 8 = 5) ∨ (d % 8 = 5 ∧ (n / d) % 8 = 3) := by
      have h₁₀ : d % 8 = 1 ∨ d % 8 = 3 ∨ d % 8 = 5 ∨ d % 8 = 7 := by omega
      rcases h₁₀ with (h₁₀ | h₁₀ | h₁₀ | h₁₀)
      · -- Case: d % 8 = 1
        have h₁₁ : (n / d) % 8 = 7 := by
          have h₁₂ : (d * (n / d)) % 8 = 7 := h₈
          simp [h₁₀, Nat.mul_mod, Nat.add_mod] at h₁₂ ⊢
          <;> omega
        exact Or.inl ⟨h₁₀, h₁₁⟩
      · -- Case: d % 8 = 3
        have h₁₁ : (n / d) % 8 = 5 := by
          have h₁₂ : (d * (n / d)) % 8 = 7 := h₈
          simp [h₁₀, Nat.mul_mod, Nat.add_mod] at h₁₂ ⊢
          <;> omega
        exact Or.inr (Or.inr (Or.inl ⟨h₁₀, h₁₁⟩))
      · -- Case: d % 8 = 5
        have h₁₁ : (n / d) % 8 = 3 := by
          have h₁₂ : (d * (n / d)) % 8 = 7 := h₈
          simp [h₁₀, Nat.mul_mod, Nat.add_mod] at h₁₂ ⊢
          <;> omega
        exact Or.inr (Or.inr (Or.inr ⟨h₁₀, h₁₁⟩))
      · -- Case: d % 8 = 7
        have h₁₁ : (n / d) % 8 = 1 := by
          have h₁₂ : (d * (n / d)) % 8 = 7 := h₈
          simp [h₁₀, Nat.mul_mod, Nat.add_mod] at h₁₂ ⊢
          <;> omega
        exact Or.inr (Or.inl ⟨h₁₀, h₁₁⟩)
    rcases h₉ with (⟨h₉₁, h₉₂⟩ | ⟨h₉₁, h₉₂⟩ | ⟨h₉₁, h₉₂⟩ | ⟨h₉₁, h₉₂⟩)
    · -- Subcase: d % 8 = 1, n / d % 8 = 7
      have h₁₀ : (d + n / d) % 8 = 0 := by
        omega
      exact h₁₀
    · -- Subcase: d % 8 = 7, n / d % 8 = 1
      have h₁₀ : (d + n / d) % 8 = 0 := by
        omega
      exact h₁₀
    · -- Subcase: d % 8 = 3, n / d % 8 = 5
      have h₁₀ : (d + n / d) % 8 = 0 := by
        omega
      exact h₁₀
    · -- Subcase: d % 8 = 5, n / d % 8 = 3
      have h₁₀ : (d + n / d) % 8 = 0 := by
        omega
      exact h₁₀
  
  have h₅ : ∀ (d : ℕ), d ∣ n → (d + n / d) % 3 = 0 := by
    intro d hd
    have h₅ : d ∣ n := hd
    have h₆ : d * (n / d) = n := Nat.mul_div_cancel' h₅
    have h₇ : (d * (n / d)) % 3 = 2 := by
      rw [h₆]
      omega
    have h₈ : d % 3 ≠ 0 := by
      by_contra h
      have h₉ : d % 3 = 0 := by omega
      have h₁₀ : 3 ∣ d := by
        omega
      have h₁₁ : 3 ∣ n := by
        exact Nat.dvd_trans h₁₀ h₅
      have h₁₂ : n % 3 = 0 := by
        omega
      omega
    have h₉ : (d + n / d) % 3 = 0 := by
      have h₁₀ : d % 3 = 1 ∨ d % 3 = 2 := by
        omega
      rcases h₁₀ with (h₁₀ | h₁₀)
      · -- Case: d % 3 = 1
        have h₁₁ : (n / d) % 3 = 2 := by
          have h₁₂ : (d * (n / d)) % 3 = 2 := by
            omega
          have h₁₃ : (d % 3) * ((n / d) % 3) % 3 = 2 := by
            simp [Nat.mul_mod, h₁₀] at h₁₂ ⊢ <;> omega
          omega
        have h₁₂ : (d + n / d) % 3 = 0 := by
          omega
        exact h₁₂
      · -- Case: d % 3 = 2
        have h₁₁ : (n / d) % 3 = 1 := by
          have h₁₂ : (d * (n / d)) % 3 = 2 := by
            omega
          have h₁₃ : (d % 3) * ((n / d) % 3) % 3 = 2 := by
            simp [Nat.mul_mod, h₁₀] at h₁₂ ⊢ <;> omega
          omega
        have h₁₂ : (d + n / d) % 3 = 0 := by
          omega
        exact h₁₂
    exact h₉
  
  have h₆ : ∀ (d : ℕ), d ∣ n → (d + n / d) % 24 = 0 := by
    intro d hd
    have h₆ : (d + n / d) % 8 = 0 := h₄ d hd
    have h₇ : (d + n / d) % 3 = 0 := h₅ d hd
    have h₈ : (d + n / d) % 24 = 0 := by
      have h₉ : (d + n / d) % 8 = 0 := h₆
      have h₁₀ : (d + n / d) % 3 = 0 := h₇
      omega
    exact h₈
  
  have h₇ : 24 ∣ ∑ d in divisors n, d := by
    have h₇₁ : (∑ d in divisors n, (d + n / d)) % 24 = 0 := by
      have h₇₂ : (∑ d in divisors n, (d + n / d)) % 24 = 0 := by
        have h₇₃ : ∀ d ∈ divisors n, (d + n / d) % 24 = 0 := by
          intro d hd
          have h₇₄ : d ∣ n := by
            exact dvd_of_mem_divisors hd
          exact h₆ d h₇₄
        have h₇₅ : (∑ d in divisors n, (d + n / d)) % 24 = 0 := by
          -- Use the fact that each term in the sum is divisible by 24 to show the sum is divisible by 24.
          have h₇₆ : (∑ d in divisors n, (d + n / d)) % 24 = (∑ d in divisors n, (d + n / d) % 24) % 24 := by
            apply Eq.symm
            apply Eq.symm
            rw [← Nat.mod_add_div (∑ d in divisors n, (d + n / d)) 24]
            simp [Finset.sum_nat_mod, Nat.add_mod, Nat.mul_mod, Nat.mod_mod]
            <;>
            simp_all [Finset.sum_const, nsmul_eq_mul, Nat.mul_mod, Nat.add_mod, Nat.mod_mod]
            <;>
            ring_nf at *
            <;>
            omega
          rw [h₇₆]
          have h₇₇ : (∑ d in divisors n, (d + n / d) % 24) % 24 = 0 := by
            have h₇₈ : ∀ d ∈ divisors n, (d + n / d) % 24 = 0 := h₇₃
            calc
              (∑ d in divisors n, (d + n / d) % 24) % 24 = (∑ d in divisors n, ((d + n / d) % 24)) % 24 := by rfl
              _ = (∑ d in divisors n, 0) % 24 := by
                apply congr_arg (fun x => x % 24)
                apply Finset.sum_congr rfl
                intro d hd
                rw [h₇₈ d hd]
              _ = 0 := by simp
          exact h₇₇
        exact h₇₅
      exact h₇₂
    have h₇₂ : 24 ∣ ∑ d in divisors n, d := by
      have h₇₃ : (∑ d in divisors n, (d + n / d)) = 2 * ∑ d in divisors n, d := by
        have h₇₄ : ∑ d in divisors n, (d + n / d) = ∑ d in divisors n, d + ∑ d in divisors n, (n / d) := by
          rw [Finset.sum_add_distrib]
        rw [h₇₄]
        have h₇₅ : ∑ d in divisors n, (n / d) = ∑ d in divisors n, d := by
          -- Use the fact that the sum of n/d over all divisors d of n is equal to the sum of d over all divisors d of n.
          have h₇₆ : ∑ d in divisors n, (n / d) = ∑ d in divisors n, d := by
            apply Finset.sum_bij (fun d _ => n / d)
            · -- Prove that the function is well-defined.
              intro d hd
              have h₇₇ : d ∣ n := by
                exact dvd_of_mem_divisors hd
              have h₇₈ : n / d ∣ n := by
                exact Nat.div_dvd_of_dvd h₇₇
              have h₇₉ : n / d ∈ divisors n := by
                exact mem_divisors.mpr ⟨h₇₈, by omega⟩
              exact h₇₉
            · -- Prove that the function is injective.
              intro d₁ d₂ _ _ h
              have h₈₀ : n / d₁ = n / d₂ := h
              have h₈₁ : d₁ ∣ n := by
                exact dvd_of_mem_divisors ‹_›
              have h₈₂ : d₂ ∣ n := by
                exact dvd_of_mem_divisors ‹_›
              have h₈₃ : d₁ = d₂ := by
                have h₈₄ : n / d₁ = n / d₂ := h₈₀
                have h₈₅ : d₁ = d₂ := by
                  by_contra h₈₅
                  have h₈₆ : d₁ ≠ d₂ := h₈₅
                  have h₈₇ : d₁ ∣ n := h₈₁
                  have h₈₈ : d₂ ∣ n := h₈₂
                  have h₈₉ : n / d₁ = n / d₂ := h₈₄
                  have h₉₀ : d₁ ≠ d₂ := h₈₆
                  have h₉₁ : d₁ < d₂ ∨ d₂ < d₁ := by
                    cases' lt_or_gt_of_ne h₉₀ with h₉₁ h₉₁
                    · exact Or.inl h₉₁
                    · exact Or.inr h₉₁
                  cases' h₉₁ with h₉₁ h₉₁
                  · -- Case: d₁ < d₂
                    have h₉₂ : n / d₁ ≥ n / d₂ := by
                      apply Nat.div_le_div_left
                      · exact Nat.le_of_dvd (by omega) h₈₁
                      · omega
                    have h₉₃ : n / d₁ > n / d₂ := by
                      have h₉₄ : d₂ ∣ n := h₈₂
                      have h₉₅ : d₁ < d₂ := h₉₁
                      have h₉₆ : n / d₁ > n / d₂ := by
                        apply Nat.div_lt_of_lt_mul
                        have h₉₇ : d₁ < d₂ := h₉₅
                        have h₉₈ : d₁ * (n / d₁) ≤ n := by
                          apply Nat.div_mul_le_self
                        have h₉₉ : d₂ * (n / d₂) ≤ n := by
                          apply Nat.div_mul_le_self
                        nlinarith
                      exact h₉₆
                    omega
                  · -- Case: d₂ < d₁
                    have h₉₂ : n / d₂ ≥ n / d₁ := by
                      apply Nat.div_le_div_left
                      · exact Nat.le_of_dvd (by omega) h₈₂
                      · omega
                    have h₉₃ : n / d₂ > n / d₁ := by
                      have h₉₄ : d₁ ∣ n := h₈₁
                      have h₉₅ : d₂ < d₁ := h₉₁
                      have h₉₆ : n / d₂ > n / d₁ := by
                        apply Nat.div_lt_of_lt_mul
                        have h₉₇ : d₂ < d₁ := h₉₅
                        have h₉₈ : d₁ * (n / d₁) ≤ n := by
                          apply Nat.div_mul_le_self
                        have h₉₉ : d₂ * (n / d₂) ≤ n := by
                          apply Nat.div_mul_le_self
                        nlinarith
                      exact h₉₆
                    omega
                exact h₈₅
              exact h₈₃
            · -- Prove that the function is surjective.
              intro d hd
              have h₈₀ : d ∣ n := by
                exact dvd_of_mem_divisors hd
              have h₈₁ : n / d ∣ n := by
                exact Nat.div_dvd_of_dvd h₈₀
              have h₈₂ : n / d ∈ divisors n := by
                exact mem_divisors.mpr ⟨h₈₁, by omega⟩
              use n / d
              <;> simp_all [Nat.div_div_eq_div_mul]
              <;>
              (try omega)
              <;>
              (try
                {
                  have h₈₃ : d * (n / d) = n := by
                    apply Nat.mul_div_cancel'
                    exact h₈₀
                  have h₈₄ : n / (n / d) = d := by
                    have h₈₅ : d * (n / d) = n := h₈₃
                    have h₈₆ : n / d > 0 := by
                      have h₈₇ : d > 0 := by
                        exact Nat.pos_of_dvd_of_pos h₈₀ (by omega)
                      have h₈₈ : n / d > 0 := by
                        apply Nat.div_pos
                        · exact Nat.le_of_dvd (by omega) h₈₀
                        · exact h₈₇
                      exact h₈₈
                    have h₈₉ : n / (n / d) = d := by
                      apply Nat.div_eq_of_eq_mul_left h₈₆
                      <;> nlinarith
                    exact h₈₉
                  simp_all
                })
            · -- Prove that the function preserves the sum.
              intro d hd
              simp_all [Nat.div_div_eq_div_mul]
              <;>
              (try omega)
              <;>
              (try
                {
                  have h₈₀ : d * (n / d) = n := by
                    apply Nat.mul_div_cancel'
                    exact dvd_of_mem_divisors hd
                  have h₈₁ : n / d > 0 := by
                    have h₈₂ : d > 0 := by
                      exact Nat.pos_of_dvd_of_pos (dvd_of_mem_divisors hd) (by omega)
                    have h₈₃ : n / d > 0 := by
                      apply Nat.div_pos
                      · exact Nat.le_of_dvd (by omega) (dvd_of_mem_divisors hd)
                      · exact h₈₂
                    exact h₈₃
                  have h₈₄ : n / (n / d) = d := by
                    have h₈₅ : d * (n / d) = n := h₈₀
                    have h₈₆ : n / d > 0 := h₈₁
                    have h₈₇ : n / (n / d) = d := by
                      apply Nat.div_eq_of_eq_mul_left h₈₆
                      <;> nlinarith
                    exact h₈₇
                  simp_all
                })
          exact h₇₆
        rw [h₇₅]
        <;> ring
        <;> simp_all [Finset.sum_add_distrib]
        <;> ring
        <;> omega
      have h₇₄ : (∑ d in divisors n, (d + n / d)) % 24 = 0 := h₇₁
      have h₇₅ : 24 ∣ ∑ d in divisors n, (d + n / d) := by
        omega
      have h₇₆ : 24 ∣ 2 * ∑ d in divisors n, d := by
        rw [h₇₃] at h₇₅
        exact h₇₅
      have h₇₇ : 24 ∣ ∑ d in divisors n, d := by
        omega
      exact h₇₇
    exact h₇₂
  
  exact h₇