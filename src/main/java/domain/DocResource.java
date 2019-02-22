package domain;

public class DocResource {
    private String docid;
    private String docname;
    private String upload_name;
    private String upload_date;
    private String docstate;

    public String getDocid() {
        return docid;
    }

    public void setDocid(String docid) {
        this.docid = docid;
    }

    public String getDocname() {
        return docname;
    }

    public void setDocname(String docname) {
        this.docname = docname;
    }

    public String getUpload_name() {
        return upload_name;
    }

    public void setUpload_name(String upload_name) {
        this.upload_name = upload_name;
    }

    public String getUpload_date() {
        return upload_date;
    }

    public void setUpload_date(String upload_date) {
        this.upload_date = upload_date;
    }

    public String getDocstate() {
        return docstate;
    }

    public void setDocstate(String docstate) {
        this.docstate = docstate;
    }
}
