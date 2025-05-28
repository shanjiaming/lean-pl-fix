theorem putnam_1982_a6  : (∀ (b : ℕ → ℕ) (x : ℕ → ℝ),
      BijOn b (Ici 1) (Ici 1) →
        StrictAntiOn (fun n => |x n|) (Ici 1) →
          Tendsto (fun n => ↑|↑(b n) - ↑n| * |x n|) atTop (𝓝 0) →
            Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x k) atTop (𝓝 1) →
              Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x (b k)) atTop (𝓝 1)) ↔
    False :=
  by
  have h₁ :
    ((∀ b : ℕ → ℕ,
        ∀ x : ℕ → ℝ,
          BijOn b (Ici 1) (Ici 1) →
            StrictAntiOn (fun n : ℕ => |x n|) (Ici 1) →
              Tendsto (fun n : ℕ => |b n - (n : ℤ)| * |x n|) atTop (𝓝 0) →
                Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, x k) atTop (𝓝 1) →
                  Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, x (b k)) atTop (𝓝 1)) ↔
      False) := by sorry
  simpa using h₁