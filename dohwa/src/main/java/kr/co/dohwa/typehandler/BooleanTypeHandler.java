package kr.co.dohwa.typehandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class BooleanTypeHandler implements TypeHandler<Boolean> {

	@Override
	public void setParameter(PreparedStatement ps, int i, Boolean parameter, JdbcType jdbcType) throws SQLException {
		ps.setString(i, parseString(parameter));
	}

	@Override
	public Boolean getResult(ResultSet rs, String columnName) throws SQLException {
		String s = rs.getString(columnName);
		return parseBoolean(s);
	}

	@Override
	public Boolean getResult(ResultSet rs, int columnIndex) throws SQLException {
		String s = rs.getString(columnIndex);
		return parseBoolean(s);
	}

	@Override
	public Boolean getResult(CallableStatement cs, int columnIndex) throws SQLException {
		String s = cs.getString(columnIndex);
		return parseBoolean(s);
	}

	private boolean parseBoolean(String s) {

		if(null == s) {
			return false;
		}

		s = s.trim().toUpperCase();

		if(s.length() == 0) {
			return false;
		}

		return "Y".equals(s);
	}

	private String parseString(Boolean bool) {
		return (null != bool && bool) ? "Y" : "N";
	}
}
