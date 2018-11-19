//这里添加一个新的用户，传入三个参数，一个是用户名
//一个是用户的邮箱，一个是密码
//返回值为1代表成功添加，返回值为0代表用户名或者邮箱重复
function add_new_user(user_name, user_email, user_password) {
    //这里提交代码
    var url = "extend_users/add_new_user";

    //返回值
    var return_code = 0;

    $.ajax({
        url: url,
        method: "POST",
        async: false,
        data: {
            user_name: user_name,
            user_email: user_email,
            user_password: user_password
        },
        success: function (response) {
            return_code = response.return_code;
        }
    });

    //返回
    return return_code;
}