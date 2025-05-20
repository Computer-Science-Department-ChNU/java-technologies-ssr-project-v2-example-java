package ua.edu.chnu.kkn.blog_platform.presentation.admin;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.edu.chnu.kkn.blog_platform.security.AuthenticationInfoFacade;

@Controller
public class AdminController {

    private final AuthenticationInfoFacade authenticationInfoFacade;

    public AdminController(AuthenticationInfoFacade authenticationInfoFacade) {
        this.authenticationInfoFacade = authenticationInfoFacade;
    }

    @GetMapping("/admin")
    public String admin(Model model, Authentication auth) {
        model.addAttribute("isAuthenticated", authenticationInfoFacade.isAuthenticated());
        model.addAttribute("isAdmin", authenticationInfoFacade.isAdmin());
        return "admin";
    }
}
