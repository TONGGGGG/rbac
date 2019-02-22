package domain;

public class Operation {
    private String opid;
    private String opname;
    private  String opdescription;


    public String getOpname() {
        return opname;
    }

    public void setOpname(String opname) {
        this.opname = opname;
    }

    public String getOpid() {
        return opid;
    }

    public void setOpid(String opid) {
        this.opid = opid;
    }

    public String getOpdescription() {
        return opdescription;
    }

    public void setOpdescription(String opdescription) {
        this.opdescription = opdescription;
    }
}
