theorem h₁ (xprod : ℝ → ℝ) (hxprod :  ∀ x ∈ Set.Ioo 0 1,    Tendsto (fun N => ∏ n ∈ Finset.range N, ((1 + x ^ (n + 1)) / (1 + x ^ n)) ^ x ^ n) atTop (𝓝 (xprod x))) : ∀ᶠ (x : ℝ) in 𝓝[<] 1, x ∈ Set.Ioo 0 1 :=
  by
  --  filter_upwards [Ioo_mem_nhdsWithin_Iio' (by norm_num : (0 : ℝ) < 1)] with x hx
  --  simp_all [Set.mem_Ioo, Set.mem_Iio] <;> (try norm_num at hx ⊢) <;> (try linarith) <;> (try assumption)
  hole