package ua.edu.chnu.kkn.blog_platform.data;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;

@Entity
@Table(name = "blog_post")
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class BlogPost {

    @Id
    @GeneratedValue
    private Long id;

    private String title;

    private String content;

    @Column(name = "publishing_date")
    private LocalDate publishingDate;
}
