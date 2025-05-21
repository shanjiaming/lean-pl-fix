theorem commutative_ring_of_cube_equals_self
  (h : ∀ a : R, a^3 = a) :
  ∀ a b : R, a * b = b * a := by
  have h6 : ∀ (a : R), 6 • a = 0 := by
    intro a
    have h₁ : (2 : ℕ) • a * ((2 : ℕ) • a * ((2 : ℕ) • a)) = (2 : ℕ) • a := by
      have h₂ := h ((2 : ℕ) • a)
      simp [pow_three, mul_assoc, mul_add, add_mul, mul_comm, mul_left_comm, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat] at h₂ ⊢
      <;> ring_nf at h₂ ⊢ <;> simp_all [h]
      <;> linarith
    have h₃ : (6 : ℕ) • a = 0 := by
      have h₄ := h ((2 : ℕ) • a)
      simp [pow_three, mul_assoc, mul_add, add_mul, mul_comm, mul_left_comm, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat] at h₁ h₄ ⊢
      <;> ring_nf at h₁ h₄ ⊢ <;> simp_all [h]
      <;> linarith
    exact h₃
  
  have h2 : ∀ (a b : R), 2 • (a * b) = 0 := by
    intro a b
    have h₁ : (a + b) ^ 3 = (a + b : R) := by simpa using h (a + b)
    have h₂ : (a - b) ^ 3 = (a - b : R) := by simpa using h (a - b)
    have h₃ : (a + b) ^ 3 - (a - b) ^ 3 = (a + b : R) - (a - b : R) := by
      rw [h₁, h₂]
    have h₄ : (a + b) ^ 3 - (a - b) ^ 3 = 2 * (a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3) := by
      calc
        (a + b) ^ 3 - (a - b) ^ 3 = (a + b) ^ 3 - (a - b) ^ 3 := rfl
        _ = 2 * (a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3) := by
          ring_nf
          <;> simp [sub_eq_add_neg, add_assoc, add_comm, add_left_comm, mul_comm, mul_assoc, mul_left_comm]
          <;> abel_nf
    have h₅ : (a + b : R) - (a - b : R) = 2 * b := by
      ring_nf
      <;> simp [sub_eq_add_neg, add_assoc, add_comm, add_left_comm, mul_comm, mul_assoc, mul_left_comm]
      <;> abel_nf
    have h₆ : 2 * (a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3) = 2 * b := by
      linarith
    have h₇ : a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3 = b := by
      have h₈ : 2 * (a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3) = 2 * b := h₆
      have h₉ : a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3 = b := by
        have h₁₀ := h6 b
        have h₁₁ := h6 (a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3)
        have h₁₂ : (6 : ℕ) • b = 0 := h6 b
        have h₁₃ : (6 : ℕ) • (a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3) = 0 := h6 (a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3)
        simp [two_mul, add_assoc, add_mul, mul_add, mul_assoc] at h₈ h₁₂ h₁₃ ⊢
        <;> ring_nf at h₈ h₁₂ h₁₃ ⊢ <;>
          simp_all [add_assoc, add_mul, mul_add, mul_assoc, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat]
        <;>
          nlinarith
      exact h₉
    have h₈ : a ^ 2 * b + a * b * a + b * a ^ 2 = 0 := by
      have h₉ := h₇
      have h₁₀ : b ^ 3 = b := h b
      have h₁₁ : a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3 = b := h₇
      have h₁₂ : a ^ 2 * b + a * b * a + b * a ^ 2 = 0 := by
        calc
          a ^ 2 * b + a * b * a + b * a ^ 2 = (a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3) - b ^ 3 := by
            simp [h₁₀]
            <;> ring_nf
            <;> simp_all
          _ = b - b ^ 3 := by
            rw [h₁₁]
          _ = b - b := by rw [h₁₀]
          _ = 0 := by
            simp
            <;> ring_nf
            <;> simp_all
      exact h₁₂
    have h₉ : a * b * a = 3 * a * b + 3 * b * a := by
      have h₁₀ : a ^ 2 + 3 * a = 0 := by
        have h₁₁ := h a
        have h₁₂ := h (a + 1)
        have h₁₃ := h (a - 1)
        have h₁₄ := h6 a
        have h₁₅ := h6 (a ^ 2)
        have h₁₆ := h6 1
        simp [pow_three, mul_add, mul_sub, add_mul, sub_mul, mul_one, mul_zero, add_assoc, add_sub_assoc,
          add_sub_cancel, mul_assoc, mul_comm, mul_left_comm] at h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ ⊢
        ring_nf at h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ ⊢
        <;> norm_num at h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ ⊢
        <;> ring_nf at h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ ⊢
        <;> omega
      have h₁₁ : a ^ 2 = -3 * a := by
        have h₁₂ := h₁₀
        have h₁₃ : a ^ 2 + 3 * a = 0 := h₁₀
        have h₁₄ : a ^ 2 = -3 * a := by
          have h₁₅ : a ^ 2 = -3 * a := by
            have h₁₅₁ : a ^ 2 + 3 * a = 0 := h₁₀
            have h₁₅₂ : a ^ 2 = -3 * a := by
              rw [← sub_eq_zero]
              have h₁₅₃ : a ^ 2 - (-3 * a) = 0 := by
                simp [sub_eq_add_neg]
                <;>
                  nlinarith [h6 a, h6 (a ^ 2), h a, h (a + 1), h (a - 1)]
              simpa [sub_eq_add_neg] using h₁₅₃
            exact h₁₅₂
          exact h₁₅
        exact h₁₄
      have h₁₂ : a * b * a = 3 * a * b + 3 * b * a := by
        have h₁₃ : a ^ 2 * b + a * b * a + b * a ^ 2 = 0 := h₈
        have h₁₄ : a ^ 2 = -3 * a := h₁₁
        rw [h₁₄] at h₁₃
        have h₁₅ : (-3 : R) * a * b + a * b * a + b * ((-3 : R) * a) = 0 := by simpa [mul_assoc] using h₁₃
        have h₁₆ : a * b * a = 3 * a * b + 3 * b * a := by
          have h₁₆₁ := h₁₅
          have h₁₆₂ : a * b * a = 3 * a * b + 3 * b * a := by
            ring_nf at h₁₆₁ ⊢
            <;>
            (try ring_nf at h₁₆₁ ⊢)
            <;>
            (try simp_all [mul_assoc])
            <;>
            (try ring_nf at h₁₆₁ ⊢)
            <;>
            (try simp_all [mul_assoc])
            <;>
            (try ring_nf at h₁₆₁ ⊢)
            <;>
            (try simp_all [mul_assoc])
            <;>
            (try nlinarith [h6 a, h6 b, h6 (a * b)])
            <;>
            (try ring_nf at h₁₆₁ ⊢)
            <;>
            (try simp_all [mul_assoc])
            <;>
            (try nlinarith [h6 a, h6 b, h6 (a * b)])
            <;>
            (try ring_nf at h₁₆₁ ⊢)
            <;>
            (try simp_all [mul_assoc])
            <;>
            (try nlinarith [h6 a, h6 b, h6 (a * b)])
            <;>
            (try ring_nf at h₁₆₁ ⊢)
            <;>
            (try simp_all [mul_assoc])
            <;>
            (try nlinarith [h6 a, h6 b, h6 (a * b)])
          exact h₁₆₂
        exact h₁₆
      exact h₁₂
    have h₁₀ : a * b * a = a * b + b * a := by
      have h₁₁ : a * b * a = 3 * a * b + 3 * b * a := h₉
      have h₁₂ : (2 : ℕ) • (a * b) = 0 := by
        have h₁₃ := h6 (a * b)
        have h₁₄ := h6 a
        have h₁₅ := h6 b
        simp [two_nsmul, add_mul, mul_add, add_assoc] at h₁₃ h₁₄ h₁₅ ⊢
        <;>
        ring_nf at h₁₁ h₁₃ h₁₄ h₁₅ ⊢ <;>
        simp_all [mul_assoc]
        <;>
        nlinarith
      have h₁₃ : a * b * a = a * b + b * a := by
        have h₁₄ : a * b * a = 3 * a * b + 3 * b * a := h₉
        have h₁₅ : (2 : ℕ) • (a * b) = 0 := h₁₂
        have h₁₆ : (2 : ℕ) • (b * a) = 0 := by
          have h₁₇ := h6 (b * a)
          have h₁₈ := h6 a
          have h₁₉ := h6 b
          simp [two_nsmul, add_mul, mul_add, add_assoc] at h₁₇ h₁₈ h₁₉ ⊢
          <;>
          ring_nf at h₁₄ h₁₇ h₁₈ h₁₉ ⊢ <;>
          simp_all [mul_assoc]
          <;>
          nlinarith
        have h₁₇ : a * b * a = a * b + b * a := by
          have h₁₈ : a * b + b * a = a * b + b * a := rfl
          have h₁₉ : 3 * a * b + 3 * b * a = a * b + b * a := by
            have h₂₀ := h₁₅
            have h₂₁ := h₁₆
            simp [two_nsmul, add_mul, mul_add, add_assoc] at h₂₀ h₂₁
            <;>
            ring_nf at h₁₁ h₂₀ h₂₁ ⊢ <;>
            simp_all [mul_assoc]
            <;>
            nlinarith
          linarith
        exact h₁₇
      exact h₁₃
    have h₁₁ : a * b + b * a = 0 := by
      have h₁₂ := h (a + b)
      have h₁₃ := h (a - b)
      have h₁₄ := h6 a
      have h₁₅ := h6 b
      have h₁₆ := h6 (a * b)
      have h₁₇ := h6 (b * a)
      have h₁₈ := h8
      have h₁₉ := h9
      have h₂₀ := h10
      simp [add_mul, mul_add, mul_comm, mul_left_comm, mul_assoc, sub_mul, add_assoc, pow_three] at h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ ⊢
      <;> ring_nf at h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ ⊢
      <;> simp_all [add_assoc, add_left_comm, add_comm]
      <;>
      (try omega)
      <;>
      (try nlinarith)
      <;>
      (try linarith)
    have h₁₂ : 2 • (a * b) = 0 := by
      have h₁₃ := h6 (a * b)
      have h₁₄ : (6 : ℕ) • (a * b) = 0 := h6 (a * b)
      have h₁₅ : (2 : ℕ) • (a * b) = 0 := by
        have h₁₆ := h₁₄
        simp [two_nsmul, ← add_assoc] at h₁₆ ⊢
        <;> ring_nf at h₁₆ ⊢ <;>
        (try omega) <;>
        (try nlinarith)
        <;>
        (try linarith) <;>
        (try nlinarith)
        <;>
        (try omega) <;>
        (try nlinarith)
        <;>
        (try linarith) <;>
        (try nlinarith)
        <;>
        (try omega) <;>
        (try nlinarith)
        <;>
        (try linarith) <;>
        (try nlinarith)
        <;>
        (try omega) <;>
        (try nlinarith)
        <;>
        (try linarith) <;>
        (try nlinarith)
        <;>
        (try omega) <;>
        (try nlinarith)
        <;>
        (try linarith) <;>
        (try nlinarith)
        <;>
        (try omega) <;>
        (try nlinarith)
        <;>
        (try linarith) <;>
        (try nlinarith)
      exact h₁₅
    have h₁₃ : 2 • (a * b) = 0 := by
      have h₁₄ : 2 • (a * b) = 0 := h₁₂
      exact h₁₄
    have h₁₄ : 2 • (a * b) = 0 := h₁₃
    have h₁₅ : 2 • (a * b) = 0 := by simpa using h₁₄
    have h₁₆ : 2 • (a * b) = 0 := h₁₅
    simpa [two_nsmul, add_assoc] using h₁₆
  
  have h_comm_add : ∀ (a b : R), a * b + b * a = 0 := by
    intro a b
    have h₁ : a * b + b * a = 0 := by
      have h₂ := h (a + b)
      have h₃ := h (a - b)
      have h₄ := h a
      have h₅ := h b
      have h₆ := h2 a b
      have h₇ := h2 1 1
      have h₈ := h2 a 1
      have h₉ := h2 b 1
      have h₁₀ := h2 0 0
      have h₁₁ := h2 1 a
      have h₁₂ := h2 1 b
      have h₁₃ := h2 a (b + 1)
      have h₁₄ := h2 a (b - 1)
      have h₁₅ := h2 (a + b) 1
      have h₁₆ := h2 (a - b) 1
      have h₁₇ := h2 (a + b) (a + b)
      have h₁₈ := h2 (a - b) (a - b)
      have h₁₉ := h2 (a + b) (a - b)
      have h₂₀ := h2 (a - b) (a + b)
      simp [add_assoc, add_mul, mul_add, mul_sub, sub_mul, pow_two, pow_three, mul_assoc, mul_one, mul_zero, add_zero, sub_eq_add_neg] at h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ ⊢
      <;>
      ring_nf at h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ ⊢
      <;>
      (try norm_num at h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ ⊢)
      <;>
      (try simp_all [two_nsmul])
      <;>
      (try ring_nf at h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ ⊢)
      <;>
      (try norm_num at h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ ⊢)
      <;>
      (try simp_all [two_nsmul])
      <;>
      (try ring_nf at h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ ⊢)
      <;>
      (try norm_num at h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ ⊢)
      <;>
      (try simp_all [two_nsmul])
      <;>
      (try omega)
      <;>
      (try nlinarith)
    exact h₁
    <;> simp_all [two_nsmul]
    <;> ring_nf at *
    <;> norm_num at *
    <;> simp_all [two_nsmul]
    <;> omega
  
  have h_comm : ∀ (a b : R), a * b = b * a := by
    intro a b
    have h1 : 2 • (a * b) = 0 := h2 a b
    have h2 : 2 • (b * a) = 0 := h2 b a
    have h3 : a * b + b * a = 0 := h_comm_add a b
    have h4 : 2 • (a * b) = 0 := h2 a b
    have h5 : a * b = b * a := by
      have h6 : a * b + b * a = 0 := h3
      have h7 : a * b = b * a := by
        have h8 : a * b + b * a = 0 := h6
        have h9 : a * b = -(b * a) := by
          rw [← sub_eq_zero]
          have h10 : a * b + b * a = 0 := h8
          have h11 : a * b - (-(b * a)) = 0 := by
            rw [sub_eq_add_neg]
            simpa [add_assoc, add_comm, add_left_comm] using h10
          exact h11
        have h10 : b * a = -(a * b) := by
          rw [← sub_eq_zero]
          have h11 : a * b + b * a = 0 := h8
          have h12 : b * a - (-(a * b)) = 0 := by
            rw [sub_eq_add_neg]
            simpa [add_assoc, add_comm, add_left_comm] using h11
          exact h12
        have h11 : a * b = b * a := by
          have h12 := h9
          have h13 := h10
          have h14 : a * b = b * a := by
            simp_all [two_smul, add_assoc, add_comm, add_left_comm, mul_comm]
            <;>
            (ring_nf at * <;> simp_all [two_smul, add_assoc, add_comm, add_left_comm, mul_comm])
            <;>
            (try omega)
            <;>
            (try ring_nf at * <;> simp_all [two_smul, add_assoc, add_comm, add_left_comm, mul_comm])
            <;>
            (try omega)
          exact h14
        exact h11
      exact h7
    exact h5
  
  intros a b
  apply h_comm
  <;> assumption