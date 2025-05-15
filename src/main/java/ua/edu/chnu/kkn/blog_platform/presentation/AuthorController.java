package ua.edu.chnu.kkn.blog_platform.presentation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.edu.chnu.kkn.blog_platform.security.AuthenticationFacade;

@Controller
public class AuthorController {

    private final AuthenticationFacade authenticationFacade;

    public AuthorController(AuthenticationFacade authenticationFacade) {
        this.authenticationFacade = authenticationFacade;
    }

    @GetMapping("/author")
    public String user(Model model) {
        model.addAttribute("isAuthenticated", authenticationFacade.isAuthenticated());
        model.addAttribute("isAdmin", authenticationFacade.isAdmin());
        return "author";
    }
}
