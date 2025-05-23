S'_n = sum_{i=0 to n-1} 1/(a_0···a_i) = ... 
```

But `a_0···a_i = a₁···a_i` (`a₀ =1`), and recall `a₁···a_n = product_{k=1 to n} (b_k +2)/b_{k-1}`. 

This bring `a₁···a_n = (b₁ +2)/b₀ · (b₂ +2)/b₁ ··· (b_n +2)/b_{n-1}` (`b_0 =1`) telescopes to `(b_n +2)/b₀ · 1/(b_k)` for intermediate. 

No: it’s `(b_n +2)·1/(b_0 =1) · prod_{k=1 to n-1} 1/b_k`. 

=> `a₁···a_n = (b_n +2) · prod_{k=1 to n-1} (1/b_k)`. 

However, `a₁···a_n = (b_n +2) · prod_{k=1 to n-1} (1/b_k) does not seem quite right, as `a₁ a₂` is `(b₁ + 2)·(b₂ +2)/b₁` (`n=2`), which is `(b₂ +2)·(b₁ +2)/b₁`. 

So, for `n` terms (`a₁ {to a_n`), it is `a₁···a_n` is not `(b_n +2)/(b_{n-1}···)`, 

but rather, for `S'`, the sum `sum_{i=0 to n-1} 1/(a_0···a_i)` is `sum_{i=0 to n-1} 1/(a₁···a_{i)`), (`a₀ =1`). 

Case `i =0`, product is empty (`=1`), `i=1` is `1/a₁ = 1/(b₁ +2)`.

`i=2`, `1/(a₁ a₂)` is `b₁/( (b₁ +2)(b₂ +2))`.

`i=3`, `1/(a₁ a₂ a₃)` is `b₁ b₂` over `(b₁ +2)(b₂ +2)(b₃ +2)`, etc. 

This can be written as a telescopic sum. 

Define `v_n` as `b_1 · b_{n-1} / ( (b₁ +2)··· (b_n +2) )` (for `n ≥1`), and `v₀ =1` corresponds to `i=0` (`1/a₀··· =1`).

Then, we have recurrence relations (`relate `v_{n}` to `v_{n-1}`). 

Indeed:
`v_n = v_{n-1} · b_{n}/(b_{n} +2) ↔` because from `v_{n-1}`, it previously had `1/(b_{n-1} +2)` at the last place`, but now has `b_{n-1}/(b_{n-1} +2)) ·1/(b_n +2)` when going to `v_n`.

Ah, no. 

Actually, recall that `1/(a₁···a_n)` is `1/ [(b₁ +2)/b₀···(b_n +2)/b_{n-1}]` (`b₀ =1`), so `= b₀···b_{n-1} /( (b₁ +2)···(b_n +2)))` (`b₀ =1`), so is `b₁···b_{n-1}/( (b₁ +2)···(b_n +2))`.