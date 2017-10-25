class Film
  attr_accessor :id,:film_adi,:aciklama,:idmb_puanı,:poster_url,:video_url,:yapim_tarihi
  attr_accessor :id, :kullanici_adi, :adi, :soyadi, :parola, :resim_url
  def initialize(id,film_adi,aciklama,imdb_puani,poster_url,video_url,yapim_tarihi)
    @id = id
    @film_adi = film_adi
    @aciklama = aciklama
    @imdb_puani = imdb_puani
    @poster_url = poster_url
    @video_url = video_url
    @yapim_tarihi = yapim_tarihi
  end
  def self.ara(adi)

  end
  def olustur()

  end
  def sil()

  end
  def guncelle(kullanici_adi, ad, soyad, parola)

  end
end
