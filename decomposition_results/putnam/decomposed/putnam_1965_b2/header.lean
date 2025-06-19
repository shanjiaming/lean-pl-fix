import Mathlib

open EuclideanGeometry Topology Filter Complex

/--
A round-robin tournament has $n > 1$ players $P_1, P_2, \dots, P_n$, who each play one game with each other player. Each game results in a win for one player and a loss for the other. If $w_r$ and $l_r$ denote the number of games won and lost, respectively, by $P_r$, prove that $$\sum_{r=1}^{n} w_r^2 = \sum_{r=1}^{n} l_r^2.$$
-/