package com.action;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.service.FileUploadService;
import com.model.Picture;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * @author dzy
 */
public class FileUploadAction extends ActionSupport {
	 private static final long serialVersionUID = 1L;
	 private File file;
	 public File getFile() {
		 return file;
	 }
	 public void setFile(File file) {
		 this.file = file;
	 }
	 /**
	  * 上传文件
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	  */
	 @Override
	 public String execute() throws ClassNotFoundException, SQLException, IOException {
		 FileUploadService fuservice=new FileUploadService();
		 if(fuservice.fileUpload(file)){
			 List<Picture> list=fuservice.findAll();
			 ActionContext cxt=ActionContext.getContext();
			 cxt.put("list",list);
			 return SUCCESS;
		 }else{
			 super.addActionError(this.getText("fileupload.fail"));
			 return INPUT;
		 }
	 }
}