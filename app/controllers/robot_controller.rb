require 'net/http'
require 'uri'
require 'json'

class RobotController < ApplicationController

  #接受一句话，接受和返回的都是一个字符串
  def chat_with_robot
    input_str = params[:input_string]

    # 这里提交post请求
    url = URI('http://openapi.tuling123.com/openapi/api/v2')

    # 这里设计请求内容
    data = {
        "reqType": 0,
        "perception": {
            "inputText": {
                "text": input_str,
            },
        },
        "userInfo": {
            "apiKey": "7992efa1d9d34cb69a201e7ab181f5b9",
            "userId": "345468"
        }
    }.to_json

    req = Net::HTTP::Post.new(url, 'Content-Type' => 'application/json')
    req.body = data

    res = Net::HTTP.new(url.host, url.port).start {|http| http.request(req)}

    puts JSON.parse(res.body)
    result = JSON.parse(res.body)["results"][0]["values"]["text"]

    render json: {output_string: result}
  end
end