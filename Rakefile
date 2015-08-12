namespace :hubot do
  task :start do
    system "heroku ps:scale web=1"
  end

  task :stop do
    system "heroku ps:scale web=0"
  end

  task :deploy do
    system "git push heroku master"
    system "bin/wakeup"
  end

  task :server do
    system "HUBOT_SLACK_TOKEN=#{ENV["HUBOT_SLACK_TOKEN"]} ./bin/hubot --adapter slack"
  end
end