package ua.edu.chnu.kkn.blog_platform.data.user;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class BlogPlatformUserDetailsService implements UserDetailsService {

    private final BlogPlatformUserRepository blogPlatformUserRepository;

    public BlogPlatformUserDetailsService(BlogPlatformUserRepository blogPlatformUserRepository) {
        this.blogPlatformUserRepository = blogPlatformUserRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        var blogPlatformUser = blogPlatformUserRepository.findByUserName(username);
        if (blogPlatformUser.isPresent()) {
            var blogPlatformUserObj = blogPlatformUser.get();
            return User.builder()
                    .username(blogPlatformUserObj.getUserName())
                    .password(blogPlatformUserObj.getPassword())
                    .roles(blogPlatformUserObj.getRole())
                    .build();
        } else {
            throw new UsernameNotFoundException("Username not found: " + username);
        }
    }
}
