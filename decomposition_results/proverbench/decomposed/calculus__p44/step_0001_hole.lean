theorem limit_of_function_at_zero  : Tendsto (fun x => (1 - Real.cos x ^ Real.sin x) / x ^ 3) (𝓝 0) (𝓝 (1 / 2)) :=
  by
  have h_main : Tendsto (fun x => (1 - (Real.cos x) ^ (Real.sin x)) / x ^ 3) (𝓝[≠] 0) (𝓝 (1 / 2)) := by sorry
  have h_final : Tendsto (fun x => (1 - (Real.cos x) ^ (Real.sin x)) / x ^ 3) (𝓝 0) (𝓝 (1 / 2)) :=
    by
    have h₁ : Tendsto (fun x => (1 - (Real.cos x) ^ (Real.sin x)) / x ^ 3) (𝓝[≠] 0) (𝓝 (1 / 2)) := h_main
    have h₂ : Tendsto (fun x => (1 - (Real.cos x) ^ (Real.sin x)) / x ^ 3) (𝓝 0) (𝓝 (1 / 2)) :=
      by
      apply tendsto_inf.2 ⟨?_, h₁⟩
      ·
        have h₃ :
          (fun x => (1 - (Real.cos x) ^ (Real.sin x)) / x ^ 3) =ᶠ[𝓝 0]
            (fun x => (1 - (Real.cos x) ^ (Real.sin x)) / x ^ 3) :=
          by rfl
        have h₄ : Tendsto (fun x => (1 - (Real.cos x) ^ (Real.sin x)) / x ^ 3) (𝓝 0) (𝓝 (1 / 2)) :=
          by
          have h₅ : Tendsto (fun x => (1 - (Real.cos x) ^ (Real.sin x)) / x ^ 3) (𝓝 0) (𝓝 (1 / 2)) :=
            by
            have h₆ : Tendsto (fun x => (1 - (Real.cos x) ^ (Real.sin x)) / x ^ 3) (𝓝[≠] 0) (𝓝 (1 / 2)) := h_main
            have h₇ : Tendsto (fun x => (1 - (Real.cos x) ^ (Real.sin x)) / x ^ 3) (𝓝 0) (𝓝 (1 / 2)) := by apply?
            exact h₇
          exact h₅
        exact h₄
    exact h₂
  --  exact h_final
  hole