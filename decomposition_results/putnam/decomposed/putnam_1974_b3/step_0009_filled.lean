theorem h₁ (α : ℝ) (ha : Real.cos (Real.pi * α) = 1 / 3) (h_main : ¬∃ p, ∃ q > 0, α = ↑p / ↑q) (r : ℚ) (hr : ↑r = α) : ∃ p, ∃ q > 0, α = ↑p / ↑q :=
  by
  --  refine' ⟨r.num, r.den, by exact_mod_cast r.pos, _⟩
  --  --  --  --  field_simp [hr, Rat.num_div_den] <;> ring_nf <;> simp_all [Rat.num_div_den] <;> field_simp [hr, Rat.num_div_den] <;>
      ring_nf <;>
    simp_all [Rat.num_div_den]
  hole