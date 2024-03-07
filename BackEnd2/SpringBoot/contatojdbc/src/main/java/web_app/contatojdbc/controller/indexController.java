package web_app.contatojdbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import web_app.contatojdbc.connection.EmailDAO;

@Controller
public class indexController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView abrirIndex(){
        ModelAndView mv = new ModelAndView("index");
        EmailDAO obj = new EmailDAO();
        obj.criarTabela();
        return mv;
    }
    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ModelAndView buscarIndex(@RequestParam("email") String email) {
        ModelAndView mv = new ModelAndView("index");

        new EmailDAO().cadastrar(email);

        return mv;
    }
    
}
