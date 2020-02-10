package com.hzm.domain.reponse;

public enum AddEnmu implements ResponseInterface {

	ERROR(404, "错误"),

	SUCCESS(200, "正确");

	public Integer code;
	public String mesage;

	private AddEnmu(int code, String mesage) {
		this.code = code;
		this.mesage = mesage;
	}

	@Override
	public int getcode() {
		return code;
	}

	@Override
	public String getmessage() {
		return mesage;
	}

}
