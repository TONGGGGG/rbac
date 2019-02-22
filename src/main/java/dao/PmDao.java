package dao;

import domain.Operation;
import domain.Permission;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class PmDao extends JdbcDaoSupport {

    public boolean judge(String uid,String obid,String opdescription){
        String sql = "SELECT EXISTS(SELECT * FROM user_role,role,role_permission,permission,object,operation WHERE user_role.rid=role.rid AND  role.rid=role_permission.rid AND role_permission.pid=permission.pid AND permission.obid=object.obid AND permission.opid=operation.opid AND uid=? AND object.obid=? AND operation.opname=?)";
        boolean result = this.getJdbcTemplate().query(sql, new ResultSetExtractor<Boolean>() {
            @Override
            public Boolean extractData(ResultSet rs) throws SQLException,DataAccessException {
                if(rs.next()){
                    boolean result = rs.getBoolean(1);
                    return result;
                }
                return false;
            }
        }, uid,obid,opdescription);
        return result;
    }


    public boolean deleteAllPm(String rid,String obid){
        String sql = "DELETE role_permission FROM role_permission,permission where role_permission.pid = permission.pid AND rid=? AND obid=?";
        int temp = this.getJdbcTemplate().update(sql,rid,obid);
        return temp>0;
    }

    public boolean setPermission(String[] opIdlis,String rid, String obid){

        //先查出对应的权限对象
        String sql = "SELECT permission.* FROM permission,object,operation WHERE  permission.obid=object.obid AND permission.opid=operation.opid AND object.obid=?  AND operation.opid IN (";
        for (int i = 0; i < opIdlis.length; i++) {
            if (i!=opIdlis.length-1)
                sql+="?,";
            else
                sql+="?)";
        }

        List<String> param = new ArrayList<String>();
        param.add(obid);
        for (int i = 0; i < opIdlis.length; i++) {
            param.add(opIdlis[i]);
        }


        final List<Permission> list = this.getJdbcTemplate().query(sql,param.toArray(),new PmRowMapper());
        final String frid = rid;

        //再把权限id和rid插入到role_permission
        String sql2 = "INSERT INTO role_permission values(?,?)";
        int[] temp = this.getJdbcTemplate().batchUpdate(sql2,new BatchPreparedStatementSetter() {
            @Override
            public int getBatchSize() {
                return list.size();
            }
            @Override
            public void setValues(PreparedStatement ps, int i)
                    throws SQLException {
                ps.setString(1, frid);
                ps.setString(2, list.get(i).getPid());
            }
        });
        return true;
    }
}
class PmRowMapper implements RowMapper<Permission> {
    public Permission mapRow(ResultSet rs, int rowNum) throws SQLException {
        Permission pm = new Permission();
        pm.setPid(rs.getString("pid"));
        pm.setObid(rs.getString("obid"));
        pm.setOpid(rs.getString("opid"));
        return pm;
    }
}
