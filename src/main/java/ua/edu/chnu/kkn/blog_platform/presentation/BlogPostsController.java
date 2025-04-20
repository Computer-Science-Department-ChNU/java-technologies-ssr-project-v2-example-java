package ua.edu.chnu.kkn.blog_platform.presentation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.edu.chnu.kkn.blog_platform.data.BlogPostRepository;

@Controller
public class BlogPostsController {

    private final BlogPostRepository blogPostRepository;

    public BlogPostsController(BlogPostRepository blogPostRepository) {
        this.blogPostRepository = blogPostRepository;
    }

    @GetMapping("/")
    public String showBlogPosts(Model model) {
        var blogPosts = blogPostRepository.findAll();
        model.addAttribute("blogPosts", blogPosts);
        return "blog_posts";
    }
}
