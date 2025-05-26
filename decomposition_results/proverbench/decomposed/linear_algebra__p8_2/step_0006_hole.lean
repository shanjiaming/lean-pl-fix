theorem h_main (h₁ : -19 * 4 + 8 * -4 = -108) (h₂ : -71 * 4 + 30 * -4 = -404) (h₃ : -2 * 4 + -4 = -12) (h₄ : 4 * 4 + -2 = 14) : (4, -4, -2) ∈
    {x | -19 * x.1 + 8 * x.2.1 = -108 ∧ -71 * x.1 + 30 * x.2.1 = -404 ∧ -2 * x.1 + x.2.1 = -12 ∧ 4 * x.1 + x.2.2 = 14} :=
  by
  --  simp only [Set.mem_setOf_eq, Prod.mk.injEq]
  --  constructor
  --  · exact h₁
  --  constructor
  --  · exact h₂
  --  constructor
  --  · exact h₃
  --  · exact h₄
  hole