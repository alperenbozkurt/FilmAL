class Kullanici
  attr_accessor :id, :kullanici_adi, :adi, :soyadi,:parola, :resim_url, :admin_mi
  def initialize(id,kullanici_adi,adi,soyadi,parola,resim_url,admin_mi)
    @id = id
    @kullanici_adi = kullanici_adi
    @adi = adi
    @soyadi = soyadi
    @parola = parola
    @resim_url = resim_url
    @admin_mi = admin_mi
  end
  def self.ara(adi)

  end
  def olustur()
    sorgu = baglanti.prepare("INSERT INTO `Kullanicilar` VALUES (NULL, ?, ?, ?, ?, ?, ?)")
    sonuc = sorgu.execute(@kullanici_adi, @adi, @soyadi, @parola, @resim_url, @admin_mi)
    puts "Veritabanına Eklendi"
  end
  def sil()

  end
  def guncelle(kullanici_adi, ad, soyad, parola)

  end
  def self.id_ile_ara(id)
    sorgu = baglanti.prepare("SELECT * FROM Kullanicilar WHERE idKullanicilar = ?")
    sonuc = sorgu.execute(id)
    id,kadi,adi,soyadi,parola,resim,admin_mi = 0, "","","","",-1
    sonuc.each do |e|
      id = e['idKullanicilar']
      kadi = e['kullanici_adi']
      adi = e['adi']
      soyadi = e['soyadi']
      parola = e['parola']
      resim = e['resim_url']
      admin_mi = e['admin_mi']
    end
    Kullanici.new(id,kadi,adi,soyadi,parola,resim,admin_mi)
  end
  def self.giris(kullanici_adi, parola)
    sorgu = baglanti.prepare("SELECT * FROM Kullanicilar WHERE kullanici_adi = ? and parola = ?")
    sonuc = sorgu.execute(kullanici_adi, parola)
  end
  def adsoyad
    "#{@adi} #{@soyadi}"
  end
end
