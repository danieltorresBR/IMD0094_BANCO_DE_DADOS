select distinct employee.fname, employee.minit, employee.lname 
from company.employee
where employee.ssn in (select department.mgr_ssn
						from company.department)
	  and
      employee.ssn not in (select dependent.essn
							from company.dependent)