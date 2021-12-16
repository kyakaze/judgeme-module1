GET /blogs => show all blogs => return a templage/page
GET /blogs/:id => show a specific blog => page

[comment]: <> (GET /blogs/new => show a page with form to create new blog => return page)
POST /blogs => create a new blog => can do nothing | redirect to a result page

[comment]: <> (GET /blogs/:id/edit => show a form to edit an existing blog &#40;with id&#41; => page )
UPDATE /blogs/:id => put/patch an existing blog with id => can do nothing | redirect to a result page

DELETE /blogs/:id => delete an existing blog with id => can do nothing | redirect to a result page (GET /blogs)




[comment]: <> (Comments)
GET /blogs/:blog_id/comments => show all comments belong to :blog_id => page
GET /blogs/:blog_id/comments/:comment_id => show all a specific comment belong to :blog_id => page
GET /comments/:comment_id

POST /blogs/:blog_id/comments => create a new comment belongs to a specific blog => can do nothing | redirect to a result page

UPDATE /blogs/:blog_id/comments/:comment_id => Update a specific comment  => can do nothing | redirect to a result page
UPDATE /comments/:comment_id => Update a specific comment  => can do nothing | redirect to a result page

DELETE /blogs/:blog_id/comments/:comment_id => DELETE a specific comment  => can do nothing | redirect to a result page
DELETE /comments/:comment_id => DELETE a specific comment  => can do nothing | redirect to a result page

