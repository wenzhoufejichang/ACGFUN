package com.hzm.domain;

public class Question {
//	CREATE TABLE `question` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `content` varchar(255) DEFAULT NULL,
//			  `answer_a` varchar(255) DEFAULT NULL,
//			  `answer_b` varchar(255) DEFAULT NULL,
//			  `answer_c` varchar(255) DEFAULT NULL,
//			  `answer_d` varchar(255) DEFAULT NULL,
//			  `answer_right` varchar(255) DEFAULT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8

	private Integer id;
	private String content;
	private String answerA;
	private String answerB;
	private String answerC;
	private String answerD;
	private String answerRight;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAnswerA() {
		return answerA;
	}

	public void setAnswerA(String answerA) {
		this.answerA = answerA;
	}

	public String getAnswerB() {
		return answerB;
	}

	public void setAnswerB(String answerB) {
		this.answerB = answerB;
	}

	public String getAnswerC() {
		return answerC;
	}

	public void setAnswerC(String answerC) {
		this.answerC = answerC;
	}

	public String getAnswerD() {
		return answerD;
	}

	public void setAnswerD(String answerD) {
		this.answerD = answerD;
	}

	public String getAnswerRight() {
		return answerRight;
	}

	public void setAnswerRight(String answerRight) {
		this.answerRight = answerRight;
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", content=" + content + ", answerA=" + answerA + ", answerB=" + answerB
				+ ", answerC=" + answerC + ", answerD=" + answerD + ", answerRight=" + answerRight + "]";
	}

}
