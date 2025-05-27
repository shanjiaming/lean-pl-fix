theorem h7 (lambda : NNReal) (h0 : lambda = 1) (h1 : Summable fun k => ↑k * ↑k ^ 2 * poissonPMFReal lambda k) (h2 : Summable fun k => ↑k * poissonPMFReal lambda k) (h3 : Summable fun k => ↑k ^ 2 * poissonPMFReal lambda k) (h4 : ∑' (k : ℕ), ↑k * poissonPMFReal lambda k = 1) (h5 : ∑' (k : ℕ), ↑k ^ 2 * poissonPMFReal lambda k = 2) (h6 : ∑' (k : ℕ), ↑k * ↑k ^ 2 * poissonPMFReal lambda k = 5) : ∑' (k : ℕ), ↑k * ↑k ^ 2 * poissonPMFReal lambda k -
      (∑' (k : ℕ), ↑k * poissonPMFReal lambda k) * ∑' (k : ℕ), ↑k ^ 2 * poissonPMFReal lambda k =
    3 :=
  by
  rw [h6, h4, h5] <;> norm_num <;> simp_all [poissonPMFReal] <;> norm_num <;> simp_all [poissonPMFReal] <;> norm_num <;>
      simp_all [poissonPMFReal] <;>
    norm_num