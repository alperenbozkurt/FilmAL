class Yonetmen
  attr_accessor :id, :adi, :soyadi, :dogum_tarihi, :aciklama, :resim_url
  def initialize(id,adi,soyadi,dogum_tarihi,aciklama,resim_url)
    @id = id
    @adi = adi
    @soyadi = soyadi
    @dogum_tarihi = dogum_tarihi
    @aciklama = aciklama
    @resim_url = resim_url
  end
  def self.tumu()
    sorgu = baglanti.query("SELECT * FROM Yonetmenler")
  end
  def self.Ekle(yonetmen_adi,yonetmen_dogum_tarihi,yonetmen_aciklama,yonetmen_resim_url)
    sorgu = baglanti.prepare("INSERT INTO `Yonetmenler` VALUES (NULL, ?, ?, ?, ?)")
    sonuc = sorgu.execute(yonetmen_adi, yonetmen_dogum_tarihi, yonetmen_aciklama, yonetmen_resim_url)
    puts "Yönetmen Eklendi"
  end
  def self.adini_getir(yonetmen_id)
    sorgu = baglanti.prepare("select * from `Yonetmenler` where idYonetmenler = ?")
    sonuc = sorgu.execute(yonetmen_id)
    sonuc.first["yonetmen_adi"]
  end
end
