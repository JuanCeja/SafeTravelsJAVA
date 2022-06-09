package com.juan.safetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.juan.safetravels.models.Expense;
import com.juan.safetravels.services.ExpenseServices;

@Controller
public class SafeTravelsController {

	@Autowired
	private ExpenseServices expenseServices;

//	CREATE NEW EXPENSE PAGE
	@RequestMapping("/expenses")
	public String index(Model model, @ModelAttribute("newExpense") Expense newExpense) {
		List<Expense> expenses = expenseServices.allExpenses();
		model.addAttribute("expenses", expenses);

		return "expenses.jsp";
	}

//	CREATE PAGE METHOD POST
	@PostMapping("/expenses/create")
	public String create(@Valid @ModelAttribute("newExpense") Expense expense, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Expense> expenses = expenseServices.allExpenses();
			model.addAttribute("expenses", expenses);
			return "expenses.jsp";
		} else {
			expenseServices.createExpense(expense);
			return "redirect:/expenses";
		}
	}

//    EDIT PAGE RENDER FORM
	@RequestMapping("/expenses/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		Expense expense = expenseServices.getExpense(id);
		model.addAttribute("editExpense", expense);
		return "edit.jsp";
	}


//    EDIT PAGE POST METHOD
	@RequestMapping(value = "/expense/{id}", method = RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("editExpense") Expense editExpense, BindingResult result) {
		if (result.hasErrors()) {
			return "edit.jsp";
		} else {
			expenseServices.updateExpense(editExpense);
			return "redirect:/expenses";
		}
	}
	
//	DELETE METHOD 
	@RequestMapping(value="/expense/delete/{id}", method=RequestMethod.DELETE)
	public String deleteExpense(@PathVariable("id") Long id) {
		expenseServices.deleteExpense(id);
		return "redirect:/expenses";
	}
	    
//	DISPLAY EXPENSE
	@RequestMapping(value="/expense/show/{id}")
	public String showExpense(@PathVariable("id")Long id, Model model) {
		Expense expense = expenseServices.getExpense(id);
		model.addAttribute("expense", expense);
		return "show.jsp";
	}
}



