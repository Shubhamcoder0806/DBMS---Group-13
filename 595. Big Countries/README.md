# LeetCode 595 - Big Countries

## Problem

Find the countries that are considered **big**.

A country is big if:

* Its area is at least **3,000,000 km²**, or
* Its population is at least **25,000,000**.

Return the country name, population, and area.

## SQL Solution

```sql
SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;
```

## Explanation

* Select the required columns: `name`, `population`, and `area`.
* Use the `WHERE` clause to filter countries that satisfy either:

  * `area >= 3000000`, or
  * `population >= 25000000`.
* The `OR` operator ensures that countries meeting at least one condition are included.

## Complexity

* Time Complexity: **O(n)**
* Space Complexity: **O(1)** (excluding output)
