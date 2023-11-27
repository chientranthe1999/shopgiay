package com.web.validate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.dao.AccountDao;
import com.web.entity.Account;
import com.web.entity.Blog;

@Component
public class RegisValidate implements Validator{

	@Autowired
	private AccountDao accountDao;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Account.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Account account = (Account) target;

		if(account.getUsername().isEmpty()) {
			ValidationUtils.rejectIfEmpty(errors, "username", "error.username", "Tên đăng nhập không được trống");
		} else if (!account.getUsername().matches("^[a-zA-Z0-9._-]+$")) {
			errors.rejectValue("username", "invalid.username", "Tên đăng nhập chỉ được chứa ký tự a-z, A-Z, số và các ký tự . - _");
		}
		ValidationUtils.rejectIfEmpty(errors, "fullname", "error.fullname", "Họ tên không được trống");
		ValidationUtils.rejectIfEmpty(errors, "password", "error.password", "Password không được trống");

		if(account.getPassword().length() < 8 && !account.getPassword().isEmpty()) {
			errors.rejectValue("password", "error.password", "Password ko được nhỏ hơn 8 ký tự");
		}

		if(account.getEmail().isEmpty()) {
			ValidationUtils.rejectIfEmpty(errors, "email", "error.email", "Email không được trống");
		} else if (!account.getEmail().matches("^[A-Za-z0-9.]+@[A-Za-z0-9]+\\.[A-Za-z]+$")) {
			errors.rejectValue("email", "error.email", "Email không đúng định dạng");
		}
		ValidationUtils.rejectIfEmpty(errors, "address", "error.address", "Địa chỉ không được trống");
		if(account.getPhone().isEmpty()) {
			ValidationUtils.rejectIfEmpty(errors, "phone", "error.phone", "Số điện thoại không được trống");
		} else if(!account.getPhone().matches("^[0-9]{10}$")) {
			errors.rejectValue("phone", "error.phone", "Số điện thoại bao gồm 10 chữ số");
		}
		if(account.getFile().isEmpty()) {
			errors.rejectValue("file", "missing.file");
		}
		Account a = accountDao.getUserWithAuthority(account.getUsername());
		if(a != null) {
			errors.rejectValue("username", "usernameregis");
			
			if(account.getEmail().equalsIgnoreCase(a.getEmail())) {
				ValidationUtils.rejectIfEmpty(errors, "email", "error.email", "Email đã tồn tại");
			}
			if(account.getPhone().equals(a.getPhone())) {
				ValidationUtils.rejectIfEmpty(errors, "phone", "error.phone", "Số điện thoại đã tồn tại");
			}
		}
	}
}
