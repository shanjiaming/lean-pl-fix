theorem h_main (F : Type u_1) (inst✝ : Field F) (f : F[X]) (hf : f.degree > 0) : ∃ E x i α, eval₂ i α f = 0 := by apply extension_field_zero f hf
  hole