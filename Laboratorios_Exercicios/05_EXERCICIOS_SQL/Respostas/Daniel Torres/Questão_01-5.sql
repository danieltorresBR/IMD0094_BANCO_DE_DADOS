select distinct employee.fname as 'E.fname', employee.minit as 'E.minit', employee.lname as 'E.lname'
from company.employee
where employee.ssn not in (select works_on.essn
							from works_on);