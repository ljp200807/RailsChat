//这里定义一个函数，解决机器人聊天的问题
function chat_with_robot(input_string) {
    // alert("点击了");
    var url = "robot/chat_with_robot";

    var return_str = "error_happened";

    $.ajax({
        url : url,
        method : "get",
        async: false,
        data : {
            input_string : input_string,
        },
        success : function (response) {
            return_str = response.output_string;
        }
    });

    return return_str;
}