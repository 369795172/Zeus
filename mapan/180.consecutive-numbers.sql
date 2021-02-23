--
-- @lc app=leetcode id=180 lang=mysql
--
-- [180] Consecutive Numbers
--
-- https://leetcode.com/problems/consecutive-numbers/description/
--
-- database
-- Medium (39.78%)
-- Likes:    451
-- Dislikes: 106
-- Total Accepted:    94.5K
-- Total Submissions: 237.6K
-- Testcase Example:  '{"headers": {"Logs": ["Id", "Num"]}, "rows": {"Logs": [[1, 1], [2, 1], [3, 1], [4, 2], [5, 1], [6, 2], [7, 2]]}}'
--
-- Write a SQL query to find all numbers that appear at least three times
-- consecutively.
-- 
-- 
-- +----+-----+
-- | Id | Num |
-- +----+-----+
-- | 1  |  1  |
-- | 2  |  1  |
-- | 3  |  1  |
-- | 4  |  2  |
-- | 5  |  1  |
-- | 6  |  2  |
-- | 7  |  2  |
-- +----+-----+
-- 
-- 
-- For example, given the above Logs table, 1 is the only number that appears
-- consecutively for at least three times.
-- 
-- 
-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below
select
    distinct t1.Num as ConsecutiveNums
from Logs as t1
join Logs as t2
on t1.Id = t2.Id - 1
join Logs as t3
on t2.Id = t3.Id - 1
where t1.Num = t2.Num
and t2.Num = t3.Num
;
-- @lc code=end

