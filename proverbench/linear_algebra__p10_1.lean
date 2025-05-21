theorem column_full_rank_iff_rank_eq_card :
∀ (A : Matrix m n K), column_full_rank A ↔ Matrix.rank A = Fintype.card n := by
  intro A
  have h₁ : column_full_rank A ↔ LinearIndependent K (fun i ↦ A i) := by
    rfl
    <;> simp [column_full_rank]
    <;> aesop
  
  have h₂ : LinearIndependent K (fun i ↦ A i) ↔ Function.Injective (LinearMap.mulVecLin A) := by
    have h₂₁ : LinearIndependent K (fun i ↦ A i) ↔ LinearMap.ker (LinearMap.mulVecLin A) = ⊥ := by
      rw [linearIndependent_iff]
      <;> simp [LinearMap.mulVecLin, LinearMap.ker_eq_bot']
      <;> simp_all [Function.funext_iff, Matrix.mulVec, Matrix.dotProduct, Finset.sum_apply]
      <;> aesop
    have h₂₂ : LinearMap.ker (LinearMap.mulVecLin A) = ⊥ ↔ Function.Injective (LinearMap.mulVecLin A) := by
      rw [LinearMap.ker_eq_bot']
      <;> simp [Function.Injective]
      <;> aesop
    rw [h₂₁, h₂₂]
    <;> aesop
  
  have h₃ : Function.Injective (LinearMap.mulVecLin A) ↔ Matrix.rank A = Fintype.card n := by
    have h₃₁ : Function.Injective (LinearMap.mulVecLin A) ↔ Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
      constructor
      · intro h_inj
        have h_inj' : Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
          have h₃₂ : Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
            -- Use the fact that `mulVecLin A` is injective to apply `rank_range_of_injective`
            have h₃₃ : Function.Injective (LinearMap.mulVecLin A) := h_inj
            have h₃₄ : Module.rank K (n → K) = Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
              apply LinearEquiv.lift_rank_eq_of_injective
              exact LinearMap.range_rangeRestrict (LinearMap.mulVecLin A) ▸ (LinearMap.ker_eq_bot.mp (LinearMap.ker_eq_bot_of_injective h₃₃))
            rw [h₃₄]
            <;> simp [LinearMap.range]
          exact h₃₂
        exact h_inj'
      · intro h_rank
        have h_inj : Function.Injective (LinearMap.mulVecLin A) := by
          -- Use the fact that `mulVecLin A` is injective to apply `rank_range_of_injective`
          have h₃₂ : Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := h_rank
          have h₃₃ : LinearMap.ker (LinearMap.mulVecLin A) = ⊥ := by
            have h₃₄ : Module.rank K (LinearMap.ker (LinearMap.mulVecLin A)) ≤ 0 := by
              -- Use the rank-nullity theorem to show that the kernel is trivial
              have h₃₅ : Module.rank K (n → K) = Module.rank K (LinearMap.ker (LinearMap.mulVecLin A)) + Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
                apply LinearMap.rank_range_add_rank_ker
              have h₃₆ : Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := h_rank
              have h₃₇ : Module.rank K (n → K) = Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
                apply le_antisymm
                · exact h₃₆
                · have h₃₈ : Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) ≤ Module.rank K (n → K) := by
                    apply rank_range_le
                  exact h₃₈
              rw [h₃₇] at h₃₅
              have h₃₉ : Module.rank K (LinearMap.ker (LinearMap.mulVecLin A)) + Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) = Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
                linarith
              have h₄₀ : Module.rank K (LinearMap.ker (LinearMap.mulVecLin A)) = 0 := by
                linarith
              have h₄₁ : Module.rank K (LinearMap.ker (LinearMap.mulVecLin A)) ≤ 0 := by
                linarith
              exact h₄₁
            have h₄₂ : Module.rank K (LinearMap.ker (LinearMap.mulVecLin A)) = 0 := by
              have h₄₃ : Module.rank K (LinearMap.ker (LinearMap.mulVecLin A)) ≤ 0 := h₃₄
              have h₄₄ : Module.rank K (LinearMap.ker (LinearMap.mulVecLin A)) ≥ 0 := by
                apply rank_nonneg
              linarith
            have h₄₅ : LinearMap.ker (LinearMap.mulVecLin A) = ⊥ := by
              have h₄₆ : Module.rank K (LinearMap.ker (LinearMap.mulVecLin A)) = 0 := h₄₂
              have h₄₇ : LinearMap.ker (LinearMap.mulVecLin A) = ⊥ := by
                rw [rank_zero_iff] at h₄₆
                exact h₄₆
              exact h₄₇
            exact h₄₅
          have h₄₈ : Function.Injective (LinearMap.mulVecLin A) := by
            rw [LinearMap.ker_eq_bot] at h₃₃
            exact h₃₃
          exact h₄₈
        exact h_inj
    have h₃₂ : Matrix.rank A = Fintype.card n ↔ Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
      constructor
      · intro h_rank
        have h₃₃ : Matrix.rank A = Fintype.card n := h_rank
        have h₃₄ : (Matrix.rank A : Cardinal) = (Fintype.card n : Cardinal) := by
          norm_cast at h₃₃ ⊢
          <;> simp_all [Matrix.rank]
          <;> aesop
        have h₃₅ : Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
          have h₃₆ : (Matrix.rank A : Cardinal) = Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
            simp [Matrix.rank]
          rw [h₃₆] at h₃₄
          have h₃₇ : (Fintype.card n : Cardinal) = Module.rank K (n → K) := by
            simp [rank_fun']
            <;> simp_all [Cardinal.lift_id]
            <;> aesop
          have h₃₈ : Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
            rw [← h₃₇] at h₃₄
            exact le_of_eq h₃₄
          exact h₃₈
        exact h₃₅
      · intro h_rank
        have h₃₃ : Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := h_rank
        have h₃₄ : (Matrix.rank A : Cardinal) = Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
          simp [Matrix.rank]
        have h₃₅ : (Fintype.card n : Cardinal) = Module.rank K (n → K) := by
          simp [rank_fun']
          <;> simp_all [Cardinal.lift_id]
          <;> aesop
        have h₃₆ : (Matrix.rank A : Cardinal) = (Fintype.card n : Cardinal) := by
          have h₃₇ : (Matrix.rank A : Cardinal) = Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
            simp [Matrix.rank]
          rw [h₃₇]
          have h₃₈ : (Fintype.card n : Cardinal) = Module.rank K (n → K) := by
            simp [rank_fun']
            <;> simp_all [Cardinal.lift_id]
            <;> aesop
          have h₃₉ : Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := h_rank
          have h₄₀ : Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) ≤ Module.rank K (n → K) := by
            have h₄₁ : Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) ≤ Module.rank K (m → K) := by
              apply rank_range_le
            have h₄₂ : Module.rank K (m → K) ≤ Module.rank K (n → K) := by
              -- Prove that the rank of m → K is less than or equal to the rank of n → K
              apply rank_le_domain
              <;> aesop
            have h₄₃ : Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) ≤ Module.rank K (n → K) := by
              linarith
            exact h₄₃
          have h₄₄ : Module.rank K (n → K) = Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
            apply le_antisymm
            · exact h₃₉
            · exact h₄₀
          rw [← h₄₄, h₃₈]
          <;> aesop
        have h₃₇ : Matrix.rank A = Fintype.card n := by
          norm_cast at h₃₆ ⊢
          <;> simp_all [Matrix.rank]
          <;> aesop
        exact h₃₇
    have h₃₃ : (Function.Injective (LinearMap.mulVecLin A) ↔ Matrix.rank A = Fintype.card n) := by
      constructor
      · intro h_inj
        have h₃₄ : Function.Injective (LinearMap.mulVecLin A) := h_inj
        have h₃₅ : Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
          have h₃₆ : Function.Injective (LinearMap.mulVecLin A) ↔ Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
            apply h₃₁
          rw [h₃₆] at h_inj
          exact h_inj
        have h₃₆ : Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := h₃₅
        have h₃₇ : Matrix.rank A = Fintype.card n := by
          have h₃₈ : Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) ↔ Matrix.rank A = Fintype.card n := by
            apply h₃₂
          rw [h₃₈] at h₃₅
          exact h₃₅
        exact h₃₇
      · intro h_rank
        have h₃₄ : Matrix.rank A = Fintype.card n := h_rank
        have h₃₅ : Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
          have h₃₆ : Matrix.rank A = Fintype.card n ↔ Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
            apply h₃₂
          rw [h₃₆] at h_rank
          exact h_rank
        have h₃₆ : Function.Injective (LinearMap.mulVecLin A) := by
          have h₃₇ : Function.Injective (LinearMap.mulVecLin A) ↔ Module.rank K (n → K) ≤ Module.rank K ↥(LinearMap.range (LinearMap.mulVecLin A)) := by
            apply h₃₁
          rw [h₃₇]
          exact h₃₅
        exact h₃₆
    exact h₃₃
  
  have h₄ : column_full_rank A ↔ Matrix.rank A = Fintype.card n := by
    rw [h₁]
    rw [h₂]
    rw [h₃]
    <;> aesop
  
  exact h₄