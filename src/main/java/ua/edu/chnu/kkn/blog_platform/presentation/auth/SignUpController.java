package ua.edu.chnu.kkn.blog_platform.presentation.auth;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SignUpController {

    @GetMapping("/signup")
    public String signUp(Model model) {
        return "signup";
    }
}
