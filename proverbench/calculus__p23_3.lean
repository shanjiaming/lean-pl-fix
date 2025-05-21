theorem sequence_limit :
  Filter.Tendsto a_n Filter.atTop (nhds (1/3)) := by
  have h_main : Filter.Tendsto a_n Filter.atTop (nhds (1/3)) := by
    have h₁ : a_n = fun n => (1 + (2 / 3 : ℝ) ^ n) / (3 * (1 - (2 / 3 : ℝ) ^ (n + 1))) := by
      funext n
      rw [sequence_rewrite]
      <;> simp [a_n]
      <;> field_simp
      <;> ring
      <;> norm_num
      <;> simp_all [pow_add, pow_one, mul_assoc]
      <;> field_simp
      <;> ring
      <;> norm_num
  
    rw [h₁]
    have h₂ : Filter.Tendsto (fun n : ℕ => (2 / 3 : ℝ) ^ n) Filter.atTop (nhds 0) := geometric_limit
    have h₃ : Filter.Tendsto (fun n : ℕ => (2 / 3 : ℝ) ^ (n + 1)) Filter.atTop (nhds 0) := by
      have h₄ : (fun n : ℕ => (2 / 3 : ℝ) ^ (n + 1)) = (fun n : ℕ => (2 / 3 : ℝ) * (2 / 3 : ℝ) ^ n) := by
        funext n
        rw [pow_succ]
        <;> ring
      rw [h₄]
      have h₅ : Filter.Tendsto (fun n : ℕ => (2 / 3 : ℝ) * (2 / 3 : ℝ) ^ n) Filter.atTop (nhds ((2 / 3 : ℝ) * 0)) := by
        have h₅₁ : Filter.Tendsto (fun n : ℕ => (2 / 3 : ℝ) ^ n) Filter.atTop (nhds 0) := geometric_limit
        have h₅₂ : Filter.Tendsto (fun n : ℕ => (2 / 3 : ℝ) * (2 / 3 : ℝ) ^ n) Filter.atTop (nhds ((2 / 3 : ℝ) * 0)) := by
          convert Filter.Tendsto.const_mul (2 / 3 : ℝ) h₅₁ using 1
          <;> simp [mul_comm]
        exact h₅₂
      simpa using h₅
    have h₄ : Filter.Tendsto (fun n : ℕ => (1 + (2 / 3 : ℝ) ^ n : ℝ)) Filter.atTop (nhds (1 + 0)) := by
      have h₄₁ : Filter.Tendsto (fun n : ℕ => (2 / 3 : ℝ) ^ n) Filter.atTop (nhds 0) := geometric_limit
      have h₄₂ : Filter.Tendsto (fun n : ℕ => (1 + (2 / 3 : ℝ) ^ n : ℝ)) Filter.atTop (nhds (1 + 0)) := by
        convert Filter.Tendsto.const_add 1 h₄₁ using 1
        <;> simp
      exact h₄₂
    have h₅ : Filter.Tendsto (fun n : ℕ => (3 * (1 - (2 / 3 : ℝ) ^ (n + 1)) : ℝ)) Filter.atTop (nhds (3 * (1 - 0))) := by
      have h₅₁ : Filter.Tendsto (fun n : ℕ => (2 / 3 : ℝ) ^ (n + 1)) Filter.atTop (nhds 0) := h₃
      have h₅₂ : Filter.Tendsto (fun n : ℕ => (1 - (2 / 3 : ℝ) ^ (n + 1) : ℝ)) Filter.atTop (nhds (1 - 0)) := by
        have h₅₃ : Filter.Tendsto (fun n : ℕ => (2 / 3 : ℝ) ^ (n + 1)) Filter.atTop (nhds 0) := h₃
        have h₅₄ : Filter.Tendsto (fun n : ℕ => (1 - (2 / 3 : ℝ) ^ (n + 1) : ℝ)) Filter.atTop (nhds (1 - 0)) := by
          convert Filter.Tendsto.const_sub 1 h₅₃ using 1
          <;> simp
        exact h₅₄
      have h₅₅ : Filter.Tendsto (fun n : ℕ => (3 * (1 - (2 / 3 : ℝ) ^ (n + 1)) : ℝ)) Filter.atTop (nhds (3 * (1 - 0))) := by
        convert Filter.Tendsto.const_mul 3 h₅₂ using 1
        <;> simp
      exact h₅₅
    have h₆ : Filter.Tendsto (fun n : ℕ => (1 + (2 / 3 : ℝ) ^ n : ℝ) / (3 * (1 - (2 / 3 : ℝ) ^ (n + 1)) : ℝ)) Filter.atTop (nhds ((1 + 0) / (3 * (1 - 0)))) := by
      have h₆₁ : Filter.Tendsto (fun n : ℕ => (1 + (2 / 3 : ℝ) ^ n : ℝ)) Filter.atTop (nhds (1 + 0)) := h₄
      have h₆₂ : Filter.Tendsto (fun n : ℕ => (3 * (1 - (2 / 3 : ℝ) ^ (n + 1)) : ℝ)) Filter.atTop (nhds (3 * (1 - 0))) := h₅
      have h₆₃ : Filter.Tendsto (fun n : ℕ => (1 + (2 / 3 : ℝ) ^ n : ℝ) / (3 * (1 - (2 / 3 : ℝ) ^ (n + 1)) : ℝ)) Filter.atTop (nhds ((1 + 0) / (3 * (1 - 0)))) := by
        have h₆₄ : Filter.Tendsto (fun n : ℕ => (3 * (1 - (2 / 3 : ℝ) ^ (n + 1)) : ℝ)) Filter.atTop (nhds (3 * (1 - 0))) := h₅
        have h₆₅ : (3 * (1 - 0) : ℝ) ≠ 0 := by norm_num
        have h₆₆ : Filter.Tendsto (fun n : ℕ => (1 + (2 / 3 : ℝ) ^ n : ℝ) / (3 * (1 - (2 / 3 : ℝ) ^ (n + 1)) : ℝ)) Filter.atTop (nhds ((1 + 0) / (3 * (1 - 0)))) := by
          apply Filter.Tendsto.div h₄ h₅
          <;> norm_num
        exact h₆₆
      exact h₆₃
    have h₇ : Filter.Tendsto (fun n : ℕ => (1 + (2 / 3 : ℝ) ^ n : ℝ) / (3 * (1 - (2 / 3 : ℝ) ^ (n + 1)) : ℝ)) Filter.atTop (nhds (1 / 3)) := by
      convert h₆ using 1
      <;> norm_num
    exact h₇
  exact h_main