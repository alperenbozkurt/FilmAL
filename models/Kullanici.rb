class Kullanici
  attr_accessor :id, :kullanici_adi, :adi, :soyadi, :parola, :resim_url
  def initialize(id,kullanici_adi,adi,soyadi,parola,resim_url)
    @id = id
    @kullanici_adi = kullanici_adi
    @adi = adi
    @soyadi = soyadi
    @parola = parola # md5
    @resim_url = resim_url
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
