package com.juan.safetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juan.safetravels.models.Expense;
import com.juan.safetravels.repositories.ExpenseRepository;

@Service
public class ExpenseServices {
	
	@Autowired
	private final ExpenseRepository expenseRepository;
	
	public ExpenseServices(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;
	}
//	READ ALL
	public List<Expense> allExpenses() {
		return expenseRepository.findAll();
	}
//	CREATE
	public Expense createExpense(Expense expense) {
		return expenseRepository.save(expense);
	}
//	READ ONE
	public Expense getExpense(Long id) {
		Optional<Expense> optionalExpense = expenseRepository.findById(id);
		if(optionalExpense.isPresent()) {
			return optionalExpense.get();
		} else {
			return null;
		}
	}
	
//	UPDATE
	public Expense updateExpense(Expense expense) {
		return expenseRepository.save(expense);
	}
	
//	DELETE
	public void deleteExpense(Long id) {
		expenseRepository.deleteById(id);
	}
}
