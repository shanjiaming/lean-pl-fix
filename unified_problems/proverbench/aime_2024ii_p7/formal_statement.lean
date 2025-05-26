theorem aime_2024ii_p7 (n : ℕ)
    (h₀ : IsGreatest {x : ℕ | ∃ abcd ∈ S, x = 1000 * abcd.1 + 100 * abcd.2.1 + 10 * abcd.2.2.1 + abcd.2.2.2} n) :
    n / 1000 + n % 1000 = 699 := by