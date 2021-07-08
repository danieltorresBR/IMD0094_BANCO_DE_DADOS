select distinct employee.fname as 'employee.fname', employee.minit as 'employee.minit', employee.lname as 'employee.lname'
from company.employee
where employee.ssn in (select department.mgr_ssn
						from company.department)
	  and
      employee.ssn not in (select dependent.essn
							from company.dependent)