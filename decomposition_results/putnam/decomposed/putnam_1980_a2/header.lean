import Mathlib

-- (fun r s : ℕ => (1 + 4 * r + 6 * r ^ 2) * (1 + 4 * s + 6 * s ^ 2))
/--
Let $r$ and $s$ be positive integers. Derive a formula for the number of ordered quadruples $(a,b,c,d)$ of positive integers such that $3^r \cdot 7^s=\text{lcm}[a,b,c]=\text{lcm}[a,b,d]=\text{lcm}[a,c,d]=\text{lcm}[b,c,d]$. The answer should be a function of $r$ and $s$. (Note that $\text{lcm}[x,y,z]$ denotes the least common multiple of $x,y,z$.)
-/