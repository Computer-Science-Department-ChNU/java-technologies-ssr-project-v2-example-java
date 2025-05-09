package ua.edu.chnu.kkn.blog_platform.presentation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthorController {

    @GetMapping("/author")
    public String user(Model model) {
        return "author";
    }
}
