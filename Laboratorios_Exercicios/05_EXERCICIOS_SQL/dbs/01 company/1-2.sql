SELECT employee.fname, employee.minit, employee.lname FROM company.employee, company.dependent WHERE employee.ssn = dependent.essn AND dependent_name = employee.fname;