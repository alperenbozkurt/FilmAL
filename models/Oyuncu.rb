class Oyuncu
  attr_accessor :id,:adi,:soyadi,:dogum_tarihi,:aciklama,:resim_url
  def initialize(id,adi,soyadi,dogum_tarihi,aciklama,resim_url)
    @id = id
    @adi = adi
    @soyadi = soyadi
    @dogum_tarihi = dogum_tarihi
    @aciklama = aciklama
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
