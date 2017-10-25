require "sinatra"
require "mysql2"

enable :sessions

(Dir['./*/*.rb'].sort).each do |file|
  load file
end
