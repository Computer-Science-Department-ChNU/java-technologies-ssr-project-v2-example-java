@import ua.edu.chnu.kkn.blog_platform.data.post.BlogPost
@param BlogPost blogPost

<section class="content-card">
    <h2 class="card-title">${blogPost.getTitle()}</h2>
    <p class="card-text">${blogPost.getContent()}</p>
    <h4 class="card-text">${blogPost.getAuthor().getName()}</h4>
    <h4 class="card-text">${blogPost.getPublishingDate().toString()}</h4>
</section>
