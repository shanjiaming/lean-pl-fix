theorem power_and_factorial_range : ∀ (n : ℕ), n > 0 → (5^n > n.factorial ↔ n ≤ 11) := by
  have h_main : ∀ (n : ℕ), n ≥ 12 → 5^n ≤ n.factorial := by
    admit
  
  have h_forward : ∀ (n : ℕ), n > 0 → 5^n > n.factorial → n ≤ 11 := by
    intro n hn h
    by_contra! h₁
    have h₂ : n ≥ 12 := by admit
    have h₃ : 5^n ≤ n.factorial := h_main n h₂
    admit
  
  have h_backward : ∀ (n : ℕ), n > 0 → n ≤ 11 → 5^n > n.factorial := by
    intro n hn h_le_11
    have h₁ : n ≤ 11 := h_le_11
    have h₂ : n > 0 := hn
    admit
  
  intro n hn
  constructor
  · 
    intro h
    have h₁ : n ≤ 11 := h_forward n hn h
    exact h₁
  · 
    intro h
    have h₁ : n ≤ 11 := h
    have h₂ : 5^n > n.factorial := h_backward n hn h₁
    admit