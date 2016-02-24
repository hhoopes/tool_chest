class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
    @user = User.find(params[:user_id])
  end

  def create
    @tool = Tool.new(tool_params)
    @user = User.find(params[:user_id])
    @category_options = Category.all.map{|c| [c.name, c.id]}

    if @tool.save
      @user.tools << @tool
      flash.notice = "Tool #{@tool.name} successfully created!"
      redirect_to user_tool_path(@user, @tool.id)
    else
      flash.alert = "#{@tool.errors.full_messages.join(", ")}"
      render :new

    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    @user = User.find(params[:user_id])

    if @tool.update(tool_params)
      redirect_to user_tool_path(@user, @tool)
    else
      render :edit
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    if session[:most_recent_tool_id] == @tool.id # need to clear session if tool is deleted right after being created
      session[:most_recent_tool_id] = nil
    end
    redirect_to tools_path

  end

  private

  def tool_params
    params.require(:tool).permit(:name, :quantity, :price)
  end
end
