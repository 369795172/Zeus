--
-- @lc app=leetcode id=627 lang=mysql
--
-- [627] Swap Salary
--

-- @lc code=start
# Write your MySQL query statement below
update salary
set sex = (
    case sex
        when 'm' then 'f'
        when 'f' then 'm'
    end
);
-- @lc code=end

