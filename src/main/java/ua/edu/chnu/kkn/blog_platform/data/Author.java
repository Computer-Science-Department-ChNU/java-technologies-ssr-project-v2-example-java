package ua.edu.chnu.kkn.blog_platform.data;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "author")
@Getter
@Setter
@EqualsAndHashCode
public class Author {

    @Id
    @GeneratedValue
    private Long id;

    private String name;

    @Column(name = "profile_name")
    private String profileName;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "author")
    private List<BlogPost> blogPosts;

    @Override
    public String toString() {
        var articlesBuilder = new StringBuilder();
        articlesBuilder.append("[");
        for (BlogPost article : blogPosts) {
            articlesBuilder.append("Article{")
                    .append("id=").append(article.getId())
                    .append(", ")
                    .append("title=").append(article.getTitle())
                    .append(", ")
                    .append("content=").append(article.getContent())
                    .append(", ")
                    .append("publishingDate=").append(article.getPublishingDate())
                    .append("}")
                    .append(",");
        }
        articlesBuilder.deleteCharAt(articlesBuilder.length() - 1);
        articlesBuilder.append("]");
        return "Author{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", articles=" + articlesBuilder +
                '}';
    }
}
