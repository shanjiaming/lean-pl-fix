theorem mathd_algebra_400 (x : ℝ) (h₀ : 5 + 500 / 100 * 10 = 110 / 100 * x) : x = 50:=
  by
  have h₁ : x = 50:=
    by
    have h₂ : x = 50:= by
      --  apply_fun (fun x => x * 100) at h₀
      --  ring_nf at h₀ ⊢
      --  linarith
      linarith
    --  exact h₂
    linarith
  --  exact h₁
  linarith