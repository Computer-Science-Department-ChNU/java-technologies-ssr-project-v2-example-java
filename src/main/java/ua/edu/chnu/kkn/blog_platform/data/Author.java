package ua.edu.chnu.kkn.blog_platform.data;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "author")
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class Author {

    @Id
    @GeneratedValue
    private Long id;

    private String name;

    @Column(name = "profile_name")
    private String profileName;
}
