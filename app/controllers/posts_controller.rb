class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  #check_authorization
  #authorize_resource

  # GET /posts
  # GET /posts.json
  def index
    #@posts = Post.accessible_by(current_ability, :index)
   
    @posts = Post.created_by(current_user) || @posts = Post.with_collaborators

    if current_user.id == 1
      @posts = Post.all
    end

    #@posts = Post.reverse_chronological_order.references(:user)posts = Post.created_by(current_user)
   # case params[:list]
    #when 'me'
     # @posts = @posts.created_by(current_user.id)
      # Alternatively, you can also use
      # @posts = @posts.accessible_by(current_ability, :edit).where("posts.user_id = ?", current_user.id)
      # but that is too long
    #when 'with_friends'
     #@posts = @posts.with_collaborators
    #else
     #@posts = @posts.accessible_by(current_ability, :index)
    #end
      #Check lines 9 & 11 - Only Admin should see posts from all users, unless the users are collaborators
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    authorize! :edit, @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize! :update, @post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :title, :content, :restricted,  :collaborator_emails  )
    end
    #some problem with the :collaborator_emails
end
