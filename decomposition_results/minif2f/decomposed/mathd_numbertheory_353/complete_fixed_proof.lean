theorem mathd_numbertheory_353 (s : ℕ) (h₀ : s = ∑ k in Finset.Icc 2010 4018, k) : s % 2009 = 0:=
  by
  have h₁ : s = 2009 * 3014:= by
    --  rw [h₀]
    have h₂ : (∑ k in Finset.Icc 2010 4018, k) = ∑ t in Finset.range 2009, (t + 2010):=
      by
      have h₃ : Finset.Icc 2010 4018 = (Finset.range 2009).image (fun t => t + 2010):=
        by
        --  apply Finset.ext
        --  intro x
        --  simp only [Finset.mem_Icc, Finset.mem_image, Finset.mem_range]
        --  constructor
        --  · intro hx
          have h₄ : 2010 ≤ x ∧ x ≤ 4018 := hx
          have h₅ : x ≥ 2010:= by -- linarith
            linarith
          have h₆ : x ≤ 4018:= by -- linarith
            linarith
          have h₇ : x - 2010 < 2009:= by -- omega
            omega
        --  --    use x - 2010 <;> simp_all [Nat.sub_add_cancel] <;> omega
        --  · intro hx
        --    rcases hx with ⟨t, ht₁, ht₂⟩
          have h₄ : t < 2009 := ht₁
          have h₅ : t + 2010 = x := by sorry
          have h₆ : 2010 ≤ x := by sorry
          have h₇ : x ≤ 4018 := by sorry
        --    exact ⟨by omega, by omega⟩
        hole
      --  rw [h₃]
      --  --  rw [Finset.sum_image] <;> simp_all [Function.Injective] <;> omega
      hole
    --  rw [h₂]
    have h₃ :
      (∑ t in Finset.range 2009, (t + 2010 : ℕ)) = (∑ t in Finset.range 2009, t) + ∑ t in Finset.range 2009, 2010 := by
      rw [Finset.sum_add_distrib]
    --  rw [h₃]
    have h₄ : (∑ t in Finset.range 2009, t) = 2009 * 1004:= by
      --  rw [Finset.sum_range_id] <;> norm_num <;> ring_nf <;> norm_num
      hole
    have h₅ : (∑ t in Finset.range 2009, (2010 : ℕ)) = 2009 * 2010:= by
      --  simp [Finset.sum_const, Finset.card_range] <;> ring_nf
      simp
    have h₃ : (∑ t in Finset.range 2009, (t + 2010 : ℕ)) = (∑ t in Finset.range 2009, t) + ∑ t in Finset.range 2009, 2010:=
      --  by rw [Finset.sum_add_distrib]
      hole
  have h₁ : s = 2009 * 3014 := by
    rw [h₀]
    have h₂ : (∑ k in Finset.Icc 2010 4018, k) = ∑ t in Finset.range 2009, (t + 2010) := by sorry
    rw [h₂]
    have h₃ :
      (∑ t in Finset.range 2009, (t + 2010 : ℕ)) = (∑ t in Finset.range 2009, t) + ∑ t in Finset.range 2009, 2010 := by
      rw [Finset.sum_add_distrib]
    rw [h₃]
    have h₄ : (∑ t in Finset.range 2009, t) = 2009 * 1004 := by
      rw [Finset.sum_range_id] <;> norm_num <;> ring_nf <;> norm_num
    have h₅ : (∑ t in Finset.range 2009, (2010 : ℕ)) = 2009 * 2010 := by
      simp [Finset.sum_const, Finset.card_range] <;> ring_nf
    rw [h₄, h₅] <;> norm_num <;> ring_nf <;> norm_num
    hole
  have h₂ : s % 2009 = 0:= by -- rw [h₁] <;> norm_num <;> rfl
    omega
  --  exact h₂
  linarith