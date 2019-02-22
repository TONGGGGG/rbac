package dao;

import domain.Operation;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class OpDao extends JdbcDaoSupport {
    public List<Operation> getOperationList(String uid,String obid){
        String sql = "SELECT DISTINCT operation.* FROM user_role,role,role_permission,permission,object,operation WHERE user_role.rid=role.rid AND  role.rid=role_permission.rid AND role_permission.pid=permission.pid AND permission.obid=object.obid AND permission.opid=operation.opid AND uid=? AND object.obid=?";
        List<Operation> list = this.getJdbcTemplate().query(sql, new OpRowMapper(),uid,obid);
        return list;
    }
}

class OpRowMapper implements RowMapper<Operation> {
    public Operation mapRow(ResultSet rs, int rowNum) throws SQLException {
        Operation op = new Operation();
        op.setOpid(rs.getString("opid"));
        op.setOpname(rs.getString("opname"));
        op.setOpdescription(rs.getString("opdescription"));
        return op;
    }
}
