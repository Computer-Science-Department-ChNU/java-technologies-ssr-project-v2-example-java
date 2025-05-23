package ua.edu.chnu.kkn.blog_platform.presentation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import ua.edu.chnu.kkn.blog_platform.data.post.BlogPostRequest;
import ua.edu.chnu.kkn.blog_platform.data.post.BlogPostService;
import ua.edu.chnu.kkn.blog_platform.data.post.DeleteBlogPostRequest;
import ua.edu.chnu.kkn.blog_platform.data.post.EditBlogPostRequest;
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
    public String author(Model model) {
        var posts = blogPostService.getAuthorBlogPosts();
        System.out.println(posts);
        model.addAttribute("myBlogPosts", posts);
        model.addAttribute("isAuthenticated", authenticationInfoFacade.isAuthenticated());
        model.addAttribute("isAdmin", authenticationInfoFacade.isAdmin());
        return "author";
    }

    @PostMapping("/post/create")
    public String createPost(@ModelAttribute BlogPostRequest newPost) {
        blogPostService.createNewBlogPost(newPost);
        return "redirect:/author";
    }

    @PostMapping("/post/edit")
    public String editPost(@ModelAttribute EditBlogPostRequest newPost) {
        blogPostService.editBlogPost(newPost);
        return "redirect:/author";
    }

    @PostMapping("/post/delete")
    public String deletePost(@ModelAttribute DeleteBlogPostRequest newPost) {
        blogPostService.deleteBlogPost(newPost);
        return "redirect:/author";
    }
}
