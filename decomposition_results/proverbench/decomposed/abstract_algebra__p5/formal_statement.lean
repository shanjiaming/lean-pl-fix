theorem rational_product_of_roots {K : Type*} [CommRing K] [Field K] [CharZero K] [Algebra ℚ K]
  (P : Polynomial ℚ) (hd : P.degree = 4)
  (x₁ x₂ : K) (hr₁ : eval x₁ (map (algebraMap ℚ K) P) = 0)
  (hr₂ : eval x₂ (map (algebraMap ℚ K) P) = 0)
  (hsum : x₁ + x₂ ≠ (-P.coeff 1) / (2 * P.leadingCoeff)) :
  ∃ q : ℚ, x₁ * x₂ = algebraMap ℚ K q :=