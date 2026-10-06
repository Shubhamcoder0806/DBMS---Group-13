# 1280. Students and Examinations

## Problem

Find the number of examinations attended by each student for every subject.

Include students who did not attend any examination.

## SQL Concepts

- `CROSS JOIN`
- `LEFT JOIN`
- `COUNT`
- `GROUP BY`
- `ORDER BY`

## Approach

Create all possible student-subject combinations using `CROSS JOIN`. Then use `LEFT JOIN` with the `Examinations` table to count attended examinations, including students with zero examinations.

## Solution

See [`solution.sql`](solution.sql).
