package home;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.*;

/**
 * Servlet implementation class Signup
 */
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String first = request.getParameter("firstName");
		String last = request.getParameter("lastName");
		String email = request.getParameter("signEmail");
		String password = request.getParameter("signPassword");
//		try {
//			MessageDigest alg = MessageDigest.getInstance("MD5");
//			alg.update(password.getBytes());
//			byte[] digest = alg.digest();
//			StringBuffer hashedpasswd = new StringBuffer();
//			String hx;
//			for (int i=0;i<digest.length;i++){
//				hx =  Integer.toHexString(0xFF & digest[i]);
//				if(hx.length() == 1){hx = "0" + hx;}
//				hashedpasswd.append(hx);
//			}
//		} catch (NoSuchAlgorithmException e1) {
//			e1.printStackTrace();
//		}
		try {
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}

        try {
            Connection con = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
            Statement sta = con.createStatement();
//            sta.executeUpdate("INSERT INTO details (first,middle,last,gender,subj,yr,sec,color) VALUES ('"+first+"','"+middle+"','"+last+"','"+gender+"','"+subj+"','"+yr+"','"+sec+"','"+color+"');
            sta.executeUpdate("INSERT INTO user"
                    + " (email, password, firstname, lastname)"
                    + " VALUES ('" + email + "','" + password + "','" + first + "','" + last + "')");

            sta.close();
            con.close();
        } catch (SQLException ex) {
            while (ex != null) {
                System.out.println("SQL Exception: " + ex.getMessage());
                ex = ex.getNextException();
            }
        }
        
        response.sendRedirect("landingpage.jsp");
	}

}
