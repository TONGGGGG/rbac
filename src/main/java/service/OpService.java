package service;

import dao.OpDao;
import domain.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class OpService {
    @Autowired
    private OpDao opdao;

    public void setOpdao(OpDao opdao) {
        this.opdao = opdao;
    }

    public List<Operation> getOperationList(String uid, String obid){
        return opdao.getOperationList(uid,obid);
    }


}
