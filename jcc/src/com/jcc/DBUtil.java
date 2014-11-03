package com.jcc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil { 
	public static Connection connection;

	private static Connection connect() {
		try {
			
			String url = "jdbc:mysql://localhost:3306/jcc";
			String user = "root";
			String pwd = "sanrenxing";

			// 加载驱动，这一句也可写为：Class.forName("com.mysql.jdbc.Driver");
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			// 建立到MySQL的连接
			Connection conn = DriverManager.getConnection(url, user, pwd);
			return conn;
		} catch (Exception ex) {
			System.out.println("Error : " + ex.toString());
		}
		return null;
	}

	public static boolean addUser(String uid, String pushid,String device) {
		String type = "";
		if (device.equals("iphone")) {
			type = "4";
		}else if (device.equals("android")) {
			type = "3";
		}
		// 执行SQL语句
		try {
			boolean execute;
			if (getPushidByUid(uid)!=null) {
				PreparedStatement pst = getConnection()
				.prepareStatement("update jccpush set pushid = ? , device = ? where uid = ?");
				pst.setString(1, pushid);
				pst.setString(2, type);
				pst.setString(3, uid);
				execute = pst.execute();
				pst.close();
			}else {
				PreparedStatement pst = getConnection()
				.prepareStatement("insert into jccpush values(?,?,?)");
				pst.setString(1, uid);
				pst.setString(2, pushid);
				pst.setString(3, type);
				execute = pst.execute();
				pst.close();
			}
			return execute;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static String[] getPushidByUid(String uid) {
		try {
			// 执行SQL语句
			Statement stmt = getConnection().createStatement();// 创建语句对象，用以执行sql语言
			ResultSet rs = stmt
					.executeQuery("select * from jccpush where uid = " + uid);

			// 处理结果集
			while (rs.next()) {
				String res1 = rs.getString("pushid");
				String res2 = rs.getString("device");
				return new String[]{res1,res2};
			}
			rs.close();// 关闭数据库
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private static Connection getConnection() {
		try {
			if (connection == null||connection.isClosed()) {
				connection = connect();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public static void main(String[] args) {
		addUser("22", "33333","33");
		System.out.println(getPushidByUid("22"));
	}
}
