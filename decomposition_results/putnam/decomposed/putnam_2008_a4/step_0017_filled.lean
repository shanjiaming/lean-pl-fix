theorem h₂ (f : ℝ → ℝ) (hf : f = fun x => if x ≤ rexp 1 then x else x * f (Real.log x)) (h₁ : False) : (∃ r, sorry) ↔ False :=
  by
  --  constructor
  --  · intro h
  --    exact h₁
  --  · intro h
  --    exfalso
  --    exact h₁
  hole