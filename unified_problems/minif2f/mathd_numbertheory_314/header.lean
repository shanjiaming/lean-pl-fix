import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $r$ be the remainder when $1342$ is divided by $13$.

Determine the smallest positive integer that has these two properties:

$\bullet~$ It is a multiple of $1342$.

$\bullet~$ Its remainder upon being divided by $13$ is smaller than $r$. Show that it is 6710.-/