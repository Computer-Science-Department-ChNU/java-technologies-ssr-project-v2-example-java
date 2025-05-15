package ua.edu.chnu.kkn.blog_platform.presentation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.edu.chnu.kkn.blog_platform.data.post.BlogPostRepository;
import ua.edu.chnu.kkn.blog_platform.security.AuthenticationFacade;

@Controller
public class HomeController {

    private final BlogPostRepository blogPostRepository;

    private final AuthenticationFacade authenticationFacade;

    public HomeController(BlogPostRepository blogPostRepository, AuthenticationFacade authenticationFacade) {
        this.blogPostRepository = blogPostRepository;
        this.authenticationFacade = authenticationFacade;
    }

    @GetMapping("/")
    public String showBlogPosts(Model model) {
        model.addAttribute("blogPosts", blogPostRepository.findAll());
        model.addAttribute("isAuthenticated", authenticationFacade.isAuthenticated());
        model.addAttribute("isAdmin", authenticationFacade.isAdmin());
        return "home";
    }
}
