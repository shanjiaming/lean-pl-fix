theorem h4 (lambda : NNReal) (h0 : lambda = 1) (h1 : Summable fun k => ↑k * ↑k ^ 2 * poissonPMFReal lambda k) (h2 : Summable fun k => ↑k * poissonPMFReal lambda k) (h3 : Summable fun k => ↑k ^ 2 * poissonPMFReal lambda k) : ∑' (k : ℕ), ↑k * poissonPMFReal lambda k = 1 :=
  by
  have h4₁ : ∑' k, k * poissonPMFReal lambda k = lambda := by sorry
  --  --  rw [h4₁] <;> simp [h0] <;> norm_num <;> simp_all [poissonPMFReal] <;> norm_num <;> simp_all [poissonPMFReal] <;>
        norm_num <;>
      simp_all [poissonPMFReal] <;>
    norm_num
  hole