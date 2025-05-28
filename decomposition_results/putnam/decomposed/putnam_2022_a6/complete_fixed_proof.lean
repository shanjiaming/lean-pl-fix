theorem putnam_2022_a6 (n : ℕ) (hn : 0 < n) :
  IsGreatest
    {m : ℕ |
      ∃ x : ℕ → ℝ,
        StrictMono x ∧
          -1 < x 1 ∧
            x (2 * n) < 1 ∧
              ∀ k ∈ Icc 1 m, ∑ i in Finset.Icc 1 n, ((x (2 * i - 1) : ℝ) ^ (2 * k - 1) - (x (2 * i)) ^ (2 * k - 1)) = 1}
    (((fun n : ℕ => n) : ℕ → ℕ) n):=
  by
  have h_main : False:= by
    --  by_contra h
    have h₁ :
      ∃ x : ℕ → ℝ,
        StrictMono x ∧
          -1 < x 1 ∧
            x (2 * n) < 1 ∧
              ∀ k ∈ Icc 1 n, ∑ i in Finset.Icc 1 n, ((x (2 * i - 1) : ℝ) ^ (2 * k - 1) - (x (2 * i)) ^ (2 * k - 1)) = 1 := by sorry
    --  rcases h₁ with ⟨x, hx₁, hx₂, hx₃, hx₄⟩
    have h₂ : ∑ i in Finset.Icc 1 n, ((x (2 * i - 1) : ℝ) ^ (2 * 1 - 1) - (x (2 * i)) ^ (2 * 1 - 1)) = 1:=
      by
      have h₃ : (1 : ℕ) ∈ Icc 1 n:= by -- -- -- constructor <;> (try decide) <;> (try omega) <;> (try linarith)
        simpa
      have h₄ : ∑ i in Finset.Icc 1 n, ((x (2 * i - 1) : ℝ) ^ (2 * 1 - 1) - (x (2 * i)) ^ (2 * 1 - 1)) = 1:= by
        --  simpa using hx₄ 1 h₃
        hole
      --  exact h₄
      linarith
    have h₃ :
      ∑ i in Finset.Icc 1 n, ((x (2 * i - 1) : ℝ) ^ (2 * 1 - 1) - (x (2 * i)) ^ (2 * 1 - 1)) =
        ∑ i in Finset.Icc 1 n, (x (2 * i - 1) - x (2 * i)) := by sorry
    --  rw [h₃] at h₂
    have h₄ : ∑ i in Finset.Icc 1 n, (x (2 * i - 1) - x (2 * i)) < 0:=
      by
      have h₅ : ∀ i ∈ Finset.Icc 1 n, x (2 * i - 1) - x (2 * i) < 0:=
        by
        --  intro i hi
        have h₆ : (i : ℕ) ≥ 1:= by
          --  simp [Finset.mem_Icc] at hi
          --  linarith
          hole
        have h₇ : (i : ℕ) ≤ n:= by
          --  simp [Finset.mem_Icc] at hi
          --  linarith
          hole
        have h₈ : (2 * i - 1 : ℕ) < 2 * i:=
          by
          have h₉ : (i : ℕ) ≥ 1:= by
            --  simp [Finset.mem_Icc] at hi
            --  linarith
            linarith
          --  omega
          omega
        have h₉ : x (2 * i - 1) < x (2 * i):= by
          --  apply hx₁
          --  exact_mod_cast h₈
          hole
        --  linarith
        hole
      have h₆ : ∑ i in Finset.Icc 1 n, (x (2 * i - 1) - x (2 * i)) < 0:= by
        --  calc
        --    _ = ∑ i in Finset.Icc 1 n, (x (2 * i - 1) - x (2 * i)) := rfl
        --    _ < ∑ i in Finset.Icc 1 n, 0 := by
        --      apply Finset.sum_lt_sum_of_nonempty
        --      · exact Finset.nonempty_Icc.mpr (by omega)
        --      · intro i hi
        --        exact h₅ i hi
        --    _ = 0 := by simp
        hole
      --  exact h₆
      linarith
    --  linarith
    hole
  have h_absurd :
    IsGreatest
      {m : ℕ |
        ∃ x : ℕ → ℝ,
          StrictMono x ∧
            -1 < x 1 ∧
              x (2 * n) < 1 ∧
                ∀ k ∈ Icc 1 m, ∑ i in Finset.Icc 1 n, ((x (2 * i - 1) : ℝ) ^ (2 * k - 1) - (x (2 * i)) ^ (2 * k - 1)) = 1}
      (((fun n : ℕ => n) : ℕ → ℕ) n) := by sorry
  --  exact h_absurd
  norm_cast