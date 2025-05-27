import Mathlib

-- (fun n : ℕ => if (n ≡ 1 [MOD 4]) then n else -n)
/--
Let $n$ be a positive odd integer and let $\theta$ be a real number such that $\theta/\pi$ is irrational. Set $a_k=\tan(\theta+k\pi/n)$, $k=1,2,\dots,n$. Prove that $\frac{a_1+a_2+\cdots+a_n}{a_1a_2 \cdots a_n}$ is an integer, and determine its value.
-/