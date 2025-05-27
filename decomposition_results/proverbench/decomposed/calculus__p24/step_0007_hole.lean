theorem h₄ (h₂ : Tendsto (fun x => x ^ 3) atTop atTop) (h₃ : Tendsto (fun x => 3 * x ^ 3) atTop atTop) : Tendsto (fun x => x + 3 * x ^ 3) atTop atTop :=
  by
  refine' Tendsto.atTop_of_add_const_right _ _
  simpa using h₃
  hole