package com.hzm.domain.reponse;

public class AddResult {

	private Integer code;
	private String message;

	public AddResult(ResponseInterface interface1) {
		code = interface1.getcode();
		message = interface1.getmessage();

	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public AddResult() {
	}

	@Override
	public String toString() {
		return "AddResult [code=" + code + ", message=" + message + "]";
	}

}
