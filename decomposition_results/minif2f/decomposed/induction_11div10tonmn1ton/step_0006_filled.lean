theorem h_final (n : ℕ) (h_main : 11 ∣ 10 ^ n - (-1) ^ n) : 11 ∣ 10 ^ n - (-1) ^ n := by -- simpa [Int.emod_eq_emod_iff_emod_sub_eq_zero] using h_main
  omega