package ua.edu.chnu.kkn.blog_platform.data.user;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface BlogPlatformUserRepository extends CrudRepository<BlogPlatformUser, Long> {

    Optional<BlogPlatformUser> findByUserName(String userName);
}
