package ua.edu.chnu.kkn.blog_platform.presentation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import ua.edu.chnu.kkn.blog_platform.data.AuthorRepository;
import ua.edu.chnu.kkn.blog_platform.data.BlogPostRepository;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BlogPostsController {

    private final AuthorRepository authorRepository;

    private final BlogPostRepository blogPostRepository;

    public BlogPostsController(AuthorRepository authorRepository, BlogPostRepository blogPostRepository) {
        this.authorRepository = authorRepository;
        this.blogPostRepository = blogPostRepository;
    }

    @GetMapping("/")
    public String blogPosts(Model model) {
        var authors = authorRepository.findAll();
        model.addAttribute("authors", authors);
        var blogPosts = blogPostRepository.findAll();
        model.addAttribute("blogPosts", blogPosts);
        return "blog_posts";
    }
}
