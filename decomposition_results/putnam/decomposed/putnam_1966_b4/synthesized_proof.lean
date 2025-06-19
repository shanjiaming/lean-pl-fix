macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)

theorem putnam_1966_b4
(m n : ℕ)
(S : Finset ℕ)
(hS : (∀ i ∈ S, i > 0) ∧ S.card = m * n + 1)
: ∃ T ⊆ S, (T.card = m + 1 ∧ ∀ j ∈ T, ∀ i ∈ T, i ≠ j → ¬(j ∣ i)) ∨ (T.card = n + 1 ∧ ∀ i ∈ T, ∀ j ∈ T, j < i → j ∣ i) := by
  have h₁ : m + 1 ≤ S.card ∨ n + 1 ≤ S.card := by
    by_cases h : n = 0
    · 
      have h₂ : n + 1 ≤ S.card := by
        have h₃ : S.card = m * n + 1 := hS.2
        have h₄ : n = 0 := h
        rw [h₄] at h₃
        have h₅ : S.card = m * 0 + 1 := by linarith
        have h₆ : S.card = 1 := by
          linarith
        have h₇ : n + 1 = 1 := by linarith
        have h₈ : n + 1 ≤ S.card := by
          linarith
        linarith
      exact Or.inr h₂
    · 
      have h₂ : 1 ≤ n := by
        have h₃ : n ≠ 0 := h
        have h₄ : 0 < n := Nat.pos_of_ne_zero h₃
        linarith
      have h₃ : m + 1 ≤ S.card := by
        have h₄ : S.card = m * n + 1 := hS.2
        have h₅ : m + 1 ≤ m * n + 1 := by
          have h₆ : m ≤ m * n := by
            nlinarith
          linarith
        linarith
      omega
  
  have h₂ : ∃ T ⊆ S, (T.card = m + 1 ∧ ∀ j ∈ T, ∀ i ∈ T, i ≠ j → ¬(j ∣ i)) ∨ (T.card = n + 1 ∧ ∀ i ∈ T, ∀ j ∈ T, j < i → j ∣ i) := by
    by_cases h : n = 0
    · 
      have h₃ : S.card = m * n + 1 := hS.2
      have h₄ : n = 0 := h
      rw [h₄] at h₃
      have h₅ : S.card = 1 := by linarith
      have h₆ : ∃ (x : ℕ), x ∈ S := by
        have h₇ : S.card > 0 := by
          linarith
        admit
      obtain ⟨x, hx⟩ := h₆
      use {x}
      have h₇ : {x} ⊆ S := by
        simpa
      have h₈ : ({x} : Finset ℕ).card = 1 := by norm_num
      have h₉ : ({x} : Finset ℕ).card = n + 1 := by
        linarith
      refine' Or.inr ⟨by aesop, _⟩
      intro i hi j hj hji
      simp_all [Finset.mem_singleton]
      <;> aesop
    · 
      have h₃ : 1 ≤ n := by
        have h₄ : n ≠ 0 := h
        have h₅ : 0 < n := Nat.pos_of_ne_zero h₄
        linarith
      have h₄ : m + 1 ≤ S.card := by
        have h₅ : m + 1 ≤ S.card ∨ n + 1 ≤ S.card := h₁
        nlinarith
      have h₅ : ∃ (T : Finset ℕ), T ⊆ S ∧ T.card = m + 1 := by
        have h₆ : m + 1 ≤ S.card := h₄
        have h₇ : ∃ (T : Finset ℕ), T ⊆ S ∧ T.card = m + 1 := by
          admit
        simpa
      admit
  
  simpa
