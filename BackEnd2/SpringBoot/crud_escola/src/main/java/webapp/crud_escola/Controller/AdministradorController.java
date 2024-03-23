package webapp.crud_escola.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import webapp.crud_escola.Model.Administrador;
import webapp.crud_escola.Repository.AdministradorRepository;
import webapp.crud_escola.Repository.VerificaCadastroAdmRepository;

@Controller
public class AdministradorController {
    @Autowired
    private AdministradorRepository ar;

    @Autowired
    private VerificaCadastroAdmRepository vcr;

    @PostMapping("/cad-adm")
    public String postCadAdm(Administrador adm) {
        String cpfVerificar = vcr.findByCpf(adm.getCpf()).getCpf();
        if (cpfVerificar == adm.getCpf()) {
            ar.save(adm);
        }
        return "adm/login-adm";
    }
}
