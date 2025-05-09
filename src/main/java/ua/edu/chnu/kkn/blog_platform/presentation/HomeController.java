package ua.edu.chnu.kkn.blog_platform.presentation;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.edu.chnu.kkn.blog_platform.data.BlogPostRepository;

@Controller
public class HomeController {

    private final BlogPostRepository blogPostRepository;

    public HomeController(BlogPostRepository blogPostRepository) {
        this.blogPostRepository = blogPostRepository;
    }

    @GetMapping("/")
    public String showBlogPosts(Model model, Authentication auth) {
        var blogPosts = blogPostRepository.findAll();
        var isAuthenticated = auth != null && auth.isAuthenticated();
        model.addAttribute("blogPosts", blogPosts);
        model.addAttribute("isAuthenticated", isAuthenticated);
        return "home";
    }
}
