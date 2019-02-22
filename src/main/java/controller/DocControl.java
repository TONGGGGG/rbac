package controller;

import domain.DocResource;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.DocService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class DocControl {
    @Autowired
    private DocService docService;

    public void setDocService(DocService docService) {
        this.docService = docService;
    }

    @RequestMapping( "/show" )
    public String showDoc(HttpServletRequest request, HttpServletResponse response) throws Exception{

        String uid = (String) request.getSession().getAttribute("uid");
        List<DocResource> list = docService.getDoc("005","001");

        request.getSession().setAttribute("user", new User("005","admin"));
        request.setAttribute("list", list);

        return "docview.jsp";
}


//    @RequestMapping( "/showView" )
//    public List<DocResource> showDoc(HttpServletRequest request) {
//
//        String uid = (String) request.getSession().getAttribute("uid");
//
//        List<DocResource> list = docService.getDoc(uid);
//
//        return list;
//
//    }
}
