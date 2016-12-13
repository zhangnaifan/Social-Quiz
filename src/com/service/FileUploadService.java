package com.service;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.MathContext;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.util.List;

import javax.imageio.ImageIO;

import com.db.Dao;

public class FileUploadService {

	 /**
	  * 上传图片到数据库
	  * @param flie
	  * @return boolean
	  *         上传是否成功
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	  */
	 public boolean fileUpload(File file, int id) throws SQLException, IOException, ClassNotFoundException {
		 Dao dao = new Dao();
		 if (file != null) {
			 	int width = 100, height = 100;
			 
			    BufferedImage bufferedImage = null; 
			    bufferedImage = ImageIO.read(file); 
			    
		        ArrayList<Integer> paramsArrayList = getAutoWidthAndHeight(bufferedImage,width,height); 
		        width = paramsArrayList.get(0); 
		        height = paramsArrayList.get(1); 
		        System.out.println("自动调整比例，width="+width+" height="+height); 
			      
			    Image image = bufferedImage.getScaledInstance(width, height, 
			        Image.SCALE_DEFAULT); 
			    BufferedImage outputImage = new BufferedImage(width, height, 
			        BufferedImage.TYPE_INT_RGB); 
			    Graphics graphics = outputImage.getGraphics(); 
			    graphics.drawImage(image, 0, 0, null); 
			    graphics.dispose(); 
			    ImageIO.write(outputImage, "jpg", file); 
			 
			 
			 dao.picture(file, id);
		 }
		 return true;
	 }
	 
	 private ArrayList<Integer> getAutoWidthAndHeight(BufferedImage bufferedImage,int width_scale,int height_scale){ 
		    ArrayList<Integer> arrayList = new ArrayList<Integer>(); 
		    int width = bufferedImage.getWidth(); 
		    int height = bufferedImage.getHeight(); 
		    double scale_w =getDot2Decimal( width_scale,width); 
		      
		    System.out.println("getAutoWidthAndHeight width="+width + "scale_w="+scale_w); 
		    double scale_h = getDot2Decimal(height_scale,height); 
		    if (scale_w<scale_h) { 
		      arrayList.add(parseDoubleToInt(scale_w*width)); 
		      arrayList.add(parseDoubleToInt(scale_w*height)); 
		    } 
		    else { 
		      arrayList.add(parseDoubleToInt(scale_h*width)); 
		      arrayList.add(parseDoubleToInt(scale_h*height)); 
		    } 
		    return arrayList; 
		      
		  } 
	 
	 private static int parseDoubleToInt(double sourceDouble) { 
		    int result = 0; 
		    result = (int) sourceDouble; 
		    return result; 
		  } 
	 
	 public double getDot2Decimal(int a,int b){ 
	      
		    BigDecimal bigDecimal_1 = new BigDecimal(a); 
		    BigDecimal bigDecimal_2 = new BigDecimal(b); 
		    BigDecimal bigDecimal_result = bigDecimal_1.divide(bigDecimal_2,new MathContext(4)); 
		    Double double1 = new Double(bigDecimal_result.toString()); 
		    System.out.println("相除后的double为："+double1); 
		    return double1; 
		  } 

	 /**
	  * 检索所有图片
	  * @return list
	  *        返回所有图片记录
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	  */
	/* public List<Picture> findAll() throws ClassNotFoundException, SQLException {
		 List<Picture> list = new ArrayList<Picture>();
		 Picture pic = null;
		 ResultSet rs = null;
		 
		 Dao dao = new Dao();
		 String sql = "select id from user";
		 rs = dao.executeQuery(sql);
		 while (rs.next()) {
			 pic = new Picture();
			 pic.setId(rs.getInt("id"));
			 list.add(pic);
		 }
		return list;
		 
		 try {
			 String sql = "select id from savepicture";
			 conn = GetConnection.getConn();
			 if (conn == null) {
				 System.out.println("连接为null");
				 return null;
			 }
			 ps = conn.prepareStatement(sql);
			 rs = ps.executeQuery();
			 while (rs.next()) {
				 pic = new Picture();
				 pic.setId(rs.getInt("id"));
				 list.add(pic);
			 }
			 GetConnection.close(conn, ps, rs);
			 return list;
		 } catch (Exception e) {
			 e.printStackTrace();
			 GetConnection.close(conn, ps, rs);
			 return null;
		 }
		
	 }*/

	 /**
	  * 根据图片ID获取流对象
	  * @param id
	  * @return InputStream
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	  */
	 public InputStream getPicById(int id) throws ClassNotFoundException, SQLException {
		 ResultSet rs = null;
		 InputStream is = null;
		 
		 Dao dao = new Dao();
		 String sql = "select picture  from user where id="+id;
		 rs = dao.executeQuery(sql);
		 if(rs.next()){
			 is = rs.getBinaryStream("picture");
			 return is;
		 }
		 return null;
		 
		/* try {
			 String sql = "select picture  from savepicture where id=?";
			 conn = GetConnection.getConn();
			 ps = conn.prepareStatement(sql);
			 ps.setInt(1, id);
			 rs = ps.executeQuery();
			 if(rs.next()){
				 is = rs.getBinaryStream("picture");
				 GetConnection.close(conn, ps, rs);
				 return is;
			 }
			 GetConnection.close(conn, ps, rs);
			 return null;
		 } catch (Exception ex) {
			 ex.printStackTrace();
			 GetConnection.close(conn, ps, rs);
			 return null;
		 }*/
	 }

}