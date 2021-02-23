--
-- @lc app=leetcode id=185 lang=mysql
--
-- [185] Department Top Three Salaries
--
-- https://leetcode.com/problems/department-top-three-salaries/description/
--
-- database
-- Hard (34.61%)
-- Likes:    570
-- Dislikes: 131
-- Total Accepted:    79.7K
-- Total Submissions: 230.3K
-- Testcase Example:  '{"headers": {"Employee": ["Id", "Name", "Salary", "DepartmentId"], "Department": ["Id", "Name"]}, "rows": {"Employee": [[1, "Joe", 85000, 1], [2, "Henry", 80000, 2], [3, "Sam", 60000, 2], [4, "Max", 90000, 1], [5, "Janet", 69000, 1], [6, "Randy", 85000, 1], [7, "Will", 70000, 1]], "Department": [[1, "IT"], [2, "Sales"]]}}'
--
-- The Employee table holds all employees. Every employee has an Id, and there
-- is also a column for the department Id.
-- 
-- 
-- +----+-------+--------+--------------+
-- | Id | Name  | Salary | DepartmentId |
-- +----+-------+--------+--------------+
-- | 1  | Joe   | 85000  | 1            |
-- | 2  | Henry | 80000  | 2            |
-- | 3  | Sam   | 60000  | 2            |
-- | 4  | Max   | 90000  | 1            |
-- | 5  | Janet | 69000  | 1            |
-- | 6  | Randy | 85000  | 1            |
-- | 7  | Will  | 70000  | 1            |
-- +----+-------+--------+--------------+
-- 
-- 
-- The Department table holds all departments of the company.
-- 
-- 
-- +----+----------+
-- | Id | Name     |
-- +----+----------+
-- | 1  | IT       |
-- | 2  | Sales    |
-- +----+----------+
-- 
-- 
-- Write a SQL query to find employees who earn the top three salaries in each
-- of the department. For the above tables, your SQL query should return the
-- following rows (order of rows does not matter).
-- 
-- 
-- +------------+----------+--------+
-- | Department | Employee | Salary |
-- +------------+----------+--------+
-- | IT         | Max      | 90000  |
-- | IT         | Randy    | 85000  |
-- | IT         | Joe      | 85000  |
-- | IT         | Will     | 70000  |
-- | Sales      | Henry    | 80000  |
-- | Sales      | Sam      | 60000  |
-- +------------+----------+--------+
-- 
-- 
-- Explanation:
-- 
-- In IT department, Max earns the highest salary, both Randy and Joe earn the
-- second highest salary, and Will earns the third highest salary. There are
-- only two employees in the Sales department, Henry earns the highest salary
-- while Sam earns the second highest salary.
-- 
--

-- @lc code=start
# Write your MySQL query statement below
with q1 as(
    select
         t2.name as `Department`
        ,t1.name as `Employee`
        ,t1.Salary
        ,dense_rank() over(partition by DepartmentId order by salary desc) as rk
    from employee as t1
    join department as t2
    on t1.DepartmentId =  t2.Id
)
select
     Department
    ,Employee
    ,Salary
from q1
where rk < 4
order by department ,salary desc;
-- @lc code=end

