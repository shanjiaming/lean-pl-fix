import Mathlib
import Aesop
set_option maxHeartbeats 0
open BigOperators Real Nat Topology Rat
macro "hole" : tactic => `(tactic| admit)
theorem h  : 54 % 6 = 0 := by -- norm_num <;> rfl
  hole