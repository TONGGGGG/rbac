package controller;

//import com.alibaba.fastjson.JSON;

import com.alibaba.fastjson.JSON;
import domain.Operation;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.OpService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class OpControl {
    @Autowired
    private OpService OpService;

    public void setOpService(service.OpService opService) {
        OpService = opService;
    }

    @RequestMapping( "/showoperation" )
    public void showDoc(HttpServletRequest request, HttpServletResponse response) throws Exception{

        String uid = ((User) request.getSession().getAttribute("user")).uid;

        String obid = request.getParameter("obid");

        System.out.println(uid +"---"+obid);

        List<Operation> list = OpService.getOperationList(uid,obid);

        String jsonStr = JSON.toJSONString( list );


        response.setContentType("text/json;charset=UTF-8");
        response.getWriter().println(jsonStr);
        System.out.println(jsonStr);
    }
}
