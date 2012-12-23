#!/usr/bin/env ruby

require 'yaml'
require 'cinch'
require './lib/config.rb'
require './lib/storage.rb'

Dir["./plugins/*.rb"].each {|file| require file }

$config = Funkbot::Conf.new(YAML.load_file("./config/config.yaml"))

funkbot = Cinch::Bot.new do
  configure do |c|
    c.server           = $config.bot.server
    c.port             = $config.bot.port
    c.password         = $config.bot.password
    c.nick             = $config.bot.nick
    c.channels         = $config.bot.channels
    c.verbose          = $config.bot.verbose
    c.plugins.plugins  = [Greeting,Botsnack,Google,Tell,Factoid,IMDb,Roulette]
    c.plugins.prefix   = ""
  end
end

funkbot.start
