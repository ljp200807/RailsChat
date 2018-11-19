require 'net/http'
require 'uri'
require 'json'

class NewrbtController < ApplicationController
  def chat_with_robot

  end

  def store_evaluation
    user_id = params[:user_id].to_i
    user_score = params[:user_score].to_i
    chat_time = params[:chat_time].to_i
    correspond_time = params[:correspond_time].to_i

    puts user_score, chat_time, correspond_time
    sum = 0
    Robot.new(:user_id => user_id, :user_score => user_score, :chat_time => chat_time, :correspond_time => correspond_time).save
    list = Robot.where(user_id = 1)
    for i in 0..list.size - 1
      user_score = list[i].user_score + user_score
    end
    user_score = user_score / list.size
    for i in 0..list.size - 1
      list[i].average_score = user_score
      list[i].chat_time = chat_time
      list[i].correspond_time = correspond_time
      if list[i].save
        sum = sum + 1
      end
    end
    #========上面的内容将存储用户的评价信息============
    # 根据上面取的结果来给浏览器返回值，1代表成功，0代表失败。
    # 没有成功返回
    if sum == list.size
      render json: {return_code: 1}
    else
      render json: {return_code: 0}
    end
  end

  def eva_test
    # 这里获取用户的id
   # user_id = params[:user_id]

    #==============下面读数据库来获取三个字段，并且填充到上面的几个变量中===============
    #@robot = Robot.find_by_user_id(user_id)
    #user_score = @robot.average_score
    #chat_time = @robot.chat_time
    #correspond_time = @robot.correspond_time


    #=============上面读数据库来获取三个字段，并且填充到上面的几个变量中===============

    #render json: {user_score: user_score, chat_time: chat_time, correspond_time: correspond_time}
  end
end
