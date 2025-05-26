theorem h₁ (α : ℝ) (ha : cos (π * α) = 1 / 3) (h_main : ¬∃ p, ∃ q > 0, α = (↑p : ℝ) / (↑q : ℝ)) (r : ℚ) (hr : (↑r : ℝ) = α) : ∃ p, ∃ q > 0, α = (↑p : ℝ) / (↑q : ℝ) :=
  by
  --  refine' ⟨r.num, r.den, by exact_mod_cast r.pos, _⟩
  --  --  --  --  field_simp [hr, Rat.num_div_den] <;> ring_nf <;> simp_all [Rat.num_div_den] <;> field_simp [hr, Rat.num_div_den] <;>
      ring_nf <;>
    simp_all [Rat.num_div_den]
  hole