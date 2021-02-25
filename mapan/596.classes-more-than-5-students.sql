--
-- @lc app=leetcode id=596 lang=mysql
--
-- [596] Classes More Than 5 Students
--

-- @lc code=start
# Write your MySQL query statement below
select
     class
from (
    select
        *
    from courses
    group by 1,2
) t0
group by class
having count(1) >=5;
-- @lc code=end

