theorem cos_infinite_series (x : ℝ) : cos x = cos_taylor_series x:=
  by
  have h₁ : (cos_taylor_series x) = cos x:=
    by
    have h₂ : HasSum (fun n : ℕ => ((-1 : ℝ) ^ n / (2 * n).factorial * x ^ (2 * n))) (cos x) :=
      cos_taylor_series_converges x
    have h₃ : (∑' n : ℕ, ((-1 : ℝ) ^ n / (2 * n).factorial * x ^ (2 * n))) = cos x:= by exact h₂.tsum_eq
      hole
    rw [cos_taylor_series] at *
    exact h₃
    hole
  have h₂ : cos x = cos_taylor_series x:= by rw [h₁] <;> simp [cos_taylor_series] <;> norm_num
    hole
  exact h₂
  hole