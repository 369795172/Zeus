--
-- @lc app=leetcode id=196 lang=mysql
--
-- [196] Delete Duplicate Emails
--

-- @lc code=start
# Write your MySQL query statement below
with t1 as(
    select email as cnt from Person group by 1 having count(1) > 1
),t2 as(
    select min(id) as min_id from Person group by email
)
delete from Person
where email in (select * from t1)
and id not in (select * from t2)
;
-- @lc code=end

