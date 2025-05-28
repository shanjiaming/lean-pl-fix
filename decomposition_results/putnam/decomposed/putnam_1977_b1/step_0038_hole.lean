theorem h₁₅ (h_main : ∀ N ≥ 2, ∏ n ∈ Finset.Icc 2 N, (↑n ^ 3 - 1) / (↑n ^ 3 + 1) = 2 * (↑N ^ 2 + ↑N + 1) / (3 * ↑N * (↑N + 1))) (h₁₁ : (fun N => 2 * (↑N ^ 2 + ↑N + 1) / (3 * ↑N * (↑N + 1))) = fun N => 2 * (↑N ^ 2 + ↑N + 1) / (3 * ↑N * (↑N + 1))) : Tendsto (fun N => 2 * (↑N ^ 2 + ↑N + 1) / (3 * ↑N * (↑N + 1))) atTop (𝓝 (2 / 3)) := by
  --  convert Tendsto.const_mul (2 / 3 : ℝ) (tendsto_const_nhds : Tendsto (fun (N : ℤ) => (1 : ℝ)) atTop (𝓝 1)) using 1 <;>
  --                    simp [mul_comm] <;>
  --                  field_simp <;>
                ring_nf <;>
              norm_num <;>
            simp_all [mul_comm] <;>
          norm_num <;>
        simp_all [mul_comm] <;>
      norm_num <;>
    linarith
  hole