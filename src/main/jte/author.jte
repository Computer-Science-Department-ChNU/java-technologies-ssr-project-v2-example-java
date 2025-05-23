@import java.util.List
@import ua.edu.chnu.kkn.blog_platform.data.post.BlogPost

@param List<BlogPost> myBlogPosts
@param Boolean isAuthenticated
@param Boolean isAdmin

@if(myBlogPosts.isEmpty())
  @template.layout.main(
    isAuthenticated = isAuthenticated,
    isAdmin = isAdmin,
    content = @`
      <!-- Empty state for when there are no resources -->
      <div class="empty-state" id="emptyState">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
          <polyline points="13 2 13 9 20 9"></polyline>
        </svg>
        <h3 class="empty-title">No posts yet</h3>
        <p class="empty-message">Create your first post to get started</p>
      </div>
    `
  )
@else
  <div class="resource-list" id="resourceList">
    @template.layout.main(
    isAuthenticated = isAuthenticated,
    isAdmin = isAdmin,
    content = @`
      <ul>
        @for(BlogPost post : myBlogPosts)
          @template.layout.item_my_post(blogPost = post)
        @endfor
      </ul>
    `
    )
  </div>
@endif

<!-- Floating action button -->
<button class="floating-button" onclick="openModal()">
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
    <line x1="12" y1="5" x2="12" y2="19"></line>
    <line x1="5" y1="12" x2="19" y2="12"></line>
  </svg>
</button>

<!-- Create/Edit Resource Modal -->
<div class="modal" id="resourceModal">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="modalTitle">Create New Resource</h3>
      </div>
      <div class="modal-body">
        <form id="resourceForm" action="/post/create" method="post">
          <input type="hidden" id="resourceId">
          <div class="form-group">
            <label for="title">Title</label>
            <input type="text" id="title" name="title" placeholder="Enter resource title" required>
          </div>
          <div class="form-group">
            <label for="content">Content</label>
            <textarea id="content" name="content" placeholder="Enter resource content" required></textarea>
          </div>
          <div class="modal-footer">
            <button class="modal-close" onclick="closeModal()">Cancel</button>
            <button class="modal-save" onclick="closeModal()" type="submit">Save</button>
          </div>
        </form>
      </div>
    </div>
</div>

<div class="modal" id="editPostModal">
  <div class="modal-content">
    <div class="modal-header">
      <h3 class="modal-title" id="modalTitle">Edit post</h3>
    </div>
    <div class="modal-body">
      <form id="resourceForm" action="/post/edit" method="post">
        <input type="hidden" id="editId" name="id">
        <div class="form-group">
          <label for="editTitle">Title</label>
          <input type="text" id="editTitle" name="title" placeholder="Enter resource title" required>
        </div>
        <div class="form-group">
          <label for="editContent">Content</label>
          <textarea id="editContent" name="content" placeholder="Enter resource content" required></textarea>
        </div>
        <div class="modal-footer">
          <button class="modal-close" onclick="closeModal()">Cancel</button>
          <button class="modal-save" onclick="closeModal()" type="submit">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal confirm-modal" id="confirmModal">
  <div class="modal-content">
    <div class="modal-header">
      <h3 class="modal-title">Delete Resource</h3>
    </div>
    <div class="modal-body">
      <p class="modal-message">Are you sure you want to delete this resource? This action cannot be undone.</p>
    </div>
    <form action="/post/delete" method="post">
      <input type="hidden" id="deleteId" name="id">
      <div class="modal-footer">
        <button class="modal-close confirm-cancel" onclick="closeConfirmModal()">Cancel</button>
        <button class="modal-save confirm-delete" onclick="closeConfirmModal()" type="submit">Delete</button>
      </div>
    </form>
  </div>
</div>

<script>

  // Format date to a more readable format
  function formatDate(dateString) {
    const options = { year: 'numeric', month: 'short', day: 'numeric' };
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', options);
  }

  // Modal functions
  let currentResourceId = null;

  function openModal() {
    const modal = document.getElementById('resourceModal');
    const modalTitle = document.getElementById('modalTitle');
    const form = document.getElementById('resourceForm');

    // Reset form
    form.reset();

    // Create new resource
    document.getElementById('resourceId').value = '';
    modalTitle.textContent = 'Create New Resource';

    modal.classList.add('show');
  }

  function closeModal() {
    const modal = document.getElementById('resourceModal');
    modal.classList.remove('show');
  }

  // Delete functions
  let resourceToDelete = null;

  function deleteResource(resourceId) {
    resourceToDelete = resourceId;
    const confirmModal = document.getElementById('confirmModal');
    document.getElementById('deleteId').value = resourceId;
    confirmModal.classList.add('show');
  }

  function closeConfirmModal() {
    const confirmModal = document.getElementById('confirmModal');
    confirmModal.classList.remove('show');
    resourceToDelete = null;
  }

  function editResource(resourceId, title, content) {
    const modal = document.getElementById('editPostModal');
    const form = document.getElementById('resourceForm');

    // Reset form
    form.reset();
    currentResourceId = resourceId;

    document.getElementById('editId').value = resourceId;
    document.getElementById('editTitle').value = title;
    document.getElementById('editContent').value = content;

    modal.classList.add('show');
  }
</script>
