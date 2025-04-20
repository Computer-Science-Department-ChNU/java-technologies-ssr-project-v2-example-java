@import java.util.List
@import ua.edu.chnu.kkn.blog_platform.data.Author
@import ua.edu.chnu.kkn.blog_platform.data.BlogPost

@param List<Author> authors
@param List<BlogPost> blogPosts

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<h1>Posts with author:</h1>
<ul>
    @for(BlogPost post : blogPosts)
        <li>
            <div class="card">
                <h4>${post.getTitle()}</h4>
                <p>${post.getContent()}</p>
                <h6>${post.getAuthor().getName()}</h6>
            </div>
        </li>
    @endfor
</ul>
</body>
</html>