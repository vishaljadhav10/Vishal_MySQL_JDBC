package com.gl.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.gl.bean.Employee;
import com.gl.connection.myConnection;

public class employeeDAO {
	Connection con;
	Statement stmt;
	myConnection mycon;
	Employee emp;

	public void insertEmployee(Employee emp) {
		int count = 0;
		con = new myConnection().getMyConnection();
		try {
			stmt = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String sql = "insert into Employee values(" + emp.getId() + ",'" + emp.getName() + "','" + emp.getEmailId()
				+ "'," + emp.getPhoneNumber() + ")";

		try {
			count = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (count != 0) {
			System.out.println("employee record inserted");
		} else
			System.out.println("Could not insert employee record");

		try {
			con.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void updateEmployee(Employee emp) throws SQLException {
		int count = 0;
		con = new myConnection().getMyConnection();
		try {
			stmt = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "update employee set name='" + emp.getName() + "','" + emp.getEmailId() + "',"
				+ emp.getPhoneNumber() + "where id=" + emp.getId();

		count = stmt.executeUpdate(sql);

		if (count != 0) {
			System.out.println("Employee updated");
		} else
			System.out.println("Employee not updated");
	}

	public void deleteEmployee(int id) {
		int count = 0;
		con = new myConnection().getMyConnection();
		try {
			stmt = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "delete from employee where id =" + id;

		try {
			count = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (count != 0) {
			System.out.println("Employee deleted");
		} else
			System.out.println("Employee not deleted");

	}

	public void removeAllRecords() {
		int count = 0;
		con = new myConnection().getMyConnection();
		try {
			stmt = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String sql = "truncate Employee";

		try {
			count = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("All records removed");

		try {
			con.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
