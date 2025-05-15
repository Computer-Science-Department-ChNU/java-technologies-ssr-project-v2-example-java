package ua.edu.chnu.kkn.blog_platform.presentation.auth;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import ua.edu.chnu.kkn.blog_platform.data.user.BlogPlatformUser;
import ua.edu.chnu.kkn.blog_platform.data.user.BlogPlatformUserRequest;
import ua.edu.chnu.kkn.blog_platform.data.user.BlogPlatformUserService;

@RestController
public class SignUpRestController {

    private final BlogPlatformUserService blogPlatformUserService;

    public SignUpRestController(BlogPlatformUserService blogPlatformUserService) {
        this.blogPlatformUserService = blogPlatformUserService;
    }

    @PostMapping("/signup")
    public BlogPlatformUser signUpNewUser(@RequestBody BlogPlatformUserRequest user) {
        return blogPlatformUserService.signUpAuthor(user);
    }

    @PostMapping("/signup/admin")
    public BlogPlatformUser signUpNewAdmin(@RequestBody BlogPlatformUserRequest user) {
        return blogPlatformUserService.signUpAdmin(user);
    }
}
