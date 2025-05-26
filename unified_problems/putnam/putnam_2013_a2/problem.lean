theorem putnam_2013_a2
  (S : Set ℤ)
  (hS : S = {n : ℤ | n > 0 ∧ ¬∃ m : ℤ, m ^ 2 = n})
  (P : ℤ → List ℤ → Prop)
  (hP : ∀ n a, P n a ↔
    a.length > 0 ∧ n < a[0]! ∧
    (∃ m : ℤ, m ^ 2 = n * a.prod) ∧
    (∀ i : Fin (a.length - 1), a[i] < a[i+(1:ℕ)]))
  (T : ℤ → Set ℤ)
  (hT : T = fun n : ℤ => {m : ℤ | ∃ a : List ℤ, P n a ∧ a[a.length - 1]! = m})
  (f : ℤ → ℤ)
  (hf : ∀ n ∈ S, ((∃ r ∈ T n, f n = r) ∧ ∀ r ∈ T n, f n ≤ r)) :
  InjOn f S := by
  have h₁ : ∀ n ∈ S, f n ∈ T n := by
    intro n hn
    have h₂ : ∃ r ∈ T n, f n = r := (hf n hn).1
    obtain ⟨r, hr, hfr⟩ := h₂
    have h₃ : f n ∈ T n := by
      rw [hfr]
      exact hr
    exact h₃
  
  have h₂ : ∀ n ∈ S, ∀ r ∈ T n, f n ≤ r := by
    intro n hn r hr
    have h₃ : ∀ r ∈ T n, f n ≤ r := (hf n hn).2
    exact h₃ r hr
  
  have h₃ : InjOn f S := by
    rw [InjOn]
    intro n₁ hn₁ n₂ hn₂ hf₁
    have h₄ : n₁ ∈ S := hn₁
    have h₅ : n₂ ∈ S := hn₂
    have h₆ : f n₁ = f n₂ := hf₁
    have h₇ : f n₁ ∈ T n₁ := h₁ n₁ h₄
    have h₈ : f n₂ ∈ T n₂ := h₁ n₂ h₅
    have h₉ : ∀ r ∈ T n₁, f n₁ ≤ r := h₂ n₁ h₄
    have h₁₀ : ∀ r ∈ T n₂, f n₂ ≤ r := h₂ n₂ h₅
    have h₁₁ : n₁ = n₂ := by
      by_contra h₁₂
      -- Assume for contradiction that n₁ ≠ n₂
      have h₁₃ : n₁ > 0 := ((Set.mem_setOf.mp (by simpa [hS] using h₄))).1
      have h₁₄ : n₂ > 0 := ((Set.mem_setOf.mp (by simpa [hS] using h₅))).1
      have h₁₅ : ¬∃ m : ℤ, m ^ 2 = n₁ := ((Set.mem_setOf.mp (by simpa [hS] using h₄))).2
      have h₁₆ : ¬∃ m : ℤ, m ^ 2 = n₂ := ((Set.mem_setOf.mp (by simpa [hS] using h₅))).2
      exfalso
      -- Use specific properties of P and T to derive a contradiction
      have h₁₇ := hP n₁ []
      have h₁₈ := hP n₂ []
      have h₁₉ := hP 0 []
      have h₂₀ := hP 1 []
      have h₂₁ := hP 4 []
      have h₂₂ := hP (-1) []
      have h₂₃ := hP 2 [3, 6]
      have h₂₄ := hP 3 [4, 6]
      have h₂₅ := hP 8 [16, 8]
      have h₂₆ := hP 2 [4, 6, 9]
      have h₂₇ := hP 3 [6, 12]
      have h₂₈ := hP 2 [8]
      norm_num [List.prod_cons, List.prod_nil, List.length, List.get] at h₁₇ h₁₈ h₁₉ h₂₀ h₂₁ h₂₂ h₂₃ h₂₄ h₂₅ h₂₆ h₂₇ h₂₈
      <;>
      (try norm_num) <;>
      (try omega) <;>
      (try {
        simp_all [hT, hP, List.prod_cons, List.prod_nil, List.length, List.get]
        <;>
        norm_num at *
        <;>
        (try omega)
      })
      <;>
      (try simp_all [hT, hP, List.prod_cons, List.prod_nil, List.length, List.get])
      <;>
      (try norm_num at *)
      <;>
      (try omega)
      <;>
      (try {
        exfalso
        apply h₁₅
        <;>
        use 1
        <;>
        norm_num
        <;>
        linarith
      })
      <;>
      (try {
        exfalso
        apply h₁₆
        <;>
        use 1
        <;>
        norm_num
        <;>
        linarith
      })
    exact h₁₁
  exact h₃