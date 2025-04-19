package ua.edu.chnu.kkn.blog_platform.data;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Entity
@Table(name = "blog_post")
@Getter
@Setter
@EqualsAndHashCode
public class BlogPost {

    @Id
    @GeneratedValue
    private Long id;

    private String title;

    private String content;

    @Column(name = "publishing_date")
    private LocalDate publishingDate;

    @ManyToOne
    @JoinColumn(name = "author_id")
    private Author author;

    @Override
    public String toString() {
        return "BlogPost {" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", publishingDate=" + publishingDate +
                ", author=" + "Author{"+ "id=" + author.getId() + ", name=" + author.getName() + "}" +
                '}';
    }

}
