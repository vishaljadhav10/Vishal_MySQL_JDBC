package com.gl.driver;

import java.sql.SQLException;
import java.util.Scanner;

import com.gl.DAO.employeeDAO;
import com.gl.bean.Employee;

public class Main {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int choice;
		employeeDAO daoObj = new employeeDAO();
		do {

			System.out.println("0. To exit ");
			System.out.println("1. Insert the employee");
			System.out.println("2. Delete the employee");
			System.out.println("3. Update the employee");
			System.out.println("4. To remove all records from table");
			System.out.println("Select the option:");
			choice = sc.nextInt();

			switch (choice) {
			case 1: {

				System.out.println("Insert employee id:");
				int id = sc.nextInt();
				System.out.println("Insert employee phone number:");
				long pNumber = sc.nextLong();
				System.out.println("Insert employee name:");
				String name = sc.next();
				System.out.println("Insert employee email id:");
				String emailId = sc.next();

				Employee emp = new Employee(id, name, emailId, pNumber);
				daoObj.insertEmployee(emp);

				break;
			}
			case 2: {
				System.out.println("Enter employee id");
				int id = sc.nextInt();
				daoObj.deleteEmployee(id);
				break;
			}
			case 3: {
				System.out.println("Insert employee id:");
				int id = sc.nextInt();
				System.out.println("Insert employee phone number:");
				long pNumber = sc.nextLong();
				System.out.println("Insert employee name:");
				String name = sc.next();
				System.out.println("Insert employee email id:");
				String emailId = sc.next();

				Employee emp = new Employee(id, name, emailId, pNumber);
				try {
					daoObj.updateEmployee(emp);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
			case 4: {
				daoObj.removeAllRecords();
				break;
			}

			}

		} while (choice != 0);
	}

}
