package util;

public class DBConnTests {
	public static void main(String[] args) {
		testgetConnection();
	}
	
	public static void testgetConnection() {
		System.out.println(DBConn.getConnection());
	}
}
