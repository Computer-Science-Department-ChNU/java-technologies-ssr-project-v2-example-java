package ua.edu.chnu.kkn.blog_platform.presentation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.edu.chnu.kkn.blog_platform.data.AuthorRepository;

@Controller
public class BlogPostsController {

    private final AuthorRepository authorRepository;

    public BlogPostsController(AuthorRepository authorRepository) {
        this.authorRepository = authorRepository;
    }

    @GetMapping("/")
    public String showBlogPosts(Model model) {
        var authors = authorRepository.findAll();
        model.addAttribute("authors", authors);
        return "blog_posts";
    }
}
