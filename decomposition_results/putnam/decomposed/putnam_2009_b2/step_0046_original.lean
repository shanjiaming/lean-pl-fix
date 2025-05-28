theorem h_subset₂ (h_subset₁ :  {c | ∃ s, s 0 = 0 ∧ StrictMono s ∧ ∃ n, s n = 1 ∧ ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i * s (i + 1) ^ 2) = c} ⊆    Ioc (1 / 3) 1) : Ioc (1 / 3) 1 ⊆
    {c | ∃ s, s 0 = 0 ∧ StrictMono s ∧ ∃ n, s n = 1 ∧ ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i * s (i + 1) ^ 2) = c} :=
  by
  intro c hc
  have h₁ : c > 1 / 3 := by sorry
  have h₂ : c ≤ 1 := by sorry
  by_cases h₃ : c = 1
  · use fun i => if i = 0 then 0 else 1
    constructor
    · simp
    constructor
    · refine' strictMono_nat_of_lt_succ fun n => _
      by_cases hn : n = 0
      · simp [hn] <;> norm_num
      · by_cases hn' : n + 1 = 0
        · exfalso
          omega
        · simp [hn, hn'] <;> norm_num <;> aesop
    · use 1
      constructor
      · simp
      · simp [Finset.sum_range_succ, h₃] <;> norm_num <;> aesop
  ·
    have h₄ : c < 1 := by sorry
    have h₅ : ∃ (x : ℝ), x ∈ Set.Ioo 0 1 ∧ x ^ 3 - x + 1 = c := by sorry
    obtain ⟨x, hx, hx'⟩ := h₅
    use fun i => if i = 0 then 0 else if i = 1 then x else 1
    constructor
    · simp
    constructor
    · refine' strictMono_nat_of_lt_succ fun n => _
      by_cases hn : n = 0
      · simp [hn] <;> (try norm_num) <;> (try nlinarith [hx.1, hx.2]) <;> (try aesop)
      · by_cases hn' : n = 1
        · simp [hn, hn'] <;> (try norm_num) <;> (try nlinarith [hx.1, hx.2]) <;> (try aesop)
        · by_cases hn'' : n + 1 = 0
          · exfalso
            omega
          · by_cases hn''' : n + 1 = 1
            ·
              simp_all [Finset.sum_range_succ, Finset.sum_range_zero, Nat.cast_zero, Nat.cast_one] <;>
                    (try norm_num) <;>
                  (try nlinarith [hx.1, hx.2]) <;>
                (try aesop)
            ·
              simp_all [Finset.sum_range_succ, Finset.sum_range_zero, Nat.cast_zero, Nat.cast_one] <;>
                    (try norm_num) <;>
                  (try nlinarith [hx.1, hx.2]) <;>
                (try aesop)
    · use 2
      constructor
      · simp <;> (try norm_num) <;> (try nlinarith [hx.1, hx.2]) <;> (try aesop)
      ·
        simp [Finset.sum_range_succ, Finset.sum_range_zero, Nat.cast_zero, Nat.cast_one] <;> (try norm_num) <;>
                (try nlinarith [hx.1, hx.2]) <;>
              (try ring_nf at hx' ⊢) <;>
            (try nlinarith [hx.1, hx.2]) <;>
          (try aesop)