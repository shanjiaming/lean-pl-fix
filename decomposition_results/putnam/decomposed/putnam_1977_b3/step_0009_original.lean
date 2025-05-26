theorem h₄ (P balanced : ℝ × ℝ × ℝ → Prop) (B : ℝ × ℝ × ℝ → ℝ × ℝ × ℝ) (hP :  P = fun x =>    match x with    | (a, b, c) => Irrational a ∧ Irrational b ∧ Irrational c ∧ a > 0 ∧ b > 0 ∧ c > 0 ∧ a + b + c = 1) (hbalanced :  balanced = fun x =>    match x with    | (a, b, c) => a < 1 / 2 ∧ b < 1 / 2 ∧ c < 1 / 2) (hB :  B = fun x =>    match x with    | (a, b, c) =>      (if a > 1 / 2 then 2 * a - 1 else 2 * a, if b > 1 / 2 then 2 * b - 1 else 2 * b,        if c > 1 / 2 then 2 * c - 1 else 2 * c)) (h : ∀ (t : ℝ × ℝ × ℝ), P t → ∃ n, balanced (B^[n] t)) (t : ℝ × ℝ × ℝ) (ht : P t) (n : ℕ) (hn : balanced (B^[n] t)) : False := by
  exfalso <;> simp_all [hP, hbalanced, hB, Function.iterate_succ_apply'] <;> norm_num at * <;> (try contradiction) <;>
        (try linarith) <;>
      (try nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]) <;>
    (try
        {cases t with
        | mk a b =>
          cases b with
          | mk b c =>
            simp_all [hP, hbalanced, hB, Function.iterate_succ_apply'] <;> norm_num at * <;> (try contradiction) <;>
                (try linarith) <;>
              (try nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)])
      })