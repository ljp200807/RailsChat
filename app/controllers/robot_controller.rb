class RobotController < ApplicationController

  #接受一句话，接受和返回的都是一个字符串
  def chat_with_robot
    input_str = params[:input_string]

    output = input_str + "的返回"

    render json: {output_string: output}
  end
end