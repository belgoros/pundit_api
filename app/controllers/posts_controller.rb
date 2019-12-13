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
    authorize @post
    if @post.save
      render jsonapi: @post, status: :created, location: @post
    else
      render jsonapi: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    authorize @post
    if @post.update_attributes(permitted_attributes(@post))
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

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    ActiveModelSerializers::Deserialization.jsonapi_parse!(
      params,
      only: [:body, :framework, :title, :user]
    )
  end

  def pundit_params_for(_record)
    ActionController::Parameters.new(post_params)
  end
end
