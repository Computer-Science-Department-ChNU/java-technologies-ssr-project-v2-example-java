@import java.util.List
@import ua.edu.chnu.kkn.blog_platform.data.BlogPost

@param List<BlogPost> blogPosts
@param Boolean isAuthenticated

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Blogs</title>
    <style>
        .top-right-url {
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 5px 10px;
            border-radius: 3px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<h1>Blogs:</h1>
@if(isAuthenticated)
    <a href="logout" class="top-right-url">Logout</a>
@else
    <a href="login" class="top-right-url">Login</a>
@endif
<ul>
    @for(BlogPost post : blogPosts)
        <li>
            <div class="card">
                <h4>${post.getTitle()}</h4>
                <p>${post.getContent()}</p>
                <h5>${post.getAuthor().getName()}</h5>
                <h5>${post.getPublishingDate().toString()}</h5>
            </div>
        </li>
    @endfor
</ul>
</body>
</html>