package Web;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class ProfileServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String fullname = req.getParameter("fullname");
		String phone = req.getParameter("phone");

		Part filePart = req.getPart("image");
		String fileName = null;
		if (filePart != null && filePart.getSize() > 0) {
			String submitted = filePart.getSubmittedFileName();
			String safe = submitted == null ? "unknown" : submitted.replaceAll("[^a-zA-Z0-9._-]", "_");
			fileName = System.currentTimeMillis() + "_" + safe;

			String uploadDir = req.getServletContext().getRealPath("/uploads");
			File dir = new File(uploadDir);
			if (!dir.exists())
				dir.mkdirs();

			filePart.write(new File(dir, fileName).getAbsolutePath());
		}

		req.setAttribute("fullname", fullname);
		req.setAttribute("phone", phone);
		req.setAttribute("imagePath", fileName);
		req.getRequestDispatcher("/profile.jsp").forward(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/profile.jsp").forward(req, resp);
	}
}
