import Mathlib

open Set Filter Topology Real

-- {87}
/--
Define a sequence $\{a_i\}$ by $a_1=3$ and $a_{i+1}=3^{a_i}$ for $i \geq 1$. Which integers between $00$ and $99$ inclusive occur as the last two digits in the decimal expansion of infinitely many $a_i$?
-/
theorem putnam_1985_a4
    (a : ℕ → ℕ)
    (ha1 : a 1 = 3)
    (ha : ∀ i ≥ 1, a (i + 1) = 3 ^ a i) :
    {k : Fin 100 | ∀ N : ℕ, ∃ i ≥ N, a i % 100 = k} = (({87}) : Set (Fin 100) ) := by
  have h_a2 : a 2 = 27 := by
    have h1 : a 2 = 3 ^ a 1 := by
      have h2 := ha 1 (by norm_num)
      simpa using h2
    rw [h1, ha1]
    <;> norm_num
  
  have h_a3 : a 3 % 100 = 87 := by
    have h1 : a 3 = 3 ^ a 2 := by
      have h2 := ha 2 (by norm_num)
      simpa using h2
    rw [h1, h_a2]
    <;> norm_num [pow_succ, Nat.mul_mod, Nat.pow_mod, Nat.mod_mod]
    <;> rfl
  
  have h_a_ge_3 : ∀ i ≥ 3, a i % 100 = 87 := by
    intro i hi
    induction' hi with i hi IH
    · -- Base case: i = 3
      exact h_a3
    · -- Inductive step: assume the statement holds for i, prove for i + 1
      have h₁ : a (i + 1) = 3 ^ a i := ha i (by linarith)
      have h₂ : a i % 100 = 87 := IH
      have h₃ : a (i + 1) % 100 = 87 := by
        rw [h₁]
        have h₄ : 3 ^ a i % 100 = 87 := by
          have h₅ : a i % 100 = 87 := h₂
          have h₆ : 3 ^ a i % 100 = 3 ^ (a i % 20) % 100 := by
            have h₇ : 3 ^ a i % 100 = 3 ^ (a i % 20) % 100 := by
              have h₈ : ∀ n : ℕ, 3 ^ n % 100 = 3 ^ (n % 20) % 100 := by
                intro n
                rw [← Nat.mod_add_div n 20]
                simp [pow_add, pow_mul, Nat.pow_mod, Nat.mul_mod, Nat.pow_mod]
                <;> simp_all [Nat.pow_mod, Nat.mul_mod, Nat.pow_mod]
                <;> norm_num
                <;> ring_nf at *
                <;> omega
              exact h₈ (a i)
            exact h₇
          rw [h₆]
          have h₇ : a i % 20 = 7 := by
            have h₈ : a i % 100 = 87 := h₂
            omega
          rw [h₇]
          <;> norm_num
          <;> rfl
        exact h₄
      exact h₃
  
  have h_main : {k : Fin 100 | ∀ N : ℕ, ∃ i ≥ N, a i % 100 = k} = (({87}) : Set (Fin 100)) := by
    apply Set.Subset.antisymm
    · -- Prove the forward inclusion: {k : Fin 100 | ∀ N : ℕ, ∃ i ≥ N, a i % 100 = k} ⊆ {87}
      intro k hk
      have h₁ : ∀ N : ℕ, ∃ i ≥ N, a i % 100 = k := hk
      have h₂ : k = 87 := by
        by_contra h
        -- If k ≠ 87, we need to show that k cannot satisfy the condition
        have h₃ : k ≠ 87 := h
        -- Use the fact that for i ≥ 3, a i % 100 = 87
        have h₄ : ∀ i ≥ 3, a i % 100 = 87 := h_a_ge_3
        -- Choose N = 3 and find i ≥ 3 such that a i % 100 = k
        have h₅ : ∃ i ≥ 3, a i % 100 = k := by
          have h₆ := h₁ 3
          obtain ⟨i, hi, h₇⟩ := h₆
          refine' ⟨max i 3, _⟩
          constructor
          · -- Prove max i 3 ≥ 3
            exact le_max_right i 3
          · -- Prove a (max i 3) % 100 = k
            have h₈ : a (max i 3) % 100 = 87 := h_a_ge_3 (max i 3) (by
              cases' le_total i 3 with h₉ h₉ <;> simp_all [max_eq_right, max_eq_left]
              <;> omega)
            have h₉ : a i % 100 = k := h₇
            have h₁₀ : i ≥ 3 ∨ i < 3 := by omega
            cases' h₁₀ with h₁₀ h₁₀
            · -- Case i ≥ 3
              have h₁₁ : a i % 100 = 87 := h_a_ge_3 i h₁₀
              have h₁₂ : k = 87 := by omega
              simp_all
            · -- Case i < 3
              have h₁₁ : i < 3 := h₁₀
              have h₁₂ : i = 0 ∨ i = 1 ∨ i = 2 := by omega
              rcases h₁₂ with (rfl | rfl | rfl)
              · -- Subcase i = 0
                have h₁₃ := h₁ 0
                obtain ⟨i, hi, h₁₄⟩ := h₁₃
                have h₁₅ : a i % 100 = k := h₁₄
                have h₁₆ : i ≥ 0 := hi
                have h₁₇ : i ≥ 3 ∨ i < 3 := by omega
                cases' h₁₇ with h₁₇ h₁₇
                · -- Subcase i ≥ 3
                  have h₁₈ : a i % 100 = 87 := h_a_ge_3 i h₁₇
                  have h₁₉ : k = 87 := by omega
                  simp_all
                · -- Subcase i < 3
                  have h₁₈ : i = 0 ∨ i = 1 ∨ i = 2 := by omega
                  rcases h₁₈ with (rfl | rfl | rfl)
                  · -- Subcase i = 0
                    simp_all [ha1, h_a2, h_a3, ha]
                    <;> omega
                  · -- Subcase i = 1
                    simp_all [ha1, h_a2, h_a3, ha]
                    <;> omega
                  · -- Subcase i = 2
                    simp_all [ha1, h_a2, h_a3, ha]
                    <;> omega
              · -- Subcase i = 1
                have h₁₃ := h₁ 1
                obtain ⟨i, hi, h₁₄⟩ := h₁₃
                have h₁₅ : a i % 100 = k := h₁₄
                have h₁₆ : i ≥ 1 := hi
                have h₁₇ : i ≥ 3 ∨ i < 3 := by omega
                cases' h₁₇ with h₁₇ h₁₇
                · -- Subcase i ≥ 3
                  have h₁₈ : a i % 100 = 87 := h_a_ge_3 i h₁₇
                  have h₁₉ : k = 87 := by omega
                  simp_all
                · -- Subcase i < 3
                  have h₁₈ : i = 1 ∨ i = 2 := by omega
                  rcases h₁₈ with (rfl | rfl)
                  · -- Subcase i = 1
                    simp_all [ha1, h_a2, h_a3, ha]
                    <;> omega
                  · -- Subcase i = 2
                    simp_all [ha1, h_a2, h_a3, ha]
                    <;> omega
              · -- Subcase i = 2
                have h₁₃ := h₁ 2
                obtain ⟨i, hi, h₁₄⟩ := h₁₃
                have h₁₅ : a i % 100 = k := h₁₄
                have h₁₆ : i ≥ 2 := hi
                have h₁₇ : i ≥ 3 ∨ i < 3 := by omega
                cases' h₁₇ with h₁₇ h₁₇
                · -- Subcase i ≥ 3
                  have h₁₈ : a i % 100 = 87 := h_a_ge_3 i h₁₇
                  have h₁₉ : k = 87 := by omega
                  simp_all
                · -- Subcase i < 3
                  have h₁₈ : i = 2 := by omega
                  rw [h₁₈] at h₁₅
                  simp_all [ha1, h_a2, h_a3, ha]
                  <;> omega
          <;> simp_all [h_a_ge_3]
          <;> omega
        obtain ⟨i, hi, h₆⟩ := h₅
        have h₇ : a i % 100 = 87 := h_a_ge_3 i hi
        omega
      -- Since k = 87, we need to show that 87 is in the set {87}
      have h₃ : k = 87 := h₂
      rw [h₃]
      <;> simp [Set.mem_singleton_iff]
      <;> aesop
    · -- Prove the reverse inclusion: {87} ⊆ {k : Fin 100 | ∀ N : ℕ, ∃ i ≥ N, a i % 100 = k}
      intro k hk
      have h₁ : k = 87 := by simpa using hk
      rw [h₁]
      -- Show that 87 satisfies the condition
      intro N
      have h₂ : ∃ i ≥ N, a i % 100 = 87 := by
        use max N 3
        constructor
        · -- Prove max N 3 ≥ N
          exact le_max_left N 3
        · -- Prove a (max N 3) % 100 = 87
          have h₃ : a (max N 3) % 100 = 87 := h_a_ge_3 (max N 3) (by
            cases' le_total N 3 with h₄ h₄ <;> simp_all [max_eq_right, max_eq_left]
            <;> omega)
          exact h₃
      exact h₂
  
  exact h_main