package net.bbs.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class DBBbs {
Connection CN;
Statement ST;
PreparedStatement PST;
ResultSet RS;
String msg;

String Tid,Tname,Ttitle,Tcontent,T_img_name;
Date T_img_date;
int Gtotal,T_view,Tnum,Like,total;

public DBBbs() {
	CN=DB.getConnection();
}//end


public void dbDelete(int Tnum) { //����  Tnum�� �ҷ��;��� DeleteController����
	
	try {
		msg="delete from guest where t_num="+Tnum;
		ST=CN.createStatement();
		ST.executeUpdate(msg);
	}catch (Exception e) {
	System.out.println("����������� ����"+e);
	}
}

}
