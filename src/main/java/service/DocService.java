package service;

import dao.DocDao;
import domain.DocResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DocService {
    @Autowired
    private DocDao docDao;
    @Autowired
    private PmService pmService;


    public void setDocDao(DocDao docDao) {
        this.docDao = docDao;
    }

    public void setPmService(PmService pmService) {
        this.pmService = pmService;
    }

    public List<DocResource> getDoc(String uid ,String obid){
        //鉴权，查看该用户对应的角色是否对doc模块有visible权限
        boolean i = pmService.judge(uid ,obid ,"visible" );
        if (i==true)
           return docDao.getDoc();
        return null;
   }
}
