import Mathlib

open Metric Set EuclideanGeometry Filter Topology

/--
A closed subset $S$ of $\mathbb{R}^2$ lies in $a < x < b$. Show that its projection on the y-axis is closed.
-/
theorem putnam_1970_b3
(S : Set (ℝ × ℝ))
(a b : ℝ)
(hab : a < b)
(hS : ∀ s ∈ S, s.1 ∈ Ioo a b)
(hSclosed : IsClosed S)
: IsClosed {y | ∃ x : ℝ, ⟨x,y⟩ ∈ S} := by
  have h_main : IsClosed {y | ∃ x : ℝ, ⟨x,y⟩ ∈ S} := by
    -- To show that the set {y | ∃ x : ℝ, ⟨x,y⟩ ∈ S} is closed, we verify that it contains all its limit points.
    have h₁ : IsClosed (Prod.snd '' S) := by
      -- Use the fact that S is closed and the second projection is a closed map when restricted to S.
      have h₂ : IsSeqClosed S := by
        -- S is sequentially closed because it is closed in the metric space ℝ × ℝ.
        exact hSclosed.isSeqClosed
      -- We need to show that the image of S under the second projection is closed.
      have h₃ : IsSeqClosed (Prod.snd '' S) := by
        -- Consider a sequence (yₙ) in Prod.snd '' S that converges to y.
        intro y hy
        -- Extract the sequence (yₙ) from the hypothesis hy.
        rcases hy with ⟨f, hf, rfl⟩
        -- For each n, there exists an xₙ such that (xₙ, yₙ) ∈ S.
        -- Since (xₙ) is bounded, by Bolzano-Weierstrass, it has a convergent subsequence.
        have h₄ : ∀ n, ∃ x : ℝ, (x, f n) ∈ S := by
          intro n
          have h₅ : f n ∈ Prod.snd '' S := by simpa using hf n
          rcases h₅ with ⟨⟨x, y⟩, h₅, rfl⟩
          exact ⟨x, h₅⟩
        -- Choose xₙ using the axiom of choice.
        choose x hx using h₄
        -- The sequence (xₙ) is bounded by a < xₙ < b.
        have h₅ : ∀ n, a < x n ∧ x n < b := by
          intro n
          have h₆ := hS (⟨x n, f n⟩ : ℝ × ℝ) (hx n)
          simp at h₆ ⊢
          exact h₆
        -- Extract a convergent subsequence of (xₙ).
        have h₆ : ∃ (ψ : ℕ → ℕ) (x₀ : ℝ), StrictMono ψ ∧ Tendsto (x ∘ ψ) atTop (𝓝 x₀) := by
          -- Use the Bolzano-Weierstrass theorem to find a convergent subsequence.
          have h₇ : BddAbove (Set.range x) := by
            use b
            rintro _ ⟨n, rfl⟩
            exact (h₅ n).2.le
          have h₈ : BddBelow (Set.range x) := by
            use a
            rintro _ ⟨n, rfl⟩
            exact (h₅ n).1.le
          -- Use the Bolzano-Weierstrass theorem to find a convergent subsequence.
          have h₉ : ∃ (ψ : ℕ → ℕ) (x₀ : ℝ), StrictMono ψ ∧ Tendsto (x ∘ ψ) atTop (𝓝 x₀) := by
            -- Use the Bolzano-Weierstrass theorem to find a convergent subsequence.
            have h₁₀ : ∃ (ψ : ℕ → ℕ) (x₀ : ℝ), StrictMono ψ ∧ Tendsto (x ∘ ψ) atTop (𝓝 x₀) := by
              -- Use the Bolzano-Weierstrass theorem to find a convergent subsequence.
              have h₁₁ : ∃ (ψ : ℕ → ℕ) (x₀ : ℝ), StrictMono ψ ∧ Tendsto (x ∘ ψ) atTop (𝓝 x₀) := by
                -- Use the Bolzano-Weierstrass theorem to find a convergent subsequence.
                exact?
              exact h₁₁
            exact h₁₀
          exact h₉
        rcases h₆ with ⟨ψ, x₀, hψ, hψ_tendsto⟩
        -- The subsequence (x_{ψ(n)}) converges to x₀.
        refine' ⟨x₀, _⟩
        -- We need to show that (x₀, y) ∈ S.
        have h₇ : Tendsto (fun n ↦ (x (ψ n), f (ψ n))) atTop (𝓝 (x₀, y)) := by
          -- Use the fact that (x_{ψ(n)}) converges to x₀ and (f(ψ(n))) converges to y.
          have h₈ : Tendsto (fun n ↦ f (ψ n)) atTop (𝓝 y) := by
            -- Use the fact that f(ψ(n)) is a subsequence of (yₙ).
            have h₉ : Tendsto f atTop (𝓝 y) := by assumption
            have h₁₀ : Tendsto ψ atTop atTop := hψ.tendsto_atTop
            have h₁₁ : Tendsto (f ∘ ψ) atTop (𝓝 y) := h₉.comp h₁₀
            simpa using h₁₁
          -- Use the fact that (x_{ψ(n)}) converges to x₀ and (f(ψ(n))) converges to y.
          have h₉ : Tendsto (fun n ↦ (x (ψ n), f (ψ n))) atTop (𝓝 (x₀, y)) := by
            -- Use the fact that (x_{ψ(n)}) converges to x₀ and (f(ψ(n))) converges to y.
            have h₁₀ : Tendsto (fun n ↦ x (ψ n)) atTop (𝓝 x₀) := hψ_tendsto
            have h₁₁ : Tendsto (fun n ↦ (x (ψ n), f (ψ n))) atTop (𝓝 (x₀, y)) :=
              h₁₀.prod_mk_nhds h₈
            exact h₁₁
          exact h₉
        -- Use the fact that S is closed to conclude that (x₀, y) ∈ S.
        have h₈ : (x₀, y) ∈ S := by
          -- Use the fact that S is closed and (x_{ψ(n)}, f(ψ(n))) is a sequence in S converging to (x₀, y).
          have h₉ : ∀ n, (x (ψ n), f (ψ n)) ∈ S := by
            intro n
            exact hx (ψ n)
          have h₁₀ : ∀ n, (x (ψ n), f (ψ n)) ∈ S := h₉
          have h₁₁ : Tendsto (fun n ↦ (x (ψ n), f (ψ n))) atTop (𝓝 (x₀, y)) := h₇
          have h₁₂ : (x₀, y) ∈ S := by
            -- Use the fact that S is closed and (x_{ψ(n)}, f(ψ(n))) is a sequence in S converging to (x₀, y).
            exact h₂.mem_of_tendsto h₁₁ (eventually_of_forall h₁₀)
          exact h₁₂
        -- Since (x₀, y) ∈ S, we have y ∈ Prod.snd '' S.
        have h₉ : y ∈ Prod.snd '' S := by
          use (x₀, y)
          <;> simp_all [Prod.snd]
          <;> aesop
        -- Therefore, y ∈ Prod.snd '' S.
        exact h₉
      -- Therefore, Prod.snd '' S is closed.
      have h₄ : IsClosed (Prod.snd '' S) := by
        exact isClosed_iff_isSeqClosed.mpr h₃
      exact h₄
    -- The set {y | ∃ x : ℝ, ⟨x,y⟩ ∈ S} is exactly the image of S under the second projection.
    have h₂ : {y | ∃ x : ℝ, ⟨x,y⟩ ∈ S} = Prod.snd '' S := by
      ext y
      constructor
      · -- If y is in {y | ∃ x : ℝ, ⟨x,y⟩ ∈ S}, then y is in Prod.snd '' S.
        rintro ⟨x, hx⟩
        exact ⟨⟨x, y⟩, hx, rfl⟩
      · -- If y is in Prod.snd '' S, then y is in {y | ∃ x : ℝ, ⟨x,y⟩ ∈ S}.
        rintro ⟨⟨x, y'⟩, hx, rfl⟩
        exact ⟨x, hx⟩
    -- Substitute the set {y | ∃ x : ℝ, ⟨x,y⟩ ∈ S} with Prod.snd '' S.
    rw [h₂]
    -- Therefore, {y | ∃ x : ℝ, ⟨x,y⟩ ∈ S} is closed.
    exact h₁
  exact h_main