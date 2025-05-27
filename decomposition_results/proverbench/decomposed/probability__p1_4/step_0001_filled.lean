theorem cov_X_X2 (lambda : NNReal) (h0 : lambda = 1) (h1 : Summable fun k => ↑k * ↑k ^ 2 * poissonPMFReal lambda k) (h2 : Summable fun k => ↑k * poissonPMFReal lambda k) (h3 : Summable fun k => ↑k ^ 2 * poissonPMFReal lambda k) : ∑' (k : ℕ), ↑k * ↑k ^ 2 * poissonPMFReal lambda k -
      (∑' (k : ℕ), ↑k * poissonPMFReal lambda k) * ∑' (k : ℕ), ↑k ^ 2 * poissonPMFReal lambda k =
    3 :=
  by
  have h4 : (∑' k, k * poissonPMFReal lambda k) = 1 := by sorry
  have h5 : (∑' k, k ^ 2 * poissonPMFReal lambda k) = 2 := by sorry
  have h6 : (∑' k, k * k ^ 2 * poissonPMFReal lambda k) = 5 := by sorry
  have h7 :
    (∑' k, k * k ^ 2 * poissonPMFReal lambda k) -
        (∑' k, k * poissonPMFReal lambda k) * (∑' k, k ^ 2 * poissonPMFReal lambda k) =
      3 := by sorry
  --  apply h7
  linarith