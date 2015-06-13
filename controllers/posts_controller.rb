class PostsController < ApplicationController
  before_action :count_subject
  before_action :find_subject
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :confirm_loggin
  # GET /posts
  # GET /posts.json
  def index
    @posts = @subject.posts.sorted
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new(:subject_id => @subject.id)
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to subject_posts_path(@subject.id), :subject_id => @subject.id , notice: 'Post was successfully created.' }
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
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to subject_posts_path(@subject.id), notice: 'Post was successfully updated.' }
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
      format.html { redirect_to subject_posts_url(@subject.id), subject_id: @subject.id , notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def find_subject
      if params[:subject_id]
        @subject = Subject.find(params[:subject_id])
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params[:post].permit(:title, :context, :subject_id)
    end
end
