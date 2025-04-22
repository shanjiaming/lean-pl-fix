import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Find the remainder when $91145 + 91146 + 91147 + 91148$ is divided by 4. Show that it is 2.-/
theorem mathd_numbertheory_640 : (91145 + 91146 + 91147 + 91148) % 4 = 2 := by
  -- The strategy is to compute each term modulo 4 separately, then sum them modulo 4

  -- First, let's compute 91145 mod 4
  -- We can find this by looking at the last two digits (since 100 is divisible by 4)
  -- 91145 = 91100 + 45
  -- 91100 mod 4 = 0 (since 100 is divisible by 4)
  -- 45 mod 4 = 1 (since 4×11 = 44 and 45-44=1)
  -- So 91145 mod 4 = 1
  have h1 : 91145 % 4 = 1 := by rfl

  -- Next, compute 91146 mod 4
  -- Similarly, 91146 = 91100 + 46
  -- 46 mod 4 = 2 (since 4×11 = 44 and 46-44=2)
  -- So 91146 mod 4 = 2
  have h2 : 91146 % 4 = 2 := by rfl

  -- Next, compute 91147 mod 4
  -- 91147 = 91100 + 47
  -- 47 mod 4 = 3 (since 4×11 = 44 and 47-44=3)
  -- So 91147 mod 4 = 3
  have h3 : 91147 % 4 = 3 := by rfl

  -- Finally, compute 91148 mod 4
  -- 91148 = 91100 + 48
  -- 48 mod 4 = 0 (since 4×12 = 48)
  -- So 91148 mod 4 = 0
  have h4 : 91148 % 4 = 0 := by rfl

  -- Now we can rewrite the original expression using these modulo results
  -- (91145 + 91146 + 91147 + 91148) mod 4 
  -- = (91145 mod 4 + 91146 mod 4 + 91147 mod 4 + 91148 mod 4) mod 4
  -- = (1 + 2 + 3 + 0) mod 4
  -- = 6 mod 4
  -- = 2
  rw [add_mod, add_mod, add_mod]  -- Break down the additions modulo 4
  rw [h1]
  rw [h2]
  rw [h3]
  rw [h4]
  norm_num                        -- Compute the final result: 6 mod 4 = 2