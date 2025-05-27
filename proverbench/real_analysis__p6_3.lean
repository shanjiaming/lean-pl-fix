theorem comparison_series_diverges : ¬ Summable comparison_series := by
  have h₁ : ¬ Summable (fun n : ℕ ↦ (1 : ℝ) / (n + 1)) := by
    intro h
    have h₂ : Summable (fun n : ℕ ↦ (1 : ℝ) / n) := by
      have h₃ : (fun n : ℕ ↦ (1 : ℝ) / n) = fun n : ℕ ↦ if n = 0 then 0 else (1 : ℝ) / n := by
        ext n
        by_cases hn : n = 0
        · simp [hn]
        · simp [hn]
          <;> field_simp [hn]
          <;> ring
      rw [h₃]
      have h₄ : Summable (fun n : ℕ ↦ if n = 0 then 0 else (1 : ℝ) / n) := by
        have h₅ : (fun n : ℕ ↦ if n = 0 then 0 else (1 : ℝ) / n) = fun n : ℕ ↦ (1 : ℝ) / (n + 1) ∘ (fun n : ℕ ↦ n + 1) := by
          ext n
          simp [Nat.cast_add, Nat.cast_one, add_comm]
          <;> field_simp [Nat.cast_add, Nat.cast_one, add_comm]
          <;> ring
          <;> simp_all [Nat.cast_add, Nat.cast_one, add_comm]
          <;> field_simp [Nat.cast_add, Nat.cast_one, add_comm]
          <;> ring
        rw [h₅]
        exact h.comp_injective (fun a b h => by simpa using h)
      exact h₄
    exact Real.not_summable_one_div_natCast h₂
    <;> simp_all [Nat.cast_add, Nat.cast_one, add_comm]
    <;> field_simp [Nat.cast_add, Nat.cast_one, add_comm]
    <;> ring
    <;> simp_all [Nat.cast_add, Nat.cast_one, add_comm]
    <;> field_simp [Nat.cast_add, Nat.cast_one, add_comm]
    <;> ring
  
  have h₂ : ¬ Summable (fun n : ℕ+ ↦ (1 : ℝ) / (n : ℝ)) := by
    intro h
    have h₃ : Summable (fun n : ℕ ↦ (1 : ℝ) / (n + 1 : ℝ)) := by
      have h₄ : (fun n : ℕ ↦ (1 : ℝ) / (n + 1 : ℝ)) = (fun n : ℕ ↦ (1 : ℝ) / ((n : ℕ+) : ℝ)) ∘ (fun n : ℕ ↦ (⟨n + 1, by simp⟩ : ℕ+)) := by
        ext n
        simp [Nat.cast_add, Nat.cast_one, add_comm]
        <;> field_simp [Nat.cast_add, Nat.cast_one, add_comm]
        <;> ring
        <;> simp_all [Nat.cast_add, Nat.cast_one, add_comm]
        <;> field_simp [Nat.cast_add, Nat.cast_one, add_comm]
        <;> ring
      rw [h₄]
      exact h.comp_injective (fun a b h => by simpa [Subtype.ext_iff] using h)
    exact h₁ h₃
  
  have h₃ : ¬ Summable (fun n : ℕ+ ↦ (1 : ℝ) / (2 * (n : ℝ))) := by
    intro h
    have h₄ : Summable (fun n : ℕ+ ↦ (1 : ℝ) / (n : ℝ)) := by
      have h₅ : (fun n : ℕ+ ↦ (1 : ℝ) / (n : ℝ)) = fun n : ℕ+ ↦ 2 * ((1 : ℝ) / (2 * (n : ℝ))) := by
        ext n
        field_simp [mul_comm]
        <;> ring_nf
        <;> field_simp [mul_comm]
        <;> ring_nf
      rw [h₅]
      have h₆ : Summable (fun n : ℕ+ ↦ 2 * ((1 : ℝ) / (2 * (n : ℝ)))) := by
        -- Use the fact that the series is summable to conclude the proof
        convert h.const_smul (2 : ℝ) using 1
        <;> ext n
        <;> field_simp [mul_comm]
        <;> ring_nf
        <;> field_simp [mul_comm]
        <;> ring_nf
      exact h₆
    exact h₂ h₄
  
  have h₄ : ¬ Summable comparison_series := by
    intro h
    have h₅ : Summable (fun n : ℕ+ ↦ (1 : ℝ) / (2 * (n : ℝ))) := by
      have h₆ : (fun n : ℕ+ ↦ (1 : ℝ) / (2 * (n : ℝ))) = (fun n : ℕ+ ↦ ((comparison_series n : ℝ≥0) : ℝ)) := by
        ext n
        simp [comparison_series, general_term, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_ofNat]
        <;> field_simp [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_ofNat]
        <;> ring_nf
        <;> norm_num
        <;> simp_all [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_ofNat]
        <;> field_simp [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_ofNat]
        <;> ring_nf
        <;> norm_num
      rw [h₆]
      exact NNReal.summable_coe.mp h
    exact h₃ h₅
  
  exact h₄