package servletSac;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.io.IOException;
import java.util.Hashtable;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadException;
import javazoom.upload.UploadFile;
 

/**
 * Servlet implementation class ProcesoArchivo
 */
@WebServlet("/uploadContenidos")

public class uploadContenidos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadContenidos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        
		 
		 // INFORMACION DE BASE DE DATOS 
		 
		    String login_user = "sa";
			String login_password = "123";
			String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
			
		//--------------------------------------------------------------------------
         MultipartFormDataRequest mrequest = null;
         
         UploadBean upBean = null;
         
         //PARA LA GENERACION DE MENSAJES
         PrintWriter out = response.getWriter();
         
         
         String todo = null;
         String imagen = null;
         String rutaArchivo = null; //ruta de archivo de multimedia
         String nombreArchivo = null; // nombre del archivo multimedia
         String extensionArchivo = null; // extencion y formato de archivo
         
         try{
    
        	 mrequest=   new MultipartFormDataRequest(request);
             
         if (mrequest != null) {
             todo = mrequest.getParameter("todo");
         }
         if ((todo != null) && (todo.equalsIgnoreCase("upload"))) {
             
             Hashtable files = mrequest.getFiles();
             if ((files != null) && (!files.isEmpty())) {
         
            	 UploadFile file = (UploadFile) files.get("uploadfile");
                 
                 
                 upBean = new UploadBean();
                 upBean.setFolderstore("C:\\Program Files\\Glashfish\\glassfish\\domains\\domain1\\applications\\SAC\\multimedia\\");
                 upBean.setFolderstore("D:\\TESIS\\TESIS CHD-MAJO\\SISTEMA ADMINSTRACION DE CONTENIDOS\\SAC\\WebContent\\");
                 //upBean.setFolderstore("D:\\SAC_MULTIMEDIA\\");
                 
                 
                 upBean.store(mrequest, "uploadfile");
                 
                     if (file != null) {
                         imagen = file.getFileName();
                         
                         request.setAttribute("imagen", "D:/TESIS/TESIS CHD-MAJO/SISTEMA ADMINSTRACION DE CONTENIDOS/SAC/WebContent/"+imagen);
                         rutaArchivo = "D:/TESIS/TESIS CHD-MAJO/SISTEMA ADMINSTRACION DE CONTENIDOS/SAC/WebContent/"+imagen;
                         nombreArchivo =imagen;
                         extensionArchivo = file.getContentType();
                         
                         //request.setAttribute("nombre", imagen);
                         //request.setAttribute("tipo",file.getContentType() );
                         request.setAttribute("tamanio", file.getFileSize());
                         
                     }
                     
                     // INSERCION DE RUTA DE ARCHIVO SUBIDO.

                     //------------------------------------------------------------
                     try {
             			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
             			Connection conn = DriverManager.getConnection(url, login_user,
             					login_password);
             			//System.out.println("connected");
             					Statement st;
             					st = conn.createStatement();
             					st.executeUpdate(" INSERT INTO [dbo].[lista_multimedia] (lista_multimedia_nombre,lista_multimedia_ruta,lista_multimedia_tipo) VALUES ('" + nombreArchivo + "','" + rutaArchivo + "','" + extensionArchivo + "')");
             					//response.sendRedirect("exito.jsp");
             			
             		} catch (Exception e) {
             			//response.sendRedirect("error.jsp");
             			out.println("ERROR DE BASE DE DATOS AL REGISTRAR RUTA DE ARCHIVO"); 	
             			e.printStackTrace();
             		}

                     //------------------------------------------------------------
                     
             } else {
            	 
         out.println("NO EXISTE ARCHIVO SELECCIONADO");
 	
         
             }
    
             /*if (mrequest != null) {
                 
                 nombres = mrequest.getParameter("txtNombres");
                 apellidos = mrequest.getParameter("txtApellidos");
                 direccion = mrequest.getParameter("txtDireccion");
                 telefono = mrequest.getParameter("txtTelefono");
             }
             
                 request.setAttribute("txtNombres", nombres);
                 request.setAttribute("txtApellidos", apellidos);
                 request.setAttribute("txtDireccion", direccion);
                 request.setAttribute("txtTelefono",telefono);
             */
    
     //        dispatcher = getServletContext().getRequestDispatcher("/mensaje.jsp");
     
		 //response.sendRedirect("exito.jsp");
		 
       }
         }catch(Exception e){
        	 response.sendRedirect("uploadContenidos.jsp");    
         }
 
         //dispatcher.forward(request, response);
         
         
 }
}
