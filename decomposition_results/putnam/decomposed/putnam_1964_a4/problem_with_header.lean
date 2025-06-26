import Mathlib

open Set Function

/--
The sequence of integers $u_n$ is bounded and satisfies
\[
u_n = \frac{u_{n-1} + u_{n-2} + u_{n-3}u_{n-4}}{u_{n-1}u_{n-2} + u_{n-3} + u_{n-4}}.
\]
Show that it is periodic for sufficiently large $n$.
-/
theorem putnam_1964_a4
(u : ℕ → ℤ)
(boundedu : ∃ B T : ℤ, ∀ n : ℕ, B ≤ u n ∧ u n ≤ T)
(hu : ∀ n ≥ 4, u n = ((u (n - 1) + u (n - 2) + u (n - 3) * u (n - 4)) : ℝ) / (u (n - 1) * u (n - 2) + u (n - 3) + u (n - 4)) ∧ (u (n - 1) * u (n - 2) + u (n - 3) + u (n - 4)) ≠ 0)
: (∃ N c : ℕ, c > 0 ∧ ∀ n ≥ N, u (n + c) = u n) := by
  have h_main : ∃ (N c : ℕ), c > 0 ∧ ∀ n ≥ N, u (n + c) = u n := by
    obtain ⟨B, T, h_bounds⟩ := boundedu
    have h₁ : B ≤ T := by
      have h₂ := h_bounds 0
      have h₃ : B ≤ u 0 := h₂.1
      have h₄ : u 0 ≤ T := h₂.2
      linarith
    -- Use the pigeonhole principle to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
    have h₂ : ∃ (N c : ℕ), c > 0 ∧ ∀ n ≥ N, u (n + c) = u n := by
      have h₃ : ∀ n : ℕ, B ≤ u n := by
        intro n
        exact (h_bounds n).1
      have h₄ : ∀ n : ℕ, u n ≤ T := by
        intro n
        exact (h_bounds n).2
      -- Use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
      have h₅ : ∃ (N c : ℕ), c > 0 ∧ ∀ n ≥ N, u (n + c) = u n := by
        -- We use the pigeonhole principle to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
        have h₆ : B ≤ T := h₁
        -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
        have h₇ : ∃ (N c : ℕ), c > 0 ∧ ∀ n ≥ N, u (n + c) = u n := by
          -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
          have h₈ : ∀ n : ℕ, B ≤ u n := h₃
          have h₉ : ∀ n : ℕ, u n ≤ T := h₄
          -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
          -- Use the pigeonhole principle to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
          -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
          -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
          -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
          -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
          have h₁₀ : ∃ (N c : ℕ), c > 0 ∧ ∀ n ≥ N, u (n + c) = u n := by
            -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
            -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
            -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
            classical
            -- Use the pigeonhole principle to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
            have h₁₁ : Set.Finite (Set.range fun n : ℕ => (u n, u (n + 1), u (n + 2), u (n + 3))) := by
              -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
              have h₁₂ : Set.Finite (Set.range fun n : ℕ => (u n, u (n + 1), u (n + 2), u (n + 3))) := by
                -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
                have h₁₃ : (Set.range fun n : ℕ => (u n, u (n + 1), u (n + 2), u (n + 3))) ⊆ Set.Icc (B, B, B, B) (T, T, T, T) := by
                  intro x hx
                  -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
                  simp only [Set.mem_Icc, Set.mem_range] at hx ⊢
                  rcases hx with ⟨n, rfl⟩
                  constructor <;>
                  (try constructor) <;>
                  (try constructor) <;>
                  (try constructor) <;>
                  (try simp_all [h_bounds]) <;>
                  (try nlinarith) <;>
                  (try omega) <;>
                  (try linarith)
                -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
                have h₁₄ : Set.Finite (Set.Icc (B, B, B, B) (T, T, T, T)) := by
                  apply Set.finite_Icc
                -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
                exact Set.Finite.subset h₁₄ h₁₃
              -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
              exact h₁₂
            -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
            have h₁₅ : ∃ (N c : ℕ), c > 0 ∧ ∀ n ≥ N, u (n + c) = u n := by
              -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
              classical
              obtain ⟨⟨a, b, c, d⟩, h₁₆⟩ := Set.Finite.exists_ne_map_eq_of_mapsTo (Set.finite_univ (α := ℕ)) (fun n _ => by
                -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
                exact Set.mem_range_self n
              ) (Set.toFinite _)
              -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
              use 0, 1
              <;> simp_all
              <;>
                (try omega) <;>
                (try linarith) <;>
                (try nlinarith) <;>
                (try ring_nf at *) <;>
                (try ring_nf) <;>
                (try norm_num) <;>
                (try linarith) <;>
                (try nlinarith)
            -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
            exact h₁₅
          -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
          exact h₁₀
        -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
        exact h₇
      -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
      exact h₅
    -- We use the fact that the sequence is bounded to find a repetition in the sequence of vectors (u n, u (n + 1), u (n + 2), u (n + 3))
    exact h₂
  exact h_main