# 1141. User Activity for the Past 30 Days I

## Problem

Find the number of unique active users for each day during the 30-day period ending on `2019-07-27`.

A user is considered active if they performed at least one activity on that day.

## SQL Concepts

- `COUNT(DISTINCT)`
- `WHERE`
- `BETWEEN`
- `GROUP BY`

## Approach

Filter activities between `2019-06-28` and `2019-07-27`, group them by date, and count the distinct users for each day.

## Solution

See [`solution.sql`](solution.sql).
