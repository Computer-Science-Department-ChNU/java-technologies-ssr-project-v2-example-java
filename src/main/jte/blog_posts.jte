@import java.util.List
@import ua.edu.chnu.kkn.blog_platform.data.Author

@param List<Author> authors

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
<h1>Authors with posts:</h1>
<ul>
    @for(Author author : authors)
        <li><h2>${author.getName()}</h2></li>
        <ul>
            !{var posts = author.getBlogPosts();}
            @for(var post: posts)
                <li>
                    <div class="card">
                        <h4>${post.getTitle()}</h4>
                        <p>${post.getContent()}</p>
                    </div>
                </li>
            @endfor
        </ul>
    @endfor
</ul>
</body>
</html>