package Web;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@MultipartConfig
public class ProfileServlet extends HttpServlet{
	
	private static final String SESSION_FULLNAME = "profileFullname";
    private static final String SESSION_PHONE = "profilePhone";
    private static final String SESSION_IMAGE = "profileImage";
    private static final String SESSION_UPDATED = "profileUpdated";
    
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");

        String imageFileName = (String) session.getAttribute(SESSION_IMAGE);
        Part filePart = req.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
                String submitted = filePart.getSubmittedFileName();
                String safe = submitted == null ? "unknown" : submitted.replaceAll("[^a-zA-Z0-9._-]", "_");
                String fileName = System.currentTimeMillis() + "_" + safe;

                Path uploadDir = resolveUploadDir(req);
                Files.createDirectories(uploadDir);

                Path destination = uploadDir.resolve(fileName);
                try (InputStream input = filePart.getInputStream()) {
                        Files.copy(input, destination, StandardCopyOption.REPLACE_EXISTING);
                }

                if (imageFileName != null && !imageFileName.isBlank()) {
                        Files.deleteIfExists(uploadDir.resolve(imageFileName));
                }

                imageFileName = fileName;
        }
        
        session.setAttribute(SESSION_FULLNAME, fullname);
        session.setAttribute(SESSION_PHONE, phone);
        session.setAttribute(SESSION_IMAGE, imageFileName);
        session.setAttribute(SESSION_UPDATED, Boolean.TRUE);

        resp.sendRedirect(req.getContextPath() + "/profile");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
        
		if (session != null) {
                req.setAttribute("fullname", session.getAttribute(SESSION_FULLNAME));
                req.setAttribute("phone", session.getAttribute(SESSION_PHONE));
                req.setAttribute("imagePath", session.getAttribute(SESSION_IMAGE));

                Object updated = session.getAttribute(SESSION_UPDATED);
                if (updated != null) {
                        req.setAttribute("updated", updated);
                        session.removeAttribute(SESSION_UPDATED);
                }
        }

        req.getRequestDispatcher("/profile.jsp").forward(req, resp);
	}
	
	private Path resolveUploadDir(HttpServletRequest req) {
        String realPath = req.getServletContext().getRealPath("/uploads");
        if (realPath == null || realPath.isBlank()) {
                return Path.of(System.getProperty("java.io.tmpdir"), "uploads");
        }
        return Path.of(realPath);
}
}
