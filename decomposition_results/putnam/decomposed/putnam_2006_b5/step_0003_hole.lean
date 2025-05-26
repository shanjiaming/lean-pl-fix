theorem h₂ (I J : (ℝ → ℝ) → ℝ) (hI : I = fun f => ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x) (hJ : J = fun f => ∫ (x : ℝ) in 0 ..1, x * f x ^ 2) : ∫ (x : ℝ) in 0 ..1, x ^ 2 * (fun x => x / 2) x = 1 / 8 := by
  norm_num [mul_comm] <;> ring_nf <;> norm_num <;> (try norm_num) <;> (try ring_nf) <;> (try norm_num) <;>
                    (try linarith) <;>
                  (try ring_nf) <;>
                (try norm_num) <;>
              (try linarith) <;>
            simp [mul_comm] <;>
          norm_num <;>
        ring_nf <;>
      norm_num <;>
    linarith
  hole