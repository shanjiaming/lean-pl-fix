theorem characterize_B : ∀ b : Int, b ∈ B ↔ ∃ k : Int, b = -44 + 5 * k := by
  intro b
  have h_forward : b ∈ B → ∃ k : Int, b = -44 + 5 * k := by
    intro h
    -- Assume b ∈ B, so there exist m, n such that (m, n) ∈ A and b = m + n
    rcases h with ⟨m, n, hm, rfl⟩
    -- Since (m, n) ∈ A, we have 7m + 12n = 22
    have h₁ : 7 * m + 12 * n = 22 := by
      simp [A, Set.mem_setOf_eq] at hm
      exact hm
    -- We need to find k such that m + n = -44 + 5k
    -- Using the general solution, m = -110 + 12k and n = 66 - 7k, so m + n = -44 + 5k
    have h₂ : ∃ k : Int, m + n = -44 + 5 * k := by
      -- Solve for k in terms of m and n
      use (m + 110) / 12
      have h₃ : m % 12 = 10 := by
        -- Prove that m ≡ 10 mod 12
        have h₄ := congr_arg (fun x => x % 12) h₁
        norm_num at h₄ ⊢
        omega
      have h₄ : (m + 110) % 12 = 0 := by
        -- Prove that m + 110 ≡ 0 mod 12
        omega
      have h₅ : (m + 110) / 12 * 12 = m + 110 := by
        -- Prove that 12 divides m + 110
        have h₅₁ : (m + 110) % 12 = 0 := by omega
        have h₅₂ : (m + 110) / 12 * 12 = m + 110 := by
          omega
        exact h₅₂
      have h₆ : n = 66 - 7 * ((m + 110) / 12) := by
        -- Prove that n = 66 - 7 * ((m + 110) / 12)
        have h₆₁ : 7 * m + 12 * n = 22 := h₁
        have h₆₂ : m = -110 + 12 * ((m + 110) / 12) := by omega
        rw [h₆₂] at h₆₁
        ring_nf at h₆₁ ⊢
        omega
      -- Prove that m + n = -44 + 5 * ((m + 110) / 12)
      have h₇ : m + n = -44 + 5 * ((m + 110) / 12) := by
        rw [h₆]
        ring_nf at h₅ ⊢
        <;> omega
      exact h₇
    -- Conclude the proof
    rcases h₂ with ⟨k, hk⟩
    refine' ⟨k, _⟩
    linarith
  
  have h_backward : (∃ k : Int, b = -44 + 5 * k) → b ∈ B := by
    intro h
    rcases h with ⟨k, rfl⟩
    -- Use the general solution to find m and n
    have h₁ : ∃ (m n : Int), m = -110 + 12 * k ∧ n = 66 - 7 * k ∧ 7 * m + 12 * n = 22 := by
      apply general_solution
      <;> simp_all
    rcases h₁ with ⟨m, n, hm, hn, h_eq⟩
    -- Verify that (m, n) is in A and b = m + n
    have h₂ : (m, n) ∈ A := by
      simp only [A, Set.mem_setOf_eq, Prod.mk.injEq]
      exact h_eq
    have h₃ : (-44 + 5 * k : Int) = m + n := by
      have h₄ : m = -110 + 12 * k := hm
      have h₅ : n = 66 - 7 * k := hn
      rw [h₄, h₅]
      <;> ring_nf
      <;> omega
    -- Conclude that b is in B
    refine' ⟨m, n, h₂, _⟩
    linarith
  
  have h_main : b ∈ B ↔ ∃ k : Int, b = -44 + 5 * k := by
    constructor
    · -- Prove the forward direction: if b ∈ B, then ∃ k : Int, b = -44 + 5 * k
      intro h
      exact h_forward h
    · -- Prove the backward direction: if ∃ k : Int, b = -44 + 5 * k, then b ∈ B
      intro h
      exact h_backward h
  
  exact h_main