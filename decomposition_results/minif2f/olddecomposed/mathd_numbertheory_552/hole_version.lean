macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_numbertheory_552 (f g h : ℕ+ → ℕ) (h₀ : ∀ x, f x = 12 * x + 7)
    (h₁ : ∀ x, g x = 5 * x + 2) (h₂ : ∀ x, h x = Nat.gcd (f x) (g x)) (h₃ : Fintype (Set.range h)) :
    (∑ k in (Set.range h).toFinset, k) = 12 := by
  have h_main : ∀ x : ℕ+, h x = 1 ∨ h x = 11 := by
    intro x
    have h₄ : h x = Nat.gcd (f x) (g x) := h₂ x
    rw [h₄]
    have h₅ : f x = 12 * x + 7 := h₀ x
    have h₆ : g x = 5 * x + 2 := h₁ x
    rw [h₅, h₆]
    have h₇ : Nat.gcd (12 * x + 7) (5 * x + 2) = 1 ∨ Nat.gcd (12 * x + 7) (5 * x + 2) = 11 := by
      have h₇₁ : Nat.gcd (12 * x + 7) (5 * x + 2) ∣ 11 := by
        have h₇₂ : (5 : ℕ) * (12 * x + 7) - 12 * (5 * x + 2) = 11 := by
          hole_5
        have h₇₃ : Nat.gcd (12 * x + 7) (5 * x + 2) ∣ 12 * x + 7 := Nat.gcd_dvd_left _ _
        have h₇₄ : Nat.gcd (12 * x + 7) (5 * x + 2) ∣ 5 * x + 2 := Nat.gcd_dvd_right _ _
        have h₇₅ : Nat.gcd (12 * x + 7) (5 * x + 2) ∣ 5 * (12 * x + 7) := dvd_mul_of_dvd_right h₇₃ _
        have h₇₆ : Nat.gcd (12 * x + 7) (5 * x + 2) ∣ 12 * (5 * x + 2) := dvd_mul_of_dvd_right h₇₄ _
        have h₇₇ : Nat.gcd (12 * x + 7) (5 * x + 2) ∣ 5 * (12 * x + 7) - 12 * (5 * x + 2) := Nat.dvd_sub' h₇₅ h₇₆
        hole_4
      have h₇₂ : Nat.gcd (12 * x + 7) (5 * x + 2) ∣ 11 := h₇₁
      have h₇₃ : Nat.gcd (12 * x + 7) (5 * x + 2) = 1 ∨ Nat.gcd (12 * x + 7) (5 * x + 2) = 11 := by
        have h₇₄ : Nat.gcd (12 * x + 7) (5 * x + 2) ≤ 11 := Nat.le_of_dvd (by norm_num) h₇₂
        hole_6
      hole_3
    hole_2
  have h₁_in_range : 1 ∈ Set.range h := by
    have h₁_in : h ⟨1, by norm_num⟩ = 1 := by
      have h₁₁ : h ⟨1, by norm_num⟩ = Nat.gcd (f ⟨1, by norm_num⟩) (g ⟨1, by norm_num⟩) := h₂ _
      rw [h₁₁]
      have h₁₂ : f ⟨1, by norm_num⟩ = 12 * (⟨1, by norm_num⟩ : ℕ+) + 7 := h₀ ⟨1, by norm_num⟩
      have h₁₃ : g ⟨1, by norm_num⟩ = 5 * (⟨1, by norm_num⟩ : ℕ+) + 2 := h₁ ⟨1, by norm_num⟩
      hole_8
    hole_7
  
  have h₁₁_in_range : 11 ∈ Set.range h := by
    have h₁₁_in : h ⟨4, by norm_num⟩ = 11 := by
      have h₁₁ : h ⟨4, by norm_num⟩ = Nat.gcd (f ⟨4, by norm_num⟩) (g ⟨4, by norm_num⟩) := h₂ _
      rw [h₁₁]
      have h₁₂ : f ⟨4, by norm_num⟩ = 12 * (⟨4, by norm_num⟩ : ℕ+) + 7 := h₀ ⟨4, by norm_num⟩
      have h₁₃ : g ⟨4, by norm_num⟩ = 5 * (⟨4, by norm_num⟩ : ℕ+) + 2 := h₁ ⟨4, by norm_num⟩
      hole_10
    hole_9
  
  have h_sum : (∑ k in (Set.range h).toFinset, k) = 12 := by
    have h₄ : (Set.range h).toFinset = {1, 11} := by
      apply Finset.ext
      intro x
      simp only [Finset.mem_insert, Finset.mem_singleton, Set.mem_toFinset, Set.mem_range,
        Set.mem_setOf_eq]
      constructor
      · intro hx
        have h₅ : x ∈ Set.range h := by hole_13
        rcases h₅ with ⟨y, rfl⟩
        have h₆ : h y = 1 ∨ h y = 11 := h_main y
        cases h₆ with
        | inl h₆ =>
          simp [h₆]
        | inr h₆ =>
          simp [h₆]
      · intro hx
        have h₅ : x = 1 ∨ x = 11 := by hole_14
        hole_12
    hole_11
  hole_1