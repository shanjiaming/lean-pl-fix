theorem putnam_1974_b4
(f : ℝ × ℝ → ℝ)
(hfcontx : ∀ y : ℝ, Continuous (fun x => f ⟨x, y⟩))
(hfconty : ∀ x : ℝ, Continuous (fun y => f ⟨x, y⟩))
: ∃ g : ℕ → (ℝ × ℝ → ℝ), (∀ n : ℕ, Continuous (g n)) ∧ (∀ x y : ℝ, Tendsto (fun n => g n ⟨x, y⟩) atTop (𝓝 (f ⟨x, y⟩))) := by