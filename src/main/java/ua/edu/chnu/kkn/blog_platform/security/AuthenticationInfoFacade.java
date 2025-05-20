package ua.edu.chnu.kkn.blog_platform.security;

public interface AuthenticationInfoFacade {

    boolean isAuthenticated();

    boolean isAdmin();

    String getUsername();
}
