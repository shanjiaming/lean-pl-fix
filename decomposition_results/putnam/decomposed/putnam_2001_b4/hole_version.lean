macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)

theorem putnam_2001_b4 (S : Set ℚ) (hS : S = univ \ {-1, 0, 1}) (f : S → S) (hf : ∀ x : S, f x = x - 1 / (x : ℚ)) : ⋂ n ∈ Ici 1, f^[n] '' univ = ∅ ↔ ((True) : Prop) := by
  have h₁ : ⋂ n ∈ Ici 1, (f^[n] '' (univ : Set S)) = ∅ := by
    have h₂ : ∀ (x : S), ∃ (n : ℕ), n ∈ Ici 1 ∧ x ∉ f^[n] '' (univ : Set S) := by
      intro x
      by_contra! h
      have h₃ := h 1
      have h₄ := h 2
      have h₅ : x ∈ f^[1] '' (univ : Set S) := by hole_1
      have h₆ : x ∈ f^[2] '' (univ : Set S) := by hole_2
      
      obtain ⟨y₁, _, hy₁⟩ := h₅
      obtain ⟨y₂, _, hy₂⟩ := h₆
      have h₇ : f y₁ = x := by hole_3
      have h₈ : f (f y₂) = x := by hole_4
      have h₉ : f y₁ = f (f y₂) := by hole_5
      
      have h₁₀ : (f y₁ : ℚ) = (f (f y₂) : ℚ) := by hole_6
      have h₁₁ : (y₁ : ℚ) - 1 / (y₁ : ℚ) = (f y₂ : ℚ) - 1 / (f y₂ : ℚ) := by
        hole_7
      have h₁₂ : (y₁ : ℚ) = (f y₂ : ℚ) := by
        have h₁₃ : (y₁ : ℚ) - 1 / (y₁ : ℚ) = (f y₂ : ℚ) - 1 / (f y₂ : ℚ) := h₁₁
        have h₁₄ : (y₁ : ℚ) = (f y₂ : ℚ) := by
          by_cases h₁₅ : (y₁ : ℚ) = 0
          · exfalso
            have h₁₆ := y₁.2
            simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff]
            <;>
              norm_num at h₁₆ ⊢ <;>
                aesop
          · by_cases h₁₆ : (f y₂ : ℚ) = 0
            · exfalso
              have h₁₇ := (f y₂).2
              simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff]
              <;>
                norm_num at h₁₇ ⊢ <;>
                  aesop
            · 
              have h₁₇ : (y₁ : ℚ) ≠ 0 := by hole_10
              have h₁₈ : (f y₂ : ℚ) ≠ 0 := by hole_11
              have h₁₉ : (y₁ : ℚ) * (f y₂ : ℚ) ≠ 0 := by hole_12
              hole_9
        hole_8
      have h₁₃ : (y₁ : ℚ) = (f y₂ : ℚ) := h₁₂
      have h₁₄ : (f y₁ : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ) := by
        hole_13
      have h₁₅ : (f y₁ : ℚ) = (f (f y₂) : ℚ) := by hole_14
      have h₁₆ : (f y₁ : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ) := by
        hole_15
      have h₁₇ : (y₁ : ℚ) - 1 / (y₁ : ℚ) = (f y₂ : ℚ) - 1 / (f y₂ : ℚ) := by
        hole_16
      have h₁₈ : (y₁ : ℚ) = (f y₂ : ℚ) := by
        have h₁₃ : (y₁ : ℚ) - 1 / (y₁ : ℚ) = (f y₂ : ℚ) - 1 / (f y₂ : ℚ) := h₁₁
        have h₁₄ : (y₁ : ℚ) = (f y₂ : ℚ) := by
          by_cases h₁₅ : (y₁ : ℚ) = 0
          · exfalso
            have h₁₆ := y₁.2
            simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff]
            <;>
              norm_num at h₁₆ ⊢ <;>
                aesop
          · by_cases h₁₆ : (f y₂ : ℚ) = 0
            · exfalso
              have h₁₇ := (f y₂).2
              simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff]
              <;>
                norm_num at h₁₇ ⊢ <;>
                  aesop
            · 
              have h₁₇ : (y₁ : ℚ) ≠ 0 := by hole_19
              have h₁₈ : (f y₂ : ℚ) ≠ 0 := by hole_20
              have h₁₉ : (y₁ : ℚ) * (f y₂ : ℚ) ≠ 0 := by hole_21
              hole_18
        hole_17
      have h₁₉ : (y₁ : ℚ) = (f y₂ : ℚ) := h₁₈
      have h₂₀ : (f y₂ : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ) := by
        hole_22
      have h₂₁ : (f y₁ : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ) := by
        hole_23
      have h₂₂ : (x : ℚ) = (f y₁ : ℚ) := by
        hole_24
      have h₂₃ : (x : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ) := by
        hole_25
      have h₂₄ : (x : ℚ) = (f y₂ : ℚ) := by
        hole_26
      have h₂₅ : (x : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ) := by
        hole_27
      have h₂₆ : (y₁ : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ) := by
        hole_28
      have h₂₇ : (y₁ : ℚ) - 1 / (y₁ : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ) := by
        hole_29
      have h₂₈ : (f y₁ : ℚ) = (f y₂ : ℚ) := by
        hole_30
      have h₂₉ : (f y₁ : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ) := by
        hole_31
      have h₃₀ : (f y₂ : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ) := by
        hole_32
      have h₃₁ : (x : ℚ) - 1 / (x : ℚ) = (x : ℚ) - 1 / (x : ℚ) := by hole_33
      have h₃₂ : 1 / (x : ℚ) = 0 := by
        have h₃₃ : (x : ℚ) - 1 / (x : ℚ) = (x : ℚ) - 1 / (x : ℚ) := by hole_34
        have h₃₄ : (x : ℚ) ≠ 0 := by
          intro h₃₅
          have h₃₆ := x.2
          hole_35
        have h₃₅ : 1 / (x : ℚ) = 0 := by
          hole_36
        exact h₃₅
      have h₃₃ : False := by
        have h₃₄ : (x : ℚ) ≠ 0 := by
          intro h₃₅
          have h₃₆ := x.2
          simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff]
          <;>
            norm_num at h₃₆ ⊢ <;>
              aesop
        have h₃₅ : 1 / (x : ℚ) ≠ 0 := by positivity
        have h₃₆ : 1 / (x : ℚ) = 0 := h₃₂
        contradiction
      exact h₃₃
    have h₃ : ⋂ n ∈ Ici 1, (f^[n] '' (univ : Set S)) = ∅ := by
      apply Set.eq_empty_of_forall_not_mem
      intro x hx
      have h₄ : ∀ (n : ℕ), n ∈ Ici 1 → x ∈ f^[n] '' (univ : Set S) := by simpa using hx
      have h₅ := h₂ x
      obtain ⟨n, hn, hn'⟩ := h₅
      have h₆ := h₄ n hn
      exact hn' h₆
    exact h₃
  have h₂ : ⋂ n ∈ Ici 1, f^[n] '' univ = ∅ ↔ ((True) : Prop) := by
    constructor
    · intro h
      trivial
    · intro h
      simpa [h₁] using h₁
  exact h₂