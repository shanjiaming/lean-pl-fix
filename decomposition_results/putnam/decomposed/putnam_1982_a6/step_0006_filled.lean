theorem h₅ (h :  ∀ (b : ℕ → ℕ) (x : ℕ → ℝ),    BijOn b (Ici 1) (Ici 1) →      StrictAntiOn (fun n => |x n|) (Ici 1) →        Tendsto (fun n => ↑|↑(b n) - ↑n| * |x n|) atTop (𝓝 0) →          Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x k) atTop (𝓝 1) →            Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x (b k)) atTop (𝓝 1)) (h₄ :  ∀ (n : ℕ),    ↑n ≥ 1 →      ↑|↑n + 1 - ↑n| * |if n = 1 then 2 else if n = 2 then -1 else 0| =        1 * |if n = 1 then 2 else if n = 2 then -1 else 0|) : ∀ (n : ℕ),
    ↑n ≥ 1 → 1 * |if n = 1 then 2 else if n = 2 then -1 else 0| = |if n = 1 then 2 else if n = 2 then -1 else 0| :=
  by
  --  intro n hn
  --  simp_all
  hole