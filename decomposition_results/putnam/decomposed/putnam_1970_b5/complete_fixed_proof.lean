theorem putnam_1970_b5 (ramp : ℤ → (ℝ → ℝ))
  (ramp_def :
    ramp = fun (n : ℤ) => (fun (x : ℝ) => if x ≤ -n then (-n : ℝ) else (if -n < x ∧ x ≤ n then x else (n : ℝ))))
  (F : ℝ → ℝ) : Continuous F ↔ (∀ n : ℕ, Continuous ((ramp n) ∘ F)):=
  by
  have h_main : Continuous F ↔ (∀ n : ℕ, Continuous ((ramp n) ∘ F)):=
    by
    --  constructor
    --  · intro hF
    --    intro n
      have h₁ : Continuous ((ramp n) ∘ F):=
        by
        have h₂ : Continuous (ramp n):= by
          --  rw [ramp_def]
          have h₃ :
            Continuous
              (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) := by sorry
          exact h₃
          hole
        have h₃ : Continuous ((ramp n) ∘ F):= by
          have h₄ : Continuous (ramp n) := h₂
          --  exact h₄.comp hF
          hole
        --  exact h₃
        hole
    --    exact h₁
    --  · intro h
      have h₁ : Continuous F := by sorry
    --    exact h₁
    hole
  --  exact h_main
  hole