theorem h₁ (S : Finset (Fin 2 → ℝ)) (hS :  ∀ A ∈ S,    ∀ B ∈ S,      ∀ C ∈ S,        (MeasureTheory.volume : Set (Fin 2 → ℝ) → ENNReal)            ((convexHull ℝ : Set (Fin 2 → ℝ) → Set (Fin 2 → ℝ)) {A, B, C}) ≤          1) : ∃ A' B' C',
    (MeasureTheory.volume : Set (Fin 2 → ℝ) → ENNReal)
          ((convexHull ℝ : Set (Fin 2 → ℝ) → Set (Fin 2 → ℝ)) {A', B', C'}) =
        4 ∧
      (convexHull ℝ : Set (Fin 2 → ℝ) → Set (Fin 2 → ℝ)) {A', B', C'} ⊇ (↑S : Set (Fin 2 → ℝ)) :=
  by
  --  use (fun _ => 0 : Fin 2 → ℝ), (fun i => if i = 0 then 4 else 0 : Fin 2 → ℝ),
  --    (fun i => if i = 1 then 2 else 0 : Fin 2 → ℝ)
  --  constructor
  ·
    have h₂ :
      MeasureTheory.volume
          (convexHull ℝ
            {(fun _ => 0 : Fin 2 → ℝ), (fun i => if i = 0 then 4 else 0 : Fin 2 → ℝ),
              (fun i => if i = 1 then 2 else 0 : Fin 2 → ℝ)}) =
        4 := by sorry
  --    exact h₂
  --  · intro x hx
    have h₃ :
      x ∈
        convexHull ℝ
          {(fun _ => 0 : Fin 2 → ℝ), (fun i => if i = 0 then 4 else 0 : Fin 2 → ℝ),
            (fun i => if i = 1 then 2 else 0 : Fin 2 → ℝ)} := by sorry
  --    exact h₃
  hole