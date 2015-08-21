class GroupsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy] 
    before_action :find_current_user, only: [:edit, :update, :destroy]
    
    def index
        #flash[:notice] = "早安！你好！"
        @groups = Group.all
    end
    
    def show
        @group = Group.find(params[:id])
        @posts = @group.posts
    end
    
    def new
        @group = Group.new
        
    end
    
    def edit
        
    end
    
    def create
        @group = current_user.groups.new(group_params)
        
        if @group.save
            redirect_to groups_path, notice: '新增成功' 
        else
            render :new
        end
    end
    
    def update
        
        if @group.update(group_params)
            redirect_to groups_path, notice: 'updated'
        else
            render :edit
        end
            
    end
    
    def destroy
        
        @group.destroy  
            redirect_to groups_path, alert: 'deleted'
    end
    
end



    
private
    def group_params
        params.require(:group).permit(:title, :description)
    end
    
    def find_current_user
        @group = current_user.groups.find(params[:id])
    end