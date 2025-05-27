import Mathlib

open MeasureTheory

/--
Let $\triangle ABC$ be a triangle in the Euclidean plane, with points $P$, $Q$, and $R$ lying on segments $\overline{BC}$, $\overline{CA}$, $\overline{AB}$ respectively such that $$\frac{AQ}{QC} = \frac{BR}{RA} = \frac{CP}{PB} = k$$ for some positive constant $k$. If $\triangle UVW$ is the triangle formed by parts of segments $\overline{AP}$, $\overline{BQ}$, and $\overline{CR}$, prove that $$\frac{[\triangle UVW]}{[\triangle ABC]} = \frac{(k - 1)^2}{k^2 + k + 1},$$ where $[\triangle]$ denotes the area of the triangle $\triangle$.
-/