import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Find the largest possible real part of \[(75+117i)z+\frac{96+144i}{z}\] where $z$ is a complex number with $|z|=4$. Show that it is 540.-/