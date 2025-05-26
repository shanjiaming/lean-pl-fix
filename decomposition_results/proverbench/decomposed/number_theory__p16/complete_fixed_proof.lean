theorem smallest_library_books_value {n : ℕ} (h1 : n % 7 = 5) (h2 : n % 9 = 3) (h3 : n % 11 = 7) : n = 579:=
  by
  have h₄ : n % 63 = 12:=
    by
    have h₄₁ : n % 63 = 12:= by
      have h₄₂ : n % 7 = 5 := h1
      have h₄₃ : n % 9 = 3 := h2
      have h₄₄ : n % 63 = 12:= by -- omega
        omega
      --  exact h₄₄
      linarith
    --  exact h₄₁
    linarith
  have h₅ : n % 693 = 579:=
    by
    have h₅₁ : n % 693 = 579:= by
      have h₅₂ : n % 63 = 12 := h₄
      have h₅₃ : n % 11 = 7 := h3
      have h₅₄ : n % 693 = 579:= by -- omega
        omega
      --  exact h₅₄
      linarith
    --  exact h₅₁
    linarith
  have h₆ : n = 579:= by
    have h₆₁ : n % 693 = 579 := h₅
    have h₆₂ : n = 579:= by -- omega
      hole
    --  exact h₆₂
    linarith
  --  exact h₆
  linarith