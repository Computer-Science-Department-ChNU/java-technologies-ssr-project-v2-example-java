package ua.edu.chnu.kkn.blog_platform.security;

public interface AuthenticationFacade {

    boolean isAuthenticated();

    boolean isAdmin();
}
