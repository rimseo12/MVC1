package net.bbs.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
 public static Connection getConnection(){
	  Connection CN=null;
	  try{
	  	 //����1 ����Ŭ ����̺� ���̺귯�� �ε�, database���� ����ϴ� ����� �ٸ���
	  	 Class.forName("oracle.jdbc.driver.OracleDriver");
	  	 
	  	 //����2 database���� ����, ����id, ��й�ȣ�� CN���� �����Ѽ� ���߿� ��ɾ���� 
	  	 String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	  	 CN=DriverManager.getConnection(url,"system","oracle"); // ,id,password
	  	 System.out.println("DB���Ἲ�� DB�۾�����06-18-ȭ����:");	 
	  	 }catch(Exception ex){System.out.println("DB�������:"+ ex);}
	  return CN;
 }//end	
	
	
}//class end
