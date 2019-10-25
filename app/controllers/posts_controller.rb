class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    render jsonapi: @posts
  end

  # GET /posts/1
  def show
    render jsonapi: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render jsonapi: @post, status: :created, location: @post
    else
      render jsonapi: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render jsonapi: @post
    else
      render jsonapi: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      ActiveModelSerializers::Deserialization.jsonapi_parse!(
        params,
        only: [:title, :body, :user]
      )
    end
end
