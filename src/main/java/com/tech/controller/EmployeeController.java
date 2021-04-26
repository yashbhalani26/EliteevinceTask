package com.tech.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tech.model.Employee;
import com.tech.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	@GetMapping("/getAllEmployees")
	public ModelAndView getAllEmployees()
	{
		
		ModelAndView model = new ModelAndView("index");
		List<Employee> allEmployees = employeeService.findAllEmployees();
		model.addObject("allEmployees", allEmployees);
		System.out.println("Size of allEmployees "+allEmployees.size());
		return model;
	}
	
	@GetMapping("/addEmployee")
	public ModelAndView addEmployee()
	{
		ModelAndView model = new ModelAndView("addEditEmployee");
		return model;
	}
	
	@PostMapping("/saveEmployee")
	@ResponseBody
	public String saveEmployee(Employee employee)
	{
		if(employee.getId()!=null)
		{
			Employee empl = employeeService.findByemployeeId(employee.getId());
			empl.setFirstName(employee.getFirstName());
			empl.setLastName(employee.getLastName());
			empl.setDob(employee.getDob());
			empl.setUserName(employee.getUserName());
			empl.setPassword(employee.getPassword());
			empl.setEmailId(employee.getEmailId());
			employeeService.save(empl);
		}else 
		{
			employeeService.save(employee);
		}
				
		
		return "success";
	}
	
	@GetMapping("/{id}/editEmployee")
	public ModelAndView editEmployee(@PathVariable(value = "id") Long id)
	{
		ModelAndView model = new ModelAndView("addEditEmployee");
		Employee employee = employeeService.findByemployeeId(id);
		model.addObject("employeeData", employee);
		return model;
	}

	@GetMapping("/{id}/deleteEmployee")
	public String deleteEmployee(@PathVariable(value = "id") Long id)
	{
		employeeService.deleteByEmployeeId(id);
		return "redirect:/employee/getAllEmployees";
	}
}
