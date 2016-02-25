class Admin::ToolsController <ApplicationController
  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @category_options = Category.all.map{|c| [c.name, c.id]}

    if @tool.save
      current_user.tools << @tool
      flash.notice = "Tool #{@tool.name} successfully created!"
      redirect_to admin_tool_path(@tool.id)
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
    if @tool.update(tool_params)
      redirect_to admin_tool_path(@tool)
    else
      render :edit
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    # if session[:most_recent_tool_id] == @tool.id # need to clear session if tool is deleted right after being created
    #   session[:most_recent_tool_id] = nil
    # else
      redirect_to admin_tools_path
    # end
  end

    private

  def tool_params
    params.require(:tool).permit(:name, :quantity, :price)
  end

end
