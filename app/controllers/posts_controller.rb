class PostsController < ApplicationController
    before_action :find_group
    before_action :authenticate_user!
    before_action :find_current_user, only: [:edit, :update, :destroy]

    def new
        @post = @group.posts.new
    end

    def edit
    end
    
    def create
        @post = @group.posts.build(post_params)
        @post.author = current_user
        
        if @post.save
            redirect_to group_path(@group), notice: '新增成功'
        else
            render :new
        end
    end

    def update
        
        if @post.update(post_params)
            redirect_to group_path(@group), notice: '修改成功'
        else
            render :edit
        end
    end

    def destroy
        
        @post.destroy
        redirect_to group_path(@group), alert: '文章已刪除'
    end

end



private

def post_params
    params.require(:post).permit(:content)
end

def find_group
    @group = Group.find(params[:group_id])
end

def find_current_user
    @post = current_user.posts.find(params[:id])
end