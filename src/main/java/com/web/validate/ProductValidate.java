package com.web.validate;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.entity.Category;
import com.web.entity.Watch;
import org.springframework.web.multipart.MultipartFile;

import javax.activation.MimetypesFileTypeMap;
import java.io.File;

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
				errors.rejectValue("anhnen", "error.anhnen", "Ảnh sản phẩm không được để trống");
			} else if (!checkFileType(watch.getAnhnen())) {
				errors.rejectValue("anhnen", "error.imageType", "Ảnh sản phẩm phải ở định dạng png, jpg, jpeg");
			}
			if(watch.getAnhphu().length == 1 && watch.getAnhphu()[0].isEmpty()) {
				 errors.rejectValue("anhphu", "missing.anhphu", "Ảnh chi tiết sản phẩm không được để trống");
			} else {
                for (MultipartFile file : watch.getAnhphu()) {
                    if (!checkFileType(file)) {
                        errors.rejectValue("anhphu", "error.imageType", "Ảnh phải ở định dạng png, jpg, jpeg");
                        break;
                    }
                }
            }
		}
	}

	public boolean checkFileType(MultipartFile file) {
		String type = file.getContentType().split("/")[0];
		return type.equals("image");
	}
}
