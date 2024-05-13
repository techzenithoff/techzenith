class PostsController < ApplicationController
  before_action :authenticate_account!, except: [:show, :blog, :archives]

  before_action :set_post, only: %i[ show edit update destroy ]
  add_breadcrumb "Accueil", :root_path

  layout "admin"
  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  def blog
    @posts = Post.order(id: :desc).paginate(:page => params[:page], :per_page => 6)
    #@ticker_posts = Post.order(id: :desc).take(5)
        #@recent_posts = Post.order(id: :desc).take(3)

        add_breadcrumb "Actualités"

    render layout: "front"
  end

  def archives
    
    post_category = PostCategory.find_by(slug: params["categorie"])
    @posts = Post.where(post_category_id: post_category.id).order(id: :desc).paginate(:page => params[:page], :per_page => 6)
    add_breadcrumb "#{post_category.name}"
    render layout: "front"
  end

  # GET /posts/1 or /posts/1.json
  def show

    @related_posts = Post.where(post_category_id: @post.post_category_id).where.not(id: @post.id).reorder(id: :desc).take(3)
    #@ticker_posts = Post.take(5)
    #@recent_posts = Post.take(3)
    add_breadcrumb @post.title, post_path(@post)

    render layout: "front"
  end

  # GET /posts/new
  def new
    @post_categories = PostCategory.all
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post_categories = PostCategory.all
  end

  # POST /posts or /posts.json
  def create
    @post = current_account.posts.build(post_params)

    respond_to do |format|
      if @post.save
        @posts = Post.all
        format.html { redirect_to edit_post_path(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        @posts = Post.all
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    #@post = Post.find_by(uid: params[:post_id])
    #@post = Post.friendly.find(params[:id])
    @post = Post.friendly.find(params[:post_id])
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      #@post = Post.find_by(uid: params[:id])
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:post_category_id, :title, :content, :thumbnail)
    end
end
