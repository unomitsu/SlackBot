# coding: utf-8
require 'slack-ruby-client'

Slack.configure do |conf|
  # 控えておいたAPI Tokenをセット
  conf.token = ''
end

# RTM Client のインスタンスを生成
client = Slack::RealTime::Client.new

# hello event を受け取ったときの処理
client.on :hello do
  puts 'connected!'
end

# message event を受け取ったときの処理
client.on :message do |data|
  case data['text'] then
    # textが 'にゃーん' だったらそのチャンネルに '^_^'を投稿
    client.message channel: data['channel'], text:'^_^'
  end
end

# Slackに接続
client.start!
