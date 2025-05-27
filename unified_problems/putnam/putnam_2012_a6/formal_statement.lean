theorem putnam_2012_a6
(p : ((ℝ × ℝ) → ℝ) → Prop)
(hp : ∀ f, p f ↔
    Continuous f ∧
    ∀ x1 x2 y1 y2 : ℝ, x2 > x1 → y2 > y1
      → (x2 - x1) * (y2 - y1) = 1 → ∫ x in x1..x2, ∫ y in y1..y2, f (x, y) = 0)
: ((∀ f x y, p f → f (x, y) = 0) ↔ ((True) : Prop )) := by