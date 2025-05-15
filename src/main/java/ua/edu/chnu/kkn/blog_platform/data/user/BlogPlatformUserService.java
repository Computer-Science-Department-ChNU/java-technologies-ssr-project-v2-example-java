package ua.edu.chnu.kkn.blog_platform.data.user;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ua.edu.chnu.kkn.blog_platform.data.post.Author;
import ua.edu.chnu.kkn.blog_platform.data.post.AuthorRepository;
import ua.edu.chnu.kkn.blog_platform.security.Role;

@Service
public class BlogPlatformUserService {

    private final BlogPlatformUserRepository blogPlatformUserRepository;

    private final AuthorRepository authorRepository;

    private final PasswordEncoder  passwordEncoder;

    public BlogPlatformUserService(BlogPlatformUserRepository blogPlatformUserRepository,
                                   AuthorRepository authorRepository,
                                   PasswordEncoder passwordEncoder) {
        this.blogPlatformUserRepository = blogPlatformUserRepository;
        this.authorRepository = authorRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public BlogPlatformUser signUpAuthor(BlogPlatformUserRequest blogPlatformUserRequest) {
        var blogPlatformUser = blogPlatformUserRepository
                .save(mapBlogPlatformUserRequestToEntity(blogPlatformUserRequest, Role.AUTHOR));
        persistAuthor(blogPlatformUserRequest);
        return blogPlatformUser;
    }

    public BlogPlatformUser signUpAdmin(BlogPlatformUserRequest blogPlatformUserRequest) {
        return blogPlatformUserRepository.save(mapBlogPlatformUserRequestToEntity(blogPlatformUserRequest, Role.ADMIN));
    }

    private BlogPlatformUser mapBlogPlatformUserRequestToEntity(BlogPlatformUserRequest blogPlatformUserRequest,
                                                                Role role) {
        var blogPlatformUser = new BlogPlatformUser();
        blogPlatformUser.setFirstName(blogPlatformUserRequest.firstName());
        blogPlatformUser.setLastName(blogPlatformUserRequest.lastName());
        blogPlatformUser.setUserName(blogPlatformUserRequest.userName());
        blogPlatformUser.setPassword(passwordEncoder.encode(blogPlatformUserRequest.password()));
        blogPlatformUser.setRole(role.name());
        return blogPlatformUser;
    }

    private void persistAuthor(BlogPlatformUserRequest blogPlatformUserRequest) {
        var authorName = String.format("%s %s", blogPlatformUserRequest.firstName(), blogPlatformUserRequest.lastName());
        var author = new Author();
        author.setName(authorName);
        author.setProfileName(blogPlatformUserRequest.userName());
        authorRepository.save(author);
    }
}
