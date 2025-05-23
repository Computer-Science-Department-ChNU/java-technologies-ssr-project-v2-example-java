package ua.edu.chnu.kkn.blog_platform.data.post;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import ua.edu.chnu.kkn.blog_platform.security.AuthenticationInfoFacade;

import java.time.LocalDate;
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
            return blogPostRepository.findByAuthorOrderByTitleAscPublishingDateDesc(author.get());
        }
        return List.of();
    }

    public BlogPost createNewBlogPost(BlogPostRequest blogPostRequest) {
        var author = authorRepository.findByProfileName(authenticationInfoFacade.getUsername());
        if (author.isPresent()) {
            var blogPost = new BlogPost();
            blogPost.setTitle(blogPostRequest.title());
            blogPost.setContent(blogPostRequest.content());
            blogPost.setPublishingDate(LocalDate.now());
            blogPost.setAuthor(author.get());
            return blogPostRepository.save(blogPost);
        } else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND,
                    "author with name " + authenticationInfoFacade.getUsername() + "entity not found");
        }
    }

    public BlogPost editBlogPost(EditBlogPostRequest blogPostRequest) {
        var author = authorRepository.findByProfileName(authenticationInfoFacade.getUsername());
        if (author.isPresent()) {
            var oldBlogPost = blogPostRepository.findById(blogPostRequest.id());
            if (oldBlogPost.isPresent()) {
                var blogPost = oldBlogPost.get();
                blogPost.setTitle(blogPostRequest.title());
                blogPost.setContent(blogPostRequest.content());
                blogPost.setAuthor(author.get());
                return blogPostRepository.save(blogPost);
            } else {
                throw new ResponseStatusException(HttpStatus.NOT_FOUND,
                        "Blog post with id " + oldBlogPost.get().getId() + " not found.");
            }
        } else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND,
                    "Author with name " + authenticationInfoFacade.getUsername() + " not found.");
        }
    }

    public void deleteBlogPost(DeleteBlogPostRequest deleteBlogPostRequest) {
        blogPostRepository.deleteById(deleteBlogPostRequest.id());
    }
}
