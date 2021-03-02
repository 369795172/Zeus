--
-- @lc app=leetcode id=626 lang=mysql
--
-- [626] Exchange Seats
--

-- @lc code=start
# Write your MySQL query statement below
select
     id
    ,(case when id % 2 = 0 
            then (case when  (lag(student) over(order by id)) is null then student else  (lag(student) over(order by id)) end)
            else (case when (lead(student) over(order by id)) is null then student else (lead(student) over(order by id)) end)
    end) as student
from seat;
-- @lc code=end

