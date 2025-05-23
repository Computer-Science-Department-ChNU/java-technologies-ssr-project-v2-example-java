package ua.edu.chnu.kkn.blog_platform.data.post;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BlogPostRepository extends CrudRepository<BlogPost, Long> {

    List<BlogPost> findByAuthorOrderByTitleAscPublishingDateDesc(Author author);
}
