--
-- @lc app=leetcode id=197 lang=mysql
--
-- [197] Rising Temperature
--

-- @lc code=start
# Write your MySQL query statement below
with t1 as(
    select
         id
        ,RecordDate  -- today
        ,Temperature
        ,date_sub(RecordDate,INTERVAL 1 DAY) as RecordDate_1 -- yesterday
    from Weather
)
select
     t3.id
from (
    select
         t1.*
        ,t2.Temperature as yes_tem
    from t1
    left join Weather as t2
    on t1.RecordDate_1 = t2.RecordDate
) as t3
where (t3.Temperature - yes_tem) is not null
and t3.Temperature - yes_tem > 0;
-- @lc code=end

