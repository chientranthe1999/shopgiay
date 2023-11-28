package com.web.validate;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.entity.Category;
import com.web.entity.Watch;

@Component
public class ProductValidate implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Watch.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Watch watch = (Watch) target;
		ValidationUtils.rejectIfEmpty(errors, "name", "error.name", "Tên sản phẩm không được trống");
		ValidationUtils.rejectIfEmpty(errors, "description", "error.description", "Mô tả không được trống");
		if(watch.getId() == null) {
			if(watch.getAnhnen().isEmpty()) {
				errors.rejectValue("anhnen", "missing.file");
			}
			if(watch.getAnhphu().length == 1 && watch.getAnhphu()[0].isEmpty()) {
				 errors.rejectValue("anhphu", "missing.file");
			}
		}
	}
}
