package fileUpload;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.io.File;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUploadHandler extends HttpServlet {
	private static final long serialVersionUID = 1;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String file_name = null;
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
		if (!isMultipartContent) {
			return;
		}
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		

		try {
			List<FileItem> fields = upload.parseRequest(request);
			Iterator<FileItem> it = fields.iterator();
			if (!it.hasNext()) {
				return;
			}
			while (it.hasNext()) {
				FileItem fileItem = it.next();
				boolean isFormField = fileItem.isFormField();
				if (isFormField) {
					if (file_name == null) {
						if (fileItem.getFieldName().equals("file_name")) {
							file_name = fileItem.getString();
						}
					}
				} else {
					if (fileItem.getSize() > 0) {
						String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789"
								+ "abcdefghijklmnopqrstuvxyz";

						// create StringBuffer size of AlphaNumericString
						StringBuilder sb = new StringBuilder(12);

						for (int i = 0; i < 12; i++) {

							// generate a random number between
							// 0 to AlphaNumericString variable length
							int index = (int) (AlphaNumericString.length() * Math.random());

							// add Character one by one in end of sb
							sb.append(AlphaNumericString.charAt(index));
						}
						fileItem.write(new File("C:\\final\\WebContent\\images\\"+sb.toString()+".png"));

						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
						
						PreparedStatement ps;
						ps = con.prepareStatement("update webcontent set link = ? where webpart = 'logo1'");
						ps.setString(1, "C:\\final\\webcontent\\images\\" + sb.toString() +".png");
						
						response.sendRedirect("cmsAdmin.jsp");

						// logActivity

						SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
						String dd = formatter.format(new Date());
						String act = "Admin changed logo";

						PreparedStatement logQue;
						logQue = con.prepareStatement("Insert into logs (logDate, logActivity) values(?,?)");
						logQue.setString(1, dd);
						logQue.setString(2, act);

						logQue.executeUpdate();
					}

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			out.println("<script type='text/javascript'>");
			out.println("window.location.href='cmsAdmin.jsp?");
			out.println("</script>");
			out.close();
		}

	}
}