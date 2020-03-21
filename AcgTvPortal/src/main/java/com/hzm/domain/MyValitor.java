package com.hzm.domain;

import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;

import org.springframework.format.annotation.DateTimeFormat;

public class MyValitor {
	@NotBlank(message = "id不能为空")
	private String id;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Past(message = "时间超了")
	private Date date;
	private String email;
	private String phone;
	@Min(value = 1L)
	@Max(value = 3L)
	private Long number;
	private Integer number2;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getNumber2() {
		return number2;
	}

	public void setNumber2(Integer number2) {
		this.number2 = number2;
	}

	public Long getNumber() {
		return number;
	}

	public void setNumber(Long number) {
		this.number = number;
	}

	@Override
	public String toString() {
		return "MyValitor [id=" + id + ", date=" + date + ", email=" + email + ", phone=" + phone + ", number=" + number
				+ ", number2=" + number2 + "]";
	}

}
