-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Anamakine: localhost
-- Üretim Zamanı: 08 Ara 2017, 12:43:17
-- Sunucu sürümü: 5.7.11-0ubuntu6
-- PHP Sürümü: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `FilmAY`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Filmler`
--

CREATE TABLE `Filmler` (
  `idFilmler` int(11) NOT NULL,
  `film_adi` varchar(100) DEFAULT NULL,
  `aciklama` text,
  `imdb_puani` float DEFAULT NULL,
  `poster_url` varchar(200) DEFAULT NULL,
  `fragman_url` text NOT NULL,
  `video_url` varchar(200) DEFAULT NULL,
  `yapim_tarihi` datetime DEFAULT NULL,
  `fiyat` int(3) NOT NULL,
  `Yonetmen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Kullanicilar`
--

CREATE TABLE `Kullanicilar` (
  `idKullanicilar` int(11) NOT NULL,
  `kullanici_adi` varchar(45) DEFAULT NULL,
  `adi` varchar(45) DEFAULT NULL,
  `soyadi` varchar(45) DEFAULT NULL,
  `parola` varchar(45) DEFAULT NULL,
  `resim_url` varchar(200) DEFAULT NULL,
  `admin_mi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Oyuncular`
--

CREATE TABLE `Oyuncular` (
  `idOyuncular` int(11) NOT NULL,
  `oyuncu_adi` varchar(45) DEFAULT NULL,
  `oyuncu_soyadi` varchar(45) DEFAULT NULL,
  `oyuncu_dogum_tarihi` date DEFAULT NULL,
  `oyuncu_aciklama` text,
  `oyuncu_resim_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Oyuncular_has_Filmler`
--

CREATE TABLE `Oyuncular_has_Filmler` (
  `id` int(11) NOT NULL,
  `Oyuncular_idOyuncular` int(11) NOT NULL,
  `Film_idFilmler` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Satin_almalar`
--

CREATE TABLE `Satin_almalar` (
  `idSatinAlmalar` int(11) NOT NULL,
  `Kullanicilar_id` int(11) NOT NULL,
  `Filmler_id` int(11) NOT NULL,
  `satin_alma_tarihi` datetime DEFAULT NULL,
  `odenen_tutar` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `Satin_almalar`
--

INSERT INTO `Satin_almalar` (`idSatinAlmalar`, `Kullanicilar_id`, `Filmler_id`, `satin_alma_tarihi`, `odenen_tutar`) VALUES
(26, 2, 6, '2017-12-07 00:00:00', 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Yonetmenler`
--

CREATE TABLE `Yonetmenler` (
  `idYonetmenler` int(11) NOT NULL,
  `yonetmen_adi` varchar(100) DEFAULT NULL,
  `yonetmen_dogum_tarihi` varchar(45) DEFAULT NULL,
  `yonetmen_aciklama` text,
  `yonetmen_resim_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `Filmler`
--
ALTER TABLE `Filmler`
  ADD PRIMARY KEY (`idFilmler`),
  ADD KEY `fk_Filmler_Yonetmenler1_idx` (`Yonetmen_id`);

--
-- Tablo için indeksler `Kullanicilar`
--
ALTER TABLE `Kullanicilar`
  ADD PRIMARY KEY (`idKullanicilar`);

--
-- Tablo için indeksler `Oyuncular`
--
ALTER TABLE `Oyuncular`
  ADD PRIMARY KEY (`idOyuncular`);

--
-- Tablo için indeksler `Oyuncular_has_Filmler`
--
ALTER TABLE `Oyuncular_has_Filmler`
  ADD PRIMARY KEY (`id`,`Oyuncular_idOyuncular`,`Film_idFilmler`),
  ADD KEY `fk_Oyuncular_has_Filmler_Filmler1_idx` (`Film_idFilmler`),
  ADD KEY `fk_Oyuncular_has_Filmler_Oyuncular1_idx` (`Oyuncular_idOyuncular`);

--
-- Tablo için indeksler `Satin_almalar`
--
ALTER TABLE `Satin_almalar`
  ADD PRIMARY KEY (`idSatinAlmalar`),
  ADD KEY `fk_SatinAlmalar_Kullanicilar_idx` (`Kullanicilar_id`),
  ADD KEY `fk_SatinAlmalar_Filmler1_idx` (`Filmler_id`);

--
-- Tablo için indeksler `Yonetmenler`
--
ALTER TABLE `Yonetmenler`
  ADD PRIMARY KEY (`idYonetmenler`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `Filmler`
--
ALTER TABLE `Filmler`
  MODIFY `idFilmler` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Tablo için AUTO_INCREMENT değeri `Kullanicilar`
--
ALTER TABLE `Kullanicilar`
  MODIFY `idKullanicilar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- Tablo için AUTO_INCREMENT değeri `Oyuncular`
--
ALTER TABLE `Oyuncular`
  MODIFY `idOyuncular` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Tablo için AUTO_INCREMENT değeri `Oyuncular_has_Filmler`
--
ALTER TABLE `Oyuncular_has_Filmler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Tablo için AUTO_INCREMENT değeri `Satin_almalar`
--
ALTER TABLE `Satin_almalar`
  MODIFY `idSatinAlmalar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- Tablo için AUTO_INCREMENT değeri `Yonetmenler`
--
ALTER TABLE `Yonetmenler`
  MODIFY `idYonetmenler` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `Filmler`
--
ALTER TABLE `Filmler`
  ADD CONSTRAINT `fk_Filmler_Yonetmenler1` FOREIGN KEY (`Yonetmen_id`) REFERENCES `Yonetmenler` (`idYonetmenler`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `Oyuncular_has_Filmler`
--
ALTER TABLE `Oyuncular_has_Filmler`
  ADD CONSTRAINT `fk_Oyuncular_has_Filmler_Filmler1` FOREIGN KEY (`Film_idFilmler`) REFERENCES `Filmler` (`idFilmler`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Oyuncular_has_Filmler_Oyuncular1` FOREIGN KEY (`Oyuncular_idOyuncular`) REFERENCES `Oyuncular` (`idOyuncular`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `Satin_almalar`
--
ALTER TABLE `Satin_almalar`
  ADD CONSTRAINT `fk_SatinAlmalar_Filmler1` FOREIGN KEY (`Filmler_id`) REFERENCES `Filmler` (`idFilmler`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SatinAlmalar_Kullanicilar` FOREIGN KEY (`Kullanicilar_id`) REFERENCES `Kullanicilar` (`idKullanicilar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
