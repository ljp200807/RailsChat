//这里定义一个函数，解决机器人聊天的问题
function chat_with_robot(input_string) {
    // alert("点击了");
    var url = "/robot/chat_with_robot";

    var return_str = "error_happened";

    $.ajax({
        url: url,
        method: "get",
        async: false,
        data: {
            input_string: input_string,
        },
        success: function (response) {
            return_str = response.output_string;
        }
    });

    return return_str;
}

//这里设计三个函数，分别传入用户对于系统的评分、会话时长与此次聊天的平均相应时间
function send_chat_quality(user_id, user_score, chat_time, correspond_time) {
    // alert("点击了");
    var url = "/robot/store_evaluation";

    //1代表成功传输了内容
    var result = 1;

    $.ajax({
        url: url,
        method: "POST",
        async: false,
        data: {
            user_id: user_id,
            user_score: user_score,
            chat_time: chat_time,
            correspond_time: correspond_time
        },

        success: function (response) {
            result = response.return_code;
        }
    });

    //如果没有任何问题就返回1
    return result;
}

//这里获取用户平均分数，平均交流时间，平均响应时间构成的对象，使用点操作符调用
/*
调用举例：
var result_map = get_chat_quality();
alert(result_map.user_score);
alert(result_map.chat_time);
alert(result_map.correspond_time);
 */
function get_chat_quality(user_id) {
    // alert("点击了");
    //这里是返回的对象
    var result_map = null;

    var url = "/robot/get_evaluation";

    $.ajax({
        url: url,
        method: "GET",
        async: false,

        data: {
            user_id: user_id,
        },

        success: function (response) {
            result_map = response;
        }
    });

    //返回结果
    return result_map;
}