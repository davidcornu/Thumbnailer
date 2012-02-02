require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'kgio'

ROOT = Dir.pwd

set :environment, :production

get '/:filename' do

  # Set size base on params
  height  = params[:height] ? params[:height].to_i : 100
  width   = params[:width]  ? params[:width].to_i  : 100

  # Set maximum size
  height = 100 if height > 800
  width  = 100 if width > 800
  
  # Workout file path, stop if there is no file
  file    = [ROOT, 'images', params[:filename]].join("/")
  halt 404 unless FileTest.exists?(file)
  
  # Process the file, return raw result
  io = Kgio::Pipe.popen("GM convert -thumbnail #{width}x#{height}^ -gravity center -extent #{width}x#{height} #{file} jpeg:-")
  image = io.read
  io.close
  
  # Output
  content_type 'image/jpeg'
  return image
  
end