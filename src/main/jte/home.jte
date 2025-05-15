@import java.util.List
@import ua.edu.chnu.kkn.blog_platform.data.post.BlogPost

@param Boolean isAuthenticated
@param Boolean isAdmin
@param List<BlogPost> blogPosts

@template.layout.main(
    isAuthenticated = isAuthenticated,
    isAdmin = isAdmin,
    content = @`
        <ul>
            @for(BlogPost post : blogPosts)
                @template.layout.item_post(blogPost = post)
            @endfor
        </ul>
    `
)
