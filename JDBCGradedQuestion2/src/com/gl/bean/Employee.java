package com.gl.bean;

public class Employee {
	int id;
	String name;
	String emailId;
	double phoneNumber;

	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Employee(int id, String name, String emailId, double pNumber) {

		this.id = id;
		this.name = name;
		this.emailId = emailId;
		this.phoneNumber = pNumber;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public double getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", emailId=" + emailId + ", phoneNumber=" + phoneNumber + "]";
	}
	
	
}
