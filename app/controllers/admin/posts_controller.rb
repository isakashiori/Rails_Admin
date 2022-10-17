class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: %i[edit update show destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to admin_post_path(@post), success: 'Update successful.'
    else
      flash.now['danger'] = 'Update faild.'
      render :edit
    end
  end

  def show; end

  def destroy
    @post.destroy!
    redirect_to admin_posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.requie(:post).permit(:title, :content)
  end
end
