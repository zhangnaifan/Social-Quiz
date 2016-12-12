package com.action;

import java.io.InputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.service.FileUploadService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * Í¼Æ¬Êä³ö
 * @param <HttpServletRequest>

 */
@SuppressWarnings("hiding")
public class OutPictureAction<HttpServletRequest> extends ActionSupport {
	private static final long serialVersionUID = 1L;     
	@SuppressWarnings("unchecked")
	@Override
	public String execute() throws Exception {
	    HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest(); 
	    int id=Integer.parseInt(((ServletRequest) request).getParameter("id")); 
	    FileUploadService service=new FileUploadService(); 
	    InputStream in=service.getPicById(id); 
	    HttpServletResponse response=ServletActionContext.getResponse(); 
	    response.setContentType("image/gif"); 
	    int size=in.available(); 
	    byte[] image=new byte[size]; 
	    in.read(image); 
	    ServletOutputStream out=response.getOutputStream(); 
	    out.write(image); 
	    return null;
	}
}