package servlets;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lunasoft.ZipUtils;

public class KlyuvdiiDownloadAll extends HttpServlet
{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// Create zip output stream.
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ZipOutputStream zip = new ZipOutputStream(new BufferedOutputStream(baos));
		//zip.setEncoding("Cp866");
		zip.setComment("Klyuvdii archive\n" +
			"E-mail: klyuvdii@mail.ru\n" +
			"Download date is : " + new Date().toString());

		File dir = new File(request.getRealPath("/klyuvdii/"));
		try
		{
			ZipUtils.addDir(dir, zip, request);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		zip.flush();
		zip.close();
		byte[] bytes = baos.toByteArray();

		String fileName = "klyuvdiiAll.zip";
		response.reset();
		response.setContentType("application/zip");
		response.setContentLength(bytes.length);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		response.setHeader("cache-control", "no-cache");

		ServletOutputStream sos = response.getOutputStream();
		sos.write(bytes);
	}
}
