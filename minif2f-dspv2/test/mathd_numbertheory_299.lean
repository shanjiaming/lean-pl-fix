import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What is the ones digit of $1 \cdot 3 \cdot 5 \cdot 7 \cdot 9 \cdot 11 \cdot 13$? Show that it is 5.-/
theorem mathd_numbertheory_299 : 1 * 3 * 5 * 7 * 9 * 11 * 13 % 10 = 5 := by
  have h₀ : (1 * 3 * 5 * 7 * 9 * 11 * 13 : ℕ) % 10 = 5 := by
    norm_num [mul_assoc, Nat.mul_mod, Nat.add_mod, Nat.mod_mod, Nat.mod_eq_of_lt,
      Nat.mod_eq_of_lt, Nat.mod_eq_of_lt, Nat.mod_eq_of_lt, Nat.mod_eq_of_lt,
      Nat.mod_eq_of_lt, Nat.mod_eq_of_lt]
    <;> rfl
  
  exact h₀
