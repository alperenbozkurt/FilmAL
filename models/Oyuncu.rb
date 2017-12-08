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
  def self.tumu
    sorgu = baglanti.query("SELECT * FROM Oyuncular")
  end
  def self.Ekle(yonetmen_adi,yonetmen_soyadi,yonetmen_dogum_tarihi,yonetmen_aciklama,yonetmen_resim_url)
    sorgu = baglanti.prepare("INSERT INTO `Oyuncular` VALUES (NULL, ?, ?, ?, ?, ?)")
    sonuc = sorgu.execute(yonetmen_adi, yonetmen_soyadi, yonetmen_dogum_tarihi, yonetmen_aciklama, yonetmen_resim_url)
    puts "Oyuncu Eklendi"
  end
end
