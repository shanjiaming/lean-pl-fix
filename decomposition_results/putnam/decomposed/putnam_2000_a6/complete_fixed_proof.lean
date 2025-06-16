theorem putnam_2000_a6
(f : Polynomial ℤ)
(a : ℕ → ℤ)
(ha0 : a 0 = 0)
(ha : ∀ n : ℕ, a (n + 1) = f.eval (a n))
: ((∃ m > 0, a m = 0) → (a 1 = 0 ∨ a 2 = 0)) := by
  intro h
  have h₁ : a 1 = 0 ∨ a 2 = 0 := by
    by_contra! h₂
    
    obtain ⟨m, hm, hm'⟩ := h
    
    have h₃ : a 1 ≠ 0 := h₂.1
    have h₄ : a 2 ≠ 0 := h₂.2
    
    have h₅ : ∀ n : ℕ, a n % a 1 = 0 := by
      admit
    have h₈ : (0 : ℤ) % a 1 = 0 := by
      admit
    have h₉ : a 1 ≠ 0 := h₃
    admit
  admit