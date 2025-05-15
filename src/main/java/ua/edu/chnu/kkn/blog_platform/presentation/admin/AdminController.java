package ua.edu.chnu.kkn.blog_platform.presentation.admin;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.edu.chnu.kkn.blog_platform.security.AuthenticationFacade;

@Controller
public class AdminController {

    private final AuthenticationFacade authenticationFacade;

    public AdminController(AuthenticationFacade authenticationFacade) {
        this.authenticationFacade = authenticationFacade;
    }

    @GetMapping("/admin")
    public String admin(Model model, Authentication auth) {
        model.addAttribute("isAuthenticated", authenticationFacade.isAuthenticated());
        model.addAttribute("isAdmin", authenticationFacade.isAdmin());
        return "admin";
    }
}
