--
-- @lc app=leetcode id=177 lang=mysql
--
-- [177] Nth Highest Salary
--
-- https://leetcode.com/problems/nth-highest-salary/description/
--
-- database
-- Medium (31.39%)
-- Likes:    442
-- Dislikes: 366
-- Total Accepted:    117.6K
-- Total Submissions: 374.7K
-- Testcase Example:  '{"headers": {"Employee": ["Id", "Salary"]}, "argument": 2, "rows": {"Employee": [[1, 100], [2, 200], [3, 300]]}}'
--
-- Write a SQL query to get the n^th highest salary from the Employee table.
-- 
-- 
-- +----+--------+
-- | Id | Salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- 
-- 
-- For example, given the above Employee table, the n^th highest salary where n
-- = 2 is 200. If there is no n^th highest salary, then the query should return
-- null.
-- 
-- 
-- +------------------------+
-- | getNthHighestSalary(2) |
-- +------------------------+
-- | 200                    |
-- +------------------------+
-- 
-- 
--

-- @lc code=start
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select salary from(
          select
              Salary,
              row_number() over(order by Salary desc) as rn
          from Employee
          group by Salary
      ) as t1
      where rn = N
  );
END
-- @lc code=end

