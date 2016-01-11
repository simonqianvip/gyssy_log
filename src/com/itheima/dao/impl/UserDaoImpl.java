package com.itheima.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.apache.commons.dbutils.QueryRunner;
import com.itheima.dao.UserDao;
import com.itheima.domain.User;
import com.itheima.exception.DaoException;
import com.itheima.util.OracleDBCPUtil;

public class UserDaoImpl implements UserDao {
//	private QueryRunner qr = new QueryRunner(DBCPUtil.getDataSource());
	private QueryRunner qr = new QueryRunner(OracleDBCPUtil.getDataSource());
	@Override
	public boolean hasName(String username) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean isUser(User user) {
		Connection conn=null;
		Statement statement =null;
		ResultSet set = null;
		boolean flag = false;
		try{
		int count =0;
		conn = OracleDBCPUtil.getConnection();
		statement = conn.createStatement();
			
			String sql = "select count(*) from webmanager.users where username = '"+user.getUsername()+"' and password = '"+user.getPassword()+"'";
			set = statement.executeQuery(sql);
			while(set.next()){
				count = set.getInt(1);
				if(count==1){
					flag = true;
				}
			}
//			List<User> list = qr.query("select * from users where username = ? and password = ?", new BeanListHandler<User>(User.class),user.getUsername(),user.getPassword());
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException(e);
		}finally{
			OracleDBCPUtil.relase(set, statement, conn);
		}
		return flag;
	}

}
