class CommentsController < ApplicationController
  # GET /photos/:photo_id/comments
  # GET /photos/:photo_id/comments.json
  def index
    #1st you retrieve the photo thanks to params[:photo_id]
    photo = Photo.find(params[:photo_id])
    #2nd you get all the comments of this photo
    @comments = photo.comments

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @comments }
    end
  end

  # GET /photos/:photo_id/comments/:id
  # GET /comments/:id.json
  def show
    #1st you retrieve the photo thanks to params[:photo_id]
    photo = Photo.find(params[:photo_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = photo.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @comment }
    end
  end

  # GET /photos/:photo_id/comments/new
  # GET /photos/:photo_id/comments/new.json
  def new
    #1st you retrieve the photo thanks to params[:photo_id]
    photo = Photo.find(params[:photo_id])
    #2nd you build a new one
    @comment = photo.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @comment }
    end
  end

  # GET /photos/:photo_id/comments/:id/edit
  def edit
    #1st you retrieve the photo thanks to params[:photo_id]
    photo = Photo.find(params[:photo_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = photo.comments.find(params[:id])
  end

  # POST /photos/:photo_id/comments
  # POST /photos/:photo_id/comments.json
  def create
    #1st you retrieve the photo thanks to params[:photo_id]
    photo = Photo.find(params[:photo_id])
    #2nd you create the comment with arguments in params[:comment]
    @comment = photo.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@comment.photo, @comment], :notice => 'Comment was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource comment
        format.json  { render :json => @comment, :status => :created, :location => [@comment.photo, @comment] }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photos/:photo_id/comments/:id
  # PUT /photos/:photo_id/comments/:id.json
  def update
    #1st you retrieve the photo thanks to params[:photo_id]
    photo = Photo.find(params[:photo_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = photo.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(comment_params)
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@comment.photo, @comment], :notice => 'Comment was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/:photo_id/comments/1
  # DELETE /photos/:photo_id/comments/1.json
  def destroy
    #1st you retrieve the photo thanks to params[:photo_id]
    photo = Photo.find(params[:photo_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = photo.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      #1st argument reference the path /photos/:photo_id/comments/
      format.html { redirect_to(photo_comments_url) }
      format.json  { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:commenter, :body, :photo_id)
    end
end