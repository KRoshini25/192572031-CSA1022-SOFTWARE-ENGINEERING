# Q1 – RAPTOR Flowchart: GCD and LCM

**Aim:** Create a RAPTOR flowchart to find the GCD and LCM of two positive integers using Euclid's algorithm.

## Algorithm
1. Read `a` and `b`.
2. Store original values in `x` and `y`.
3. While `b` is not zero: set `r = a MOD b`, `a = b`, `b = r`.
4. Set `gcd = a`.
5. Set `lcm = (x * y) / gcd`.
6. Display GCD and LCM.

## Test cases
| Input | GCD | LCM |
|---|---:|---:|
| 48, 18 | 6 | 144 |
| 12, 18 | 6 | 36 |

Open `gcd_lcm_flowchart_reference.png` for a flowchart design reference. Recreate it in RAPTOR and capture your actual RAPTOR window for submission.
