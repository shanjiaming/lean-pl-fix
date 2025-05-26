import Mathlib

open Real Set Nat

-- (fun n : ℕ => (2 * n)! / (4 ^ n * (n)!))
/--
Let $A$ be a $2n \times 2n$ matrix, with entries chosen independently at random. Every entry is chosen to be $0$ or $1$, each with probability $1/2$. Find the expected value of $\det(A-A^t)$ (as a function of $n$), where $A^t$ is the transpose of $A$.
-/