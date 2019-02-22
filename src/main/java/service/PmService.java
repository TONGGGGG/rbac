package service;

import dao.PmDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PmService {

    @Autowired
    private PmDao pmDao;

    public void setPmDao(PmDao pmDao) {
        this.pmDao = pmDao;
    }

    //判断当前用户uid对某一资源模块obid是否有某一操作opdescription的权限
    public boolean judge(String uid,String obid,String opname){
        return pmDao.judge(uid,obid,opname);
    }


    public void setDocPermission(String[] opIdlist, String rid , String obid){
        //首先删除该角色对该资源的所有权限
        pmDao.deleteAllPm(rid,obid);
        //重新赋权
        if(pmDao.setPermission(opIdlist,rid,obid))
            System.out.println("赋权成功！！！");
        else
            System.out.println("赋权失败！！！");


}
}
