theorem h₃ (n : ℕ) (h₁ : a_n = fun n => (1 + (2 / 3) ^ n) / (3 * (1 - (2 / 3) ^ (n + 1)))) (h₂ : Tendsto (fun n => (2 / 3) ^ n) Filter.atTop (nhds 0)) : Tendsto (fun n => (2 / 3) ^ (n + 1)) Filter.atTop (nhds 0) :=
  by
  have h₄ : (fun n : ℕ => (2 / 3 : ℝ) ^ (n + 1)) = (fun n : ℕ => (2 / 3 : ℝ) * (2 / 3 : ℝ) ^ n) := by sorry
  --  rw [h₄]
  have h₅ : Filter.Tendsto (fun n : ℕ => (2 / 3 : ℝ) * (2 / 3 : ℝ) ^ n) Filter.atTop (nhds ((2 / 3 : ℝ) * 0)) := by sorry
  simpa using h₅
  hole