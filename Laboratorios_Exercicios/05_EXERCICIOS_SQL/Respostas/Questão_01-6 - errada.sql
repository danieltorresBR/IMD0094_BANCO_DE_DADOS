select distinct employee.fname, employee.minit, employee.lname, employee.address 
from company.employee, company.works_on, company.project, company.dept_locations 
where works_on.essn = employee.ssn
	and works_on.pno = project.pnumber 
	and project.plocation = 'Houston' 
    and employee.dno = dept_locations.dnumber
	and dept_locations.dlocation <> 'Houston' 