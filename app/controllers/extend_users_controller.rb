class ExtendUsersController < ApplicationController
  # 添加一个新的函数创建新用户的函数
  # 从前端获取用户的姓名、email、
  def add_new_user
    user_name = params[:user_name]
    user_email = params[:user_email]
    user_password = params[:user_password]

    puts user_name, user_email, user_password

    #======下面的代码做用户名和邮箱的唯一性校验========
    # 将是不是唯一的变量存在下面的变脸中，是唯一的就赋1，反之给0
    unique = 1

    #如果校验失败就返回0，就执行下面两句代码
    if(unique == 0)
      render json: {return_code: 0}
      return
    end

    #======上面的代码做用户名和邮箱的唯一性校验========


    puts "来到了这里"
    # 参考seed脚本的代码
    User.create(
        name: user_name,
        email: user_email,
        password: user_password,

        # 下面都是随机
        role: Faker::Number.between(1, 4),
        sex: ['male', 'female'].sample,
        phonenumber: Faker::PhoneNumber.phone_number,
        status: Faker::Company.profession
    )

    render json: {return_code: 1}
  end
end