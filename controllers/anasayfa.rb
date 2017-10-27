# ANASAYFA ILE ILGILI YONLENDIRMELER
get '/' do
  @sezon = session['user_id'].inspect
  puts @sezon, "Boşluk"
  puts session[:user_id]
  erb :index
end
