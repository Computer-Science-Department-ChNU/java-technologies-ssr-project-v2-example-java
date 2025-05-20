package ua.edu.chnu.kkn.blog_platform.presentation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.edu.chnu.kkn.blog_platform.data.post.BlogPostService;
import ua.edu.chnu.kkn.blog_platform.security.AuthenticationInfoFacade;

@Controller
public class AuthorController {

    private final BlogPostService blogPostService;

    private final AuthenticationInfoFacade authenticationInfoFacade;

    public AuthorController(BlogPostService blogPostService, AuthenticationInfoFacade authenticationInfoFacade) {
        this.blogPostService = blogPostService;
        this.authenticationInfoFacade = authenticationInfoFacade;
    }

    @GetMapping("/author")
    public String user(Model model) {
        var posts = blogPostService.getAuthorBlogPosts();
        System.out.println(posts);
        model.addAttribute("myBlogPosts", posts);
        model.addAttribute("isAuthenticated", authenticationInfoFacade.isAuthenticated());
        model.addAttribute("isAdmin", authenticationInfoFacade.isAdmin());
        return "author";
    }
}
