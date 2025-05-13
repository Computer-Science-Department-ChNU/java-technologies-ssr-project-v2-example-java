package ua.edu.chnu.kkn.blog_platform.data.post;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "author")
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class Author {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Column(name = "profile_name")
    private String profileName;
}
