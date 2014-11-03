package com.renrenxian.manage.mybatis.handler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class BooleanTypeHandler implements TypeHandler {

	public void setParameter(PreparedStatement ps, int i, Object parameter,
			JdbcType jdbcType) throws SQLException {
		
		 Boolean b = (Boolean) parameter;  
	     String value = (Boolean) b == true ? "Y" : "N";  
	     ps.setString(i, value);  
		
	}

	public Object getResult(ResultSet rs, String columnName)
			throws SQLException {
		String str = rs.getString(columnName);  
        Boolean rt = Boolean.FALSE;  
        if (str.equalsIgnoreCase("Y")){  
            rt = Boolean.TRUE;  
        }  
        return rt;  
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		Boolean b = rs.getBoolean(columnIndex);  
        return b == true ? "Y" : "N";
	}

	public Object getResult(CallableStatement cs, int columnIndex)
			throws SQLException {
		// TODO Auto-generated method stub
		Boolean b = cs.getBoolean(columnIndex);
		return b == true ? "Y" : "N";
	}

}
