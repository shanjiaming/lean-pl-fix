theorem putnam_1994_a4
  (A B : Matrix (Fin 2) (Fin 2) ℤ)
  (ABinv : Nonempty (Invertible A) ∧
    Nonempty (Invertible (A + B)) ∧
    Nonempty (Invertible (A + 2 * B)) ∧
    Nonempty (Invertible (A + 3 * B)) ∧
    Nonempty (Invertible (A + 4 * B)))
  : Nonempty (Invertible (A + 5 * B)) := by
  have h_det_A : A.det = 1 ∨ A.det = -1 := by
    have h₁ : IsUnit A.det := by
      
      have h₂ : Invertible A := ABinv.1.some
      have h₃ : IsUnit A.det := by
        
        admit
      admit
    
    have h₂ : A.det = 1 ∨ A.det = -1 := by
      admit
    admit
  
  have h_det_AB : (A + B).det = 1 ∨ (A + B).det = -1 := by
    have h₁ : IsUnit (A + B).det := by
      have h₂ : Invertible (A + B) := ABinv.2.1.some
      have h₃ : IsUnit (A + B).det := by
        admit
      admit
    have h₂ : (A + B).det = 1 ∨ (A + B).det = -1 := by
      admit
    admit
  
  have h_det_A2B : (A + 2 * B).det = 1 ∨ (A + 2 * B).det = -1 := by
    have h₁ : IsUnit (A + 2 * B).det := by
      have h₂ : Invertible (A + 2 * B) := ABinv.2.2.1.some
      have h₃ : IsUnit (A + 2 * B).det := by
        admit
      admit
    have h₂ : (A + 2 * B).det = 1 ∨ (A + 2 * B).det = -1 := by
      admit
    admit
  
  have h_det_A3B : (A + 3 * B).det = 1 ∨ (A + 3 * B).det = -1 := by
    have h₁ : IsUnit (A + 3 * B).det := by
      have h₂ : Invertible (A + 3 * B) := ABinv.2.2.2.1.some
      have h₃ : IsUnit (A + 3 * B).det := by
        admit
      admit
    have h₂ : (A + 3 * B).det = 1 ∨ (A + 3 * B).det = -1 := by
      admit
    admit
  
  have h_det_A4B : (A + 4 * B).det = 1 ∨ (A + 4 * B).det = -1 := by
    have h₁ : IsUnit (A + 4 * B).det := by
      have h₂ : Invertible (A + 4 * B) := ABinv.2.2.2.2.some
      have h₃ : IsUnit (A + 4 * B).det := by
        admit
      admit
    have h₂ : (A + 4 * B).det = 1 ∨ (A + 4 * B).det = -1 := by
      admit
    admit
  
  have h_c : A.det = 1 ∨ A.det = -1 := by
    admit
  
  have h_d : A 0 0 * B 1 1 + A 1 1 * B 0 0 - A 0 1 * B 1 0 - A 1 0 * B 0 1 = 0 := by
    have h₁ : A.det = A 0 0 * A 1 1 - A 0 1 * A 1 0 := by
      admit
    have h₂ : (A + B).det = (A 0 0 + B 0 0) * (A 1 1 + B 1 1) - (A 0 1 + B 0 1) * (A 1 0 + B 1 0) := by
      admit
    have h₃ : (A + 2 * B).det = (A 0 0 + 2 * B 0 0) * (A 1 1 + 2 * B 1 1) - (A 0 1 + 2 * B 0 1) * (A 1 0 + 2 * B 1 0) := by
      admit
    have h₄ : (A + 3 * B).det = (A 0 0 + 3 * B 0 0) * (A 1 1 + 3 * B 1 1) - (A 0 1 + 3 * B 0 1) * (A 1 0 + 3 * B 1 0) := by
      admit
    have h₅ : (A + 4 * B).det = (A 0 0 + 4 * B 0 0) * (A 1 1 + 4 * B 1 1) - (A 0 1 + 4 * B 0 1) * (A 1 0 + 4 * B 1 0) := by
      admit
    have h₆ : B.det = B 0 0 * B 1 1 - B 0 1 * B 1 0 := by
      admit
    
    have h₇ : A 0 0 * B 1 1 + A 1 1 * B 0 0 - A 0 1 * B 1 0 - A 1 0 * B 0 1 = 0 := by
      
      have h₇₁ : A.det = 1 ∨ A.det = -1 := h_det_A
      have h₇₂ : (A + B).det = 1 ∨ (A + B).det = -1 := h_det_AB
      have h₇₃ : (A + 2 * B).det = 1 ∨ (A + 2 * B).det = -1 := h_det_A2B
      have h₇₄ : (A + 3 * B).det = 1 ∨ (A + 3 * B).det = -1 := h_det_A3B
      have h₇₅ : (A + 4 * B).det = 1 ∨ (A + 4 * B).det = -1 := h_det_A4B
      
      have h₇₆ : A.det = A 0 0 * A 1 1 - A 0 1 * A 1 0 := by
        admit
      have h₇₇ : (A + B).det = (A 0 0 + B 0 0) * (A 1 1 + B 1 1) - (A 0 1 + B 0 1) * (A 1 0 + B 1 0) := by
        admit
      have h₇₈ : (A + 2 * B).det = (A 0 0 + 2 * B 0 0) * (A 1 1 + 2 * B 1 1) - (A 0 1 + 2 * B 0 1) * (A 1 0 + 2 * B 1 0) := by
        admit
      have h₇₉ : (A + 3 * B).det = (A 0 0 + 3 * B 0 0) * (A 1 1 + 3 * B 1 1) - (A 0 1 + 3 * B 0 1) * (A 1 0 + 3 * B 1 0) := by
        admit
      have h₈₀ : (A + 4 * B).det = (A 0 0 + 4 * B 0 0) * (A 1 1 + 4 * B 1 1) - (A 0 1 + 4 * B 0 1) * (A 1 0 + 4 * B 1 0) := by
        simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
        <;> ring
        <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
        <;> ring_nf at *
        <;> omega
      
      have h₈₁ : A 0 0 * B 1 1 + A 1 1 * B 0 0 - A 0 1 * B 1 0 - A 1 0 * B 0 1 = 0 := by
        
        have h₈₂ : A.det = 1 ∨ A.det = -1 := h_det_A
        have h₈₃ : (A + B).det = 1 ∨ (A + B).det = -1 := h_det_AB
        have h₈₄ : (A + 2 * B).det = 1 ∨ (A + 2 * B).det = -1 := h_det_A2B
        have h₈₅ : (A + 3 * B).det = 1 ∨ (A + 3 * B).det = -1 := h_det_A3B
        have h₈₆ : (A + 4 * B).det = 1 ∨ (A + 4 * B).det = -1 := h_det_A4B
        
        have h₈₇ : A.det = A 0 0 * A 1 1 - A 0 1 * A 1 0 := by
          simp [Matrix.det_fin_two]
          <;> ring
        have h₈₈ : (A + B).det = (A 0 0 + B 0 0) * (A 1 1 + B 1 1) - (A 0 1 + B 0 1) * (A 1 0 + B 1 0) := by
          simp [Matrix.det_fin_two, Matrix.add_apply]
          <;> ring
        have h₈₉ : (A + 2 * B).det = (A 0 0 + 2 * B 0 0) * (A 1 1 + 2 * B 1 1) - (A 0 1 + 2 * B 0 1) * (A 1 0 + 2 * B 1 0) := by
          simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;> ring
          <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;> ring_nf at *
          <;> omega
        have h₉₀ : (A + 3 * B).det = (A 0 0 + 3 * B 0 0) * (A 1 1 + 3 * B 1 1) - (A 0 1 + 3 * B 0 1) * (A 1 0 + 3 * B 1 0) := by
          simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;> ring
          <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;> ring_nf at *
          <;> omega
        have h₉₁ : (A + 4 * B).det = (A 0 0 + 4 * B 0 0) * (A 1 1 + 4 * B 1 1) - (A 0 1 + 4 * B 0 1) * (A 1 0 + 4 * B 1 0) := by
          simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;> ring
          <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;> ring_nf at *
          <;> omega
        
        have h₉₂ : A 0 0 * B 1 1 + A 1 1 * B 0 0 - A 0 1 * B 1 0 - A 1 0 * B 0 1 = 0 := by
          
          have h₉₃ : A.det = 1 ∨ A.det = -1 := h_det_A
          have h₉₄ : (A + B).det = 1 ∨ (A + B).det = -1 := h_det_AB
          have h₉₅ : (A + 2 * B).det = 1 ∨ (A + 2 * B).det = -1 := h_det_A2B
          have h₉₆ : (A + 3 * B).det = 1 ∨ (A + 3 * B).det = -1 := h_det_A3B
          have h₉₇ : (A + 4 * B).det = 1 ∨ (A + 4 * B).det = -1 := h_det_A4B
          
          have h₉₈ : A.det = A 0 0 * A 1 1 - A 0 1 * A 1 0 := by
            simp [Matrix.det_fin_two]
            <;> ring
          have h₉₉ : (A + B).det = (A 0 0 + B 0 0) * (A 1 1 + B 1 1) - (A 0 1 + B 0 1) * (A 1 0 + B 1 0) := by
            simp [Matrix.det_fin_two, Matrix.add_apply]
            <;> ring
          have h₁₀₀ : (A + 2 * B).det = (A 0 0 + 2 * B 0 0) * (A 1 1 + 2 * B 1 1) - (A 0 1 + 2 * B 0 1) * (A 1 0 + 2 * B 1 0) := by
            simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
            <;> ring
            <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
            <;> ring_nf at *
            <;> omega
          have h₁₀₁ : (A + 3 * B).det = (A 0 0 + 3 * B 0 0) * (A 1 1 + 3 * B 1 1) - (A 0 1 + 3 * B 0 1) * (A 1 0 + 3 * B 1 0) := by
            simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
            <;> ring
            <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
            <;> ring_nf at *
            <;> omega
          have h₁₀₂ : (A + 4 * B).det = (A 0 0 + 4 * B 0 0) * (A 1 1 + 4 * B 1 1) - (A 0 1 + 4 * B 0 1) * (A 1 0 + 4 * B 1 0) := by
            simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
            <;> ring
            <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
            <;> ring_nf at *
            <;> omega
          
          have h₁₀₃ : A 0 0 * B 1 1 + A 1 1 * B 0 0 - A 0 1 * B 1 0 - A 1 0 * B 0 1 = 0 := by
            
            have h₁₀₄ : A.det = 1 ∨ A.det = -1 := h_det_A
            have h₁₀₅ : (A + B).det = 1 ∨ (A + B).det = -1 := h_det_AB
            have h₁₀₆ : (A + 2 * B).det = 1 ∨ (A + 2 * B).det = -1 := h_det_A2B
            have h₁₀₇ : (A + 3 * B).det = 1 ∨ (A + 3 * B).det = -1 := h_det_A3B
            have h₁₀₈ : (A + 4 * B).det = 1 ∨ (A + 4 * B).det = -1 := h_det_A4B
            
            have h₁₀₉ : A.det = A 0 0 * A 1 1 - A 0 1 * A 1 0 := by
              simp [Matrix.det_fin_two]
              <;> ring
            have h₁₁₀ : (A + B).det = (A 0 0 + B 0 0) * (A 1 1 + B 1 1) - (A 0 1 + B 0 1) * (A 1 0 + B 1 0) := by
              simp [Matrix.det_fin_two, Matrix.add_apply]
              <;> ring
            have h₁₁₁ : (A + 2 * B).det = (A 0 0 + 2 * B 0 0) * (A 1 1 + 2 * B 1 1) - (A 0 1 + 2 * B 0 1) * (A 1 0 + 2 * B 1 0) := by
              simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
              <;> ring
              <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
              <;> ring_nf at *
              <;> omega
            have h₁₁₂ : (A + 3 * B).det = (A 0 0 + 3 * B 0 0) * (A 1 1 + 3 * B 1 1) - (A 0 1 + 3 * B 0 1) * (A 1 0 + 3 * B 1 0) := by
              simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
              <;> ring
              <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
              <;> ring_nf at *
              <;> omega
            have h₁₁₃ : (A + 4 * B).det = (A 0 0 + 4 * B 0 0) * (A 1 1 + 4 * B 1 1) - (A 0 1 + 4 * B 0 1) * (A 1 0 + 4 * B 1 0) := by
              simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
              <;> ring
              <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
              <;> ring_nf at *
              <;> omega
            
            have h₁₁₄ : A 0 0 * B 1 1 + A 1 1 * B 0 0 - A 0 1 * B 1 0 - A 1 0 * B 0 1 = 0 := by
              
              omega
            exact h₁₁₄
          exact h₁₀₃
        exact h₉₂
      exact h₈₁
    exact h₇
  
  have h_e : B.det = 0 := by
    have h₁ : A.det = 1 ∨ A.det = -1 := h_det_A
    have h₂ : (A + B).det = 1 ∨ (A + B).det = -1 := h_det_AB
    have h₃ : (A + 2 * B).det = 1 ∨ (A + 2 * B).det = -1 := h_det_A2B
    have h₄ : (A + 3 * B).det = 1 ∨ (A + 3 * B).det = -1 := h_det_A3B
    have h₅ : (A + 4 * B).det = 1 ∨ (A + 4 * B).det = -1 := h_det_A4B
    have h₆ : A 0 0 * B 1 1 + A 1 1 * B 0 0 - A 0 1 * B 1 0 - A 1 0 * B 0 1 = 0 := h_d
    have h₇ : B.det = B 0 0 * B 1 1 - B 0 1 * B 1 0 := by
      simp [Matrix.det_fin_two]
      <;> ring
    have h₈ : (A + B).det = (A 0 0 + B 0 0) * (A 1 1 + B 1 1) - (A 0 1 + B 0 1) * (A 1 0 + B 1 0) := by
      simp [Matrix.det_fin_two, Matrix.add_apply]
      <;> ring
    have h₉ : (A + 2 * B).det = (A 0 0 + 2 * B 0 0) * (A 1 1 + 2 * B 1 1) - (A 0 1 + 2 * B 0 1) * (A 1 0 + 2 * B 1 0) := by
      simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
      <;> ring
      <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
      <;> ring_nf at *
      <;> omega
    have h₁₀ : (A + 3 * B).det = (A 0 0 + 3 * B 0 0) * (A 1 1 + 3 * B 1 1) - (A 0 1 + 3 * B 0 1) * (A 1 0 + 3 * B 1 0) := by
      simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
      <;> ring
      <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
      <;> ring_nf at *
      <;> omega
    have h₁₁ : (A + 4 * B).det = (A 0 0 + 4 * B 0 0) * (A 1 1 + 4 * B 1 1) - (A 0 1 + 4 * B 0 1) * (A 1 0 + 4 * B 1 0) := by
      simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
      <;> ring
      <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
      <;> ring_nf at *
      <;> omega
    
    have h₁₂ : B.det = 0 := by
      
      have h₁₃ : A 0 0 * B 1 1 + A 1 1 * B 0 0 - A 0 1 * B 1 0 - A 1 0 * B 0 1 = 0 := h_d
      have h₁₄ : B.det = B 0 0 * B 1 1 - B 0 1 * B 1 0 := by
        simp [Matrix.det_fin_two]
        <;> ring
      have h₁₅ : (A + B).det = (A 0 0 + B 0 0) * (A 1 1 + B 1 1) - (A 0 1 + B 0 1) * (A 1 0 + B 1 0) := by
        simp [Matrix.det_fin_two, Matrix.add_apply]
        <;> ring
      have h₁₆ : (A + 2 * B).det = (A 0 0 + 2 * B 0 0) * (A 1 1 + 2 * B 1 1) - (A 0 1 + 2 * B 0 1) * (A 1 0 + 2 * B 1 0) := by
        simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
        <;> ring
        <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
        <;> ring_nf at *
        <;> omega
      have h₁₇ : (A + 3 * B).det = (A 0 0 + 3 * B 0 0) * (A 1 1 + 3 * B 1 1) - (A 0 1 + 3 * B 0 1) * (A 1 0 + 3 * B 1 0) := by
        simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
        <;> ring
        <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
        <;> ring_nf at *
        <;> omega
      have h₁₈ : (A + 4 * B).det = (A 0 0 + 4 * B 0 0) * (A 1 1 + 4 * B 1 1) - (A 0 1 + 4 * B 0 1) * (A 1 0 + 4 * B 1 0) := by
        simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
        <;> ring
        <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
        <;> ring_nf at *
        <;> omega
      
      have h₁₉ : B.det = 0 := by
        
        have h₂₀ : A 0 0 * B 1 1 + A 1 1 * B 0 0 - A 0 1 * B 1 0 - A 1 0 * B 0 1 = 0 := h_d
        have h₂₁ : B.det = B 0 0 * B 1 1 - B 0 1 * B 1 0 := by
          simp [Matrix.det_fin_two]
          <;> ring
        have h₂₂ : (A + B).det = (A 0 0 + B 0 0) * (A 1 1 + B 1 1) - (A 0 1 + B 0 1) * (A 1 0 + B 1 0) := by
          simp [Matrix.det_fin_two, Matrix.add_apply]
          <;> ring
        have h₂₃ : (A + 2 * B).det = (A 0 0 + 2 * B 0 0) * (A 1 1 + 2 * B 1 1) - (A 0 1 + 2 * B 0 1) * (A 1 0 + 2 * B 1 0) := by
          simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;> ring
          <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;> ring_nf at *
          <;> omega
        have h₂₄ : (A + 3 * B).det = (A 0 0 + 3 * B 0 0) * (A 1 1 + 3 * B 1 1) - (A 0 1 + 3 * B 0 1) * (A 1 0 + 3 * B 1 0) := by
          simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;> ring
          <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;> ring_nf at *
          <;> omega
        have h₂₅ : (A + 4 * B).det = (A 0 0 + 4 * B 0 0) * (A 1 1 + 4 * B 1 1) - (A 0 1 + 4 * B 0 1) * (A 1 0 + 4 * B 1 0) := by
          simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;> ring
          <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;> ring_nf at *
          <;> omega
        
        have h₂₆ : B.det = 0 := by
          
          omega
        exact h₂₆
      exact h₁₉
    exact h₁₂
  
  have h_det_A5B : (A + 5 * B).det = 1 ∨ (A + 5 * B).det = -1 := by
    have h₁ : A.det = 1 ∨ A.det = -1 := h_det_A
    have h₂ : (A + B).det = 1 ∨ (A + B).det = -1 := h_det_AB
    have h₃ : (A + 2 * B).det = 1 ∨ (A + 2 * B).det = -1 := h_det_A2B
    have h₄ : (A + 3 * B).det = 1 ∨ (A + 3 * B).det = -1 := h_det_A3B
    have h₅ : (A + 4 * B).det = 1 ∨ (A + 4 * B).det = -1 := h_det_A4B
    have h₆ : A 0 0 * B 1 1 + A 1 1 * B 0 0 - A 0 1 * B 1 0 - A 1 0 * B 0 1 = 0 := h_d
    have h₇ : B.det = 0 := h_e
    have h₈ : (A + 5 * B).det = A.det := by
      have h₈₁ : (A + 5 * B).det = (A 0 0 + 5 * B 0 0) * (A 1 1 + 5 * B 1 1) - (A 0 1 + 5 * B 0 1) * (A 1 0 + 5 * B 1 0) := by
        simp [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
        <;> ring
        <;> simp_all [Matrix.det_fin_two, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
        <;> ring_nf at *
        <;> omega
      have h₈₂ : A.det = A 0 0 * A 1 1 - A 0 1 * A 1 0 := by
        simp [Matrix.det_fin_two]
        <;> ring
      have h₈₃ : B.det = B 0 0 * B 1 1 - B 0 1 * B 1 0 := by
        simp [Matrix.det_fin_two]
        <;> ring
      have h₈₄ : A 0 0 * B 1 1 + A 1 1 * B 0 0 - A 0 1 * B 1 0 - A 1 0 * B 0 1 = 0 := h_d
      have h₈₅ : B.det = 0 := h_e
      have h₈₆ : (A + 5 * B).det = (A 0 0 + 5 * B 0 0) * (A 1 1 + 5 * B 1 1) - (A 0 1 + 5 * B 0 1) * (A 1 0 + 5 * B 1 0) := h₈₁
      have h₈₇ : A.det = A 0 0 * A 1 1 - A 0 1 * A 1 0 := h₈₂
      have h₈₈ : B.det = B 0 0 * B 1 1 - B 0 1 * B 1 0 := h₈₃
      have h₈₉ : A 0 0 * B 1 1 + A 1 1 * B 0 0 - A 0 1 * B 1 0 - A 1 0 * B 0 1 = 0 := h₈₄
      have h₉₀ : B.det = 0 := h₈₅
      calc
        (A + 5 * B).det = (A 0 0 + 5 * B 0 0) * (A 1 1 + 5 * B 1 1) - (A 0 1 + 5 * B 0 1) * (A 1 0 + 5 * B 1 0) := by rw [h₈₆]
        _ = A 0 0 * A 1 1 - A 0 1 * A 1 0 := by
          ring_nf at *
          <;> nlinarith [sq_nonneg (A 0 0), sq_nonneg (A 0 1), sq_nonneg (A 1 0), sq_nonneg (A 1 1),
            sq_nonneg (B 0 0), sq_nonneg (B 0 1), sq_nonneg (B 1 0), sq_nonneg (B 1 1)]
        _ = A.det := by rw [h₈₇]
    cases h₁ with
    | inl h₁ =>
      have h₉ : (A + 5 * B).det = 1 := by
        rw [h₈]
        <;> simp [h₁]
      exact Or.inl h₉
    | inr h₁ =>
      have h₉ : (A + 5 * B).det = -1 := by
        rw [h₈]
        <;> simp [h₁]
      exact Or.inr h₉
  
  have h_main : Nonempty (Invertible (A + 5 * B)) := by
    have h₁ : (A + 5 * B).det = 1 ∨ (A + 5 * B).det = -1 := h_det_A5B
    have h₂ : IsUnit (A + 5 * B).det := by
      cases h₁ with
      | inl h₁ =>
        rw [h₁]
        <;> norm_num
      | inr h₁ =>
        rw [h₁]
        <;> norm_num
    have h₃ : IsUnit (Matrix.det (A + 5 * B)) := h₂
    have h₄ : Invertible (A + 5 * B) := by
      apply Matrix.invertibleOfIsUnitDet _ h₃
    exact ⟨h₄⟩
  
  exact h_main