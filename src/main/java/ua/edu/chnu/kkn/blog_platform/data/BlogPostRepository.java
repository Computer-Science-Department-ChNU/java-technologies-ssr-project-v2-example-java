package ua.edu.chnu.kkn.blog_platform.data;

import org.springframework.data.repository.CrudRepository;

public interface BlogPostRepository extends CrudRepository<BlogPost, Long> {
}
