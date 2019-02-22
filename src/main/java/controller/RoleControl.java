package controller;

import domain.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.OpService;
import service.PmService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class RoleControl {


    @Autowired
    private PmService pmService;

    public void setPmService(PmService pmService) {
        this.pmService = pmService;
    }

    @RequestMapping( "/setpermission" )
    public void setPermission(HttpServletRequest request, HttpServletResponse response) throws Exception{
        //获取opIdList
        String[] opIdlist = request.getParameterValues("operation");
        //获取角色id
        String rid = request.getParameter("rid");
        //获取资源id
        String obid = request.getParameter("obid");

        pmService.setDocPermission(opIdlist,rid,obid);

    }
}
