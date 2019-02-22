package dao;

import domain.DocResource;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class DocDao extends JdbcDaoSupport{

    public List<DocResource> getDoc(){
        String sql = "SELECT * FROM doc_object";
        List<DocResource> list = this.getJdbcTemplate().query(sql, new DocRowMapper());
        return list;
    }
}

class DocRowMapper implements RowMapper<DocResource> {
    public DocResource mapRow(ResultSet rs, int rowNum) throws SQLException {
        DocResource doc = new DocResource();
        System.out.println("111111");
        doc.setDocid(rs.getString("docid"));
        doc.setDocname(rs.getString("docname"));
        doc.setUpload_name(rs.getString("upload_name"));
        doc.setUpload_date(rs.getString("upload_date"));
        doc.setDocstate(rs.getString("docstate"));
        return doc;
    }
}