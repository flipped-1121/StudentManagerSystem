package com.ischoolbar.programmer.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil {
    private String dbUrl = "jdbc:mysql://localhost:3306/db_student_manager_web";
    private String dbUser = "root";
    private String dbPassword = "001121";
    private String jdbcName = "com.mysql.jdbc.Driver";
    private Connection connection = null;
    // 连接数据库
    public Connection getConnection(){
    	try {
			Class.forName(jdbcName);
			connection = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
			System.out.println("----------------连接成功------------------");
		} catch (Exception e) {
			System.out.println("----------------连接失败------------------");
			e.printStackTrace();
		}
    	return connection;
    }
    // 关闭连接数据库
    public void closeCon(){
    	if(connection != null)
			try {
				connection.close();
				System.out.println("----------------关闭连接成功----------------");
			} catch (SQLException e) {
				e.printStackTrace();
			}
    }
	public static void main(String[] args) {
		// new 连接数据库对象
		DbUtil dbUtil = new DbUtil();
		dbUtil.getConnection();
		dbUtil.closeCon();

	}

}
