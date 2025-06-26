import Mathlib

open Nat Topology Filter

/--
Define a sequence $\{u_n\}_{n=0}^\infty$ by $u_0=u_1=u_2=1$, and thereafter by the condition that $\det \begin{pmatrix}
u_n & u_{n+1} \\
u_{n+2} & u_{n+3}
\end{pmatrix} = n!$ for all $n \geq 0$. Show that $u_n$ is an integer for all $n$. (By convention, $0!=1$.)
-/
theorem putnam_2004_a3
(u : ℕ → ℝ)
(hubase : u 0 = 1 ∧ u 1 = 1 ∧ u 2 = 1)
(hudet : ∀ n : ℕ, Matrix.det (fun i j : Fin 2 => u (n + i * 2 + j)) = (n! : ℝ))
: ∀ n : ℕ, ∃ m : ℤ, u n = m := by
  have h₁ : ∀ n : ℕ, u n ≥ 1 := by
    intro n
    have h₂ : ∀ n : ℕ, u n ≥ 1 := by
      intro n
      induction n using Nat.strong_induction_on with
      | h n ih =>
        match n with
        | 0 =>
          norm_num [hubase]
        | 1 =>
          norm_num [hubase]
        | 2 =>
          norm_num [hubase]
        | 3 =>
          have h₃ := hudet 0
          have h₄ := hudet 1
          have h₅ := hudet 2
          have h₆ := hudet 3
          norm_num [Matrix.det_fin_two, Fin.sum_univ_succ, Fin.val_zero, Fin.val_one, Nat.factorial_succ] at h₃ h₄ h₅ h₆ ⊢
          <;>
            (try norm_num [hubase] at h₃ h₄ h₅ h₆ ⊢) <;>
            (try nlinarith) <;>
            (try linarith) <;>
            (try nlinarith [ih 0 (by norm_num), ih 1 (by norm_num), ih 2 (by norm_num)])
        | n + 4 =>
          have h₃ := hudet (n + 1)
          have h₄ := hudet (n + 2)
          have h₅ := hudet (n + 3)
          have h₆ := hudet (n + 4)
          norm_num [Matrix.det_fin_two, Fin.sum_univ_succ, Fin.val_zero, Fin.val_one, Nat.factorial_succ] at h₃ h₄ h₅ h₆ ⊢
          <;>
            (try norm_num [hubase] at h₃ h₄ h₅ h₆ ⊢) <;>
            (try nlinarith [ih (n + 1) (by omega), ih (n + 2) (by omega), ih (n + 3) (by omega), ih n (by omega)]) <;>
            (try linarith [ih (n + 1) (by omega), ih (n + 2) (by omega), ih (n + 3) (by omega), ih n (by omega)]) <;>
            (try nlinarith [ih (n + 1) (by omega), ih (n + 2) (by omega), ih (n + 3) (by omega), ih n (by omega)])
    exact h₂ n
  have h₂ : ∀ n : ℕ, ∃ (k : ℕ), u n = k := by
    intro n
    have h₃ : ∀ n : ℕ, ∃ (k : ℕ), u n = k := by
      intro n
      induction n using Nat.strong_induction_on with
      | h n ih =>
        match n with
        | 0 =>
          refine' ⟨1, _⟩
          norm_num [hubase]
        | 1 =>
          refine' ⟨1, _⟩
          norm_num [hubase]
        | 2 =>
          refine' ⟨1, _⟩
          norm_num [hubase]
        | n + 3 =>
          have h₄ := hudet n
          have h₅ := hudet (n + 1)
          have h₆ := hudet (n + 2)
          have h₇ := hudet (n + 3)
          norm_num [Matrix.det_fin_two, Fin.sum_univ_succ, Fin.val_zero, Fin.val_one, Nat.factorial_succ] at h₄ h₅ h₆ h₇ ⊢
          <;>
            (try norm_num [hubase] at h₄ h₅ h₆ h₇ ⊢) <;>
            (try
              {
                have h₈ : ∃ (k : ℕ), u n = k := ih n (by omega)
                have h₉ : ∃ (k : ℕ), u (n + 1) = k := ih (n + 1) (by omega)
                have h₁₀ : ∃ (k : ℕ), u (n + 2) = k := ih (n + 2) (by omega)
                obtain ⟨k₈, hk₈⟩ := h₈
                obtain ⟨k₉, hk₉⟩ := h₉
                obtain ⟨k₁₀, hk₁₀⟩ := h₁₀
                have h₁₁ : u n ≥ 1 := h₁ n
                have h₁₂ : u (n + 1) ≥ 1 := h₁ (n + 1)
                have h₁₃ : u (n + 2) ≥ 1 := h₁ (n + 2)
                have h₁₄ : (k₈ : ℝ) = u n := by exact_mod_cast hk₈
                have h₁₅ : (k₉ : ℝ) = u (n + 1) := by exact_mod_cast hk₉
                have h₁₆ : (k₁₀ : ℝ) = u (n + 2) := by exact_mod_cast hk₁₀
                have h₁₇ : (n : ℝ) ≥ 0 := by exact_mod_cast Nat.zero_le n
                have h₁₈ : (n + 1 : ℝ) ≥ 0 := by exact_mod_cast Nat.zero_le (n + 1)
                have h₁₉ : (n + 2 : ℝ) ≥ 0 := by exact_mod_cast Nat.zero_le (n + 2)
                have h₂₀ : (n + 3 : ℝ) ≥ 0 := by exact_mod_cast Nat.zero_le (n + 3)
                have h₂₁ : (n ! : ℝ) ≥ 0 := by positivity
                have h₂₂ : ((n + 1)! : ℝ) ≥ 0 := by positivity
                have h₂₃ : ((n + 2)! : ℝ) ≥ 0 := by positivity
                have h₂₄ : ((n + 3)! : ℝ) ≥ 0 := by positivity
                -- Use the determinant conditions to find a contradiction or derive the required form
                refine' ⟨(k₉ * k₁₀ + n !).natAbs, _⟩
                -- Use the determinant conditions to find a contradiction or derive the required form
                have h₂₅ : u (n + 3) = (k₉ * k₁₀ + n ! : ℝ) / k₈ := by
                  have h₂₅₁ : u n * u (n + 3) = u (n + 1) * u (n + 2) + n ! := by
                    linarith
                  have h₂₅₂ : (k₈ : ℝ) * u (n + 3) = (k₉ : ℝ) * (k₁₀ : ℝ) + (n ! : ℝ) := by
                    nlinarith
                  have h₂₅₃ : u (n + 3) = ((k₉ : ℝ) * (k₁₀ : ℝ) + (n ! : ℝ)) / (k₈ : ℝ) := by
                    by_cases h : (k₈ : ℝ) = 0
                    · have h₂₅₄ : (k₈ : ℝ) = 0 := h
                      have h₂₅₅ : (k₈ : ℝ) = 0 := h₂₅₄
                      simp_all [h₂₅₅]
                      <;> nlinarith
                    · have h₂₅₄ : (k₈ : ℝ) ≠ 0 := h
                      field_simp [h₂₅₄] at h₂₅₂ ⊢
                      <;> nlinarith
                  exact h₂₅₃
                have h₂₆ : (k₉ * k₁₀ + n ! : ℝ) / k₈ = (k₉ * k₁₀ + n ! : ℝ) / k₈ := rfl
                have h₂₇ : u (n + 3) = (k₉ * k₁₀ + n ! : ℝ) / k₈ := by rw [h₂₅]
                have h₂₈ : (k₉ * k₁₀ + n ! : ℝ) / k₈ = ((k₉ * k₁₀ + n ! : ℕ) : ℝ) / k₈ := by
                  norm_cast
                  <;> field_simp [h₁₄, h₁₅, h₁₆]
                  <;> ring_nf
                  <;> norm_num
                  <;> linarith
                have h₂₉ : u (n + 3) = ((k₉ * k₁₀ + n ! : ℕ) : ℝ) / k₈ := by
                  rw [h₂₇, h₂₈]
                have h₃₀ : ((k₉ * k₁₀ + n ! : ℕ) : ℝ) / k₈ = ((k₉ * k₁₀ + n ! : ℕ) : ℝ) / k₈ := rfl
                have h₃₁ : u (n + 3) = ((k₉ * k₁₀ + n ! : ℕ) : ℝ) / k₈ := by rw [h₂₉]
                have h₃₂ : (k₉ * k₁₀ + n ! : ℕ) ≥ 0 := by positivity
                have h₃₃ : (k₈ : ℕ) > 0 := by
                  have h₃₄ : (k₈ : ℝ) > 0 := by
                    have h₃₅ : u n ≥ 1 := h₁ n
                    have h₃₆ : (k₈ : ℝ) = u n := by exact_mod_cast hk₈
                    linarith
                  exact_mod_cast h₃₄
                have h₃₄ : ((k₉ * k₁₀ + n ! : ℕ) : ℝ) / k₈ = ((k₉ * k₁₀ + n ! : ℕ) : ℝ) / k₈ := rfl
                have h₃₅ : u (n + 3) = ((k₉ * k₁₀ + n ! : ℕ) : ℝ) / k₈ := by rw [h₃₁]
                have h₃₆ : ((k₉ * k₁₀ + n ! : ℕ) : ℝ) / k₈ = (k₉ * k₁₀ + n ! : ℕ) / k₈ := by
                  norm_num
                  <;> field_simp [h₁₄, h₁₅, h₁₆]
                  <;> ring_nf
                  <;> norm_num
                  <;> linarith
                have h₃₇ : u (n + 3) = (k₉ * k₁₀ + n ! : ℕ) / k₈ := by
                  rw [h₃₅, h₃₆]
                have h₃₈ : (k₉ * k₁₀ + n ! : ℕ) / k₈ = (k₉ * k₁₀ + n ! : ℕ) / k₈ := rfl
                have h₃₉ : u (n + 3) = (k₉ * k₁₀ + n ! : ℕ) / k₈ := by rw [h₃₇]
                have h₄₀ : (k₉ * k₁₀ + n ! : ℕ) / k₈ = (k₉ * k₁₀ + n ! : ℕ) / k₈ := rfl
                have h₄₁ : u (n + 3) = (k₉ * k₁₀ + n ! : ℕ) / k₈ := by rw [h₃₉]
                have h₄₂ : (k₉ * k₁₀ + n ! : ℕ) / k₈ = (k₉ * k₁₀ + n ! : ℕ) / k₈ := rfl
                have h₄₃ : u (n + 3) = (k₉ * k₁₀ + n ! : ℕ) / k₈ := by rw [h₄₁]
                have h₄₄ : (k₉ * k₁₀ + n ! : ℕ) / k₈ = (k₉ * k₁₀ + n ! : ℕ) / k₈ := rfl
                have h₄₅ : u (n + 3) = (k₉ * k₁₀ + n ! : ℕ) / k₈ := by rw [h₄₃]
                have h₄₆ : (k₉ * k₁₀ + n ! : ℕ) / k₈ = (k₉ * k₁₀ + n ! : ℕ) / k₈ := rfl
                have h₄₇ : u (n + 3) = (k₉ * k₁₀ + n ! : ℕ) / k₈ := by rw [h₄₅]
                have h₄₈ : (k₉ * k₁₀ + n ! : ℕ) / k₈ = (k₉ * k₁₀ + n ! : ℕ) / k₈ := rfl
                have h₄₉ : u (n + 3) = (k₉ * k₁₀ + n ! : ℕ) / k₈ := by rw [h₄₇]
                have h₅₀ : (k₉ * k₁₀ + n ! : ℕ) / k₈ = (k₉ * k₁₀ + n ! : ℕ) / k₈ := rfl
                have h₅₁ : u (n + 3) = (k₉ * k₁₀ + n ! : ℕ) / k₈ := by rw [h₄₉]
                -- Use the fact that the division is exact to conclude that u (n + 3) is an integer
                have h₅₂ : (k₉ * k₁₀ + n ! : ℕ) % k₈ = 0 := by
                  have h₅₃ : (k₈ : ℝ) * u (n + 3) = (k₉ : ℝ) * (k₁₀ : ℝ) + (n ! : ℝ) := by
                    nlinarith
                  have h₅₄ : (k₈ : ℝ) * u (n + 3) = (k₉ : ℝ) * (k₁₀ : ℝ) + (n ! : ℝ) := by
                    nlinarith
                  have h₅₅ : (k₈ : ℝ) * u (n + 3) = (k₉ : ℝ) * (k₁₀ : ℝ) + (n ! : ℝ) := by
                    nlinarith
                  have h₅₆ : (k₈ : ℝ) * u (n + 3) = (k₉ : ℝ) * (k₁₀ : ℝ) + (n ! : ℝ) := by
                    nlinarith
                  -- Use the fact that the division is exact to conclude that u (n + 3) is an integer
                  have h₅₇ : (k₉ * k₁₀ + n ! : ℕ) % k₈ = 0 := by
                    by_cases h : (k₈ : ℝ) = 0
                    · have h₅₈ : (k₈ : ℝ) = 0 := h
                      have h₅₉ : (k₈ : ℝ) = 0 := h₅₈
                      simp_all [h₅₉]
                      <;> nlinarith
                    · have h₅₈ : (k₈ : ℝ) ≠ 0 := h
                      have h₅₉ : (k₉ * k₁₀ + n ! : ℕ) % k₈ = 0 := by
                        -- Use the fact that the division is exact to conclude that u (n + 3) is an integer
                        have h₅₁₀ : (k₈ : ℝ) * u (n + 3) = (k₉ : ℝ) * (k₁₀ : ℝ) + (n ! : ℝ) := by
                          nlinarith
                        have h₅₁₁ : (k₈ : ℝ) * u (n + 3) = (k₉ : ℝ) * (k₁₀ : ℝ) + (n ! : ℝ) := by
                          nlinarith
                        have h₅₁₂ : (k₉ * k₁₀ + n ! : ℕ) % k₈ = 0 := by
                          -- Use the fact that the division is exact to conclude that u (n + 3) is an integer
                          norm_cast at h₅₁₀ h₅₁₁ ⊢
                          <;>
                          (try omega) <;>
                          (try ring_nf at h₅₁₀ h₅₁₁ ⊢) <;>
                          (try field_simp [h₅₈] at h₅₁₀ h₅₁₁ ⊢) <;>
                          (try norm_cast at h₅₁₀ h₅₁₁ ⊢) <;>
                          (try ring_nf at h₅₁₀ h₅₁₁ ⊢) <;>
                          (try omega)
                        exact h₅₁₂
                      exact h₅₉
                  exact h₅₇
                have h₅₃ : (k₉ * k₁₀ + n ! : ℕ) % k₈ = 0 := h₅₂
                have h₅₄ : (k₉ * k₁₀ + n ! : ℕ) / k₈ = (k₉ * k₁₀ + n ! : ℕ) / k₈ := rfl
                have h₅₅ : u (n + 3) = (k₉ * k₁₀ + n ! : ℕ) / k₈ := by rw [h₄₉]
                have h₅₆ : (k₉ * k₁₀ + n ! : ℕ) / k₈ = (k₉ * k₁₀ + n ! : ℕ) / k₈ := rfl
                have h₅₇ : u (n + 3) = (k₉ * k₁₀ + n ! : ℕ) / k₈ := by rw [h₅₅]
                have h₅₈ : (k₉ * k₁₀ + n ! : ℕ) / k₈ = (k₉ * k₁₀ + n ! : ℕ) / k₈ := rfl
                have h₅₉ : u (n + 3) = (k₉ * k₁₀ + n ! : ℕ) / k₈ := by rw [h₅₇]
                -- Use the fact that the division is exact to conclude that u (n + 3) is an integer
                have h₆₀ : (k₉ * k₁₀ + n ! : ℕ) / k₈ = (k₉ * k₁₀ + n ! : ℕ) / k₈ := rfl
                have h₆₁ : u (n + 3) = (k₉ * k₁₀ + n ! : ℕ) / k₈ := by rw [h₅₉]
                have h₆₂ : (k₉ * k₁₀ + n ! : ℕ) / k₈ = (k₉ * k₁₀ + n ! : ℕ) / k₈ := rfl
                have h₆₃ : u (n + 3) = (k₉ * k₁₀ + n ! : ℕ) / k₈ := by rw [h₆₁]
                -- Use the fact that the division is exact to conclude that u (n + 3) is an integer
                refine' ⟨(k₉ * k₁₀ + n ! : ℕ) / k₈, _⟩
                have h₆₄ : u (n + 3) = ((k₉ * k₁₀ + n ! : ℕ) / k₈ : ℝ) := by
                  norm_num [h₆₃]
                  <;>
                  (try omega) <;>
                  (try ring_nf at h₅₁ ⊢) <;>
                  (try field_simp [h₁₄, h₁₅, h₁₆] at h₅₁ ⊢) <;>
                  (try norm_cast at h₅₁ ⊢) <;>
                  (try ring_nf at h₅₁ ⊢) <;>
                  (try omega)
                rw [h₆₄]
                <;> norm_num
                <;> field_simp [h₁₄, h₁₅, h₁₆]
                <;> ring_nf
                <;> norm_num
                <;> linarith
              })
    exact h₃ n
  have h₃ : ∀ n : ℕ, ∃ m : ℤ, u n = m := by
    intro n
    have h₄ : ∃ (k : ℕ), u n = k := h₂ n
    cases' h₄ with k hk
    refine' ⟨k, _⟩
    rw [hk]
    <;> simp [Int.cast_natCast]
  exact h₃