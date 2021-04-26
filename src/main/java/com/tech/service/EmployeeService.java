package com.tech.service;

import java.util.List;

import com.tech.model.Employee;

public interface EmployeeService {

	Employee save(Employee employee);

	List<Employee> findAllEmployees();

	Employee findByemployeeId(Long id);

	void deleteByEmployeeId(Long id);

}
