select distinct employee.fname as 'employee.fname', employee.minit as 'employee.minit', employee.lname as 'employee.lname'
from company.employee
where not exists (select * 
				  from company.project
                  where project.pnumber not in (select works_on.pno
												from company.works_on
                                                where employee.ssn = works_on.essn));