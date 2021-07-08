select distinct employee.fname as 'employee.fname', employee.minit as 'employee.minit', employee.lname as 'employee.lname'
from company.employee, company.works_on
where employee.ssn = works_on.essn and
	  works_on.pno in (select project.pnumber
					   from company.project
                       where project.plocation = 'Houston')
	and
      works_on.pno not in (select project.pnumber
                           from company.project, company.dept_locations
                           where project.dnum = dept_locations.dnumber and
                                 dept_locations.dlocation = project.plocation);