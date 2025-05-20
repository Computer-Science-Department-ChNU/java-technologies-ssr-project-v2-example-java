package ua.edu.chnu.kkn.blog_platform.presentation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.edu.chnu.kkn.blog_platform.data.post.BlogPostRepository;
import ua.edu.chnu.kkn.blog_platform.security.AuthenticationInfoFacade;

@Controller
public class HomeController {

    private final BlogPostRepository blogPostRepository;

    private final AuthenticationInfoFacade authenticationInfoFacade;

    public HomeController(BlogPostRepository blogPostRepository, AuthenticationInfoFacade authenticationInfoFacade) {
        this.blogPostRepository = blogPostRepository;
        this.authenticationInfoFacade = authenticationInfoFacade;
    }

    @GetMapping("/")
    public String showBlogPosts(Model model) {
        model.addAttribute("blogPosts", blogPostRepository.findAll());
        model.addAttribute("isAuthenticated", authenticationInfoFacade.isAuthenticated());
        model.addAttribute("isAdmin", authenticationInfoFacade.isAdmin());
        return "home";
    }
}
