<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="resources.dbConnection"%>

<%
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");

   // Verify the content type
   String contentType = request.getContentType();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("C:\\final\\WebContent\\images"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      
      try { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

       
         
         while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
               String fieldName = fi.getFieldName();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
            
               String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789"
						+ "abcdefghijklmnopqrstuvxyz";

				// create StringBuffer size of AlphaNumericString
				StringBuilder sb = new StringBuilder(12);

				for (int x = 0; x < 12; x++) {

					// generate a random number between
					// 0 to AlphaNumericString variable length
					int index = (int) (AlphaNumericString.length() * Math.random());

					// add Character one by one in end of sb
					sb.append(AlphaNumericString.charAt(index));
				}
				String filenm = sb.toString()+".png";
               filePath = request.getContextPath()+"/WebContent/images/"+filenm;
               fi.write(new File(filePath)) ;
               

				Connection con = dbConnection.getConnection();
				
				PreparedStatement ps;
				ps = con.prepareStatement("update webcontent set link = ? where webpart = 'logo1'");
				ps.setString(1, "\\Final\\images\\"+filenm);
				
				ps.executeUpdate();
				response.sendRedirect(request.getContextPath()+"/Admin/ContentManagement");
            }
         }
    
      } catch(Exception ex) {
         System.out.println(ex);
      }
   } else {
	   response.sendRedirect(request.getContextPath()+"/Admin/ContentManagement");
   }
%>