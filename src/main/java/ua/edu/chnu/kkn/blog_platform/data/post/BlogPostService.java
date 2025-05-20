package ua.edu.chnu.kkn.blog_platform.data.post;

import org.springframework.stereotype.Service;
import ua.edu.chnu.kkn.blog_platform.security.AuthenticationInfoFacade;

import java.util.List;

@Service
public class BlogPostService {

    private final BlogPostRepository blogPostRepository;

    private final AuthorRepository authorRepository;

    private final AuthenticationInfoFacade authenticationInfoFacade;

    public BlogPostService(
            BlogPostRepository blogPostRepository, AuthorRepository authorRepository,
            AuthenticationInfoFacade authenticationInfoFacade) {
        this.blogPostRepository = blogPostRepository;
        this.authorRepository = authorRepository;
        this.authenticationInfoFacade = authenticationInfoFacade;
    }

    public List<BlogPost> getAuthorBlogPosts() {
        var author = authorRepository.findByProfileName(authenticationInfoFacade.getUsername());
        if (author.isPresent()) {
            return blogPostRepository.findByAuthor(author.get());
        }
        return List.of();
    }


}
