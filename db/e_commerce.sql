-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 14, 2021 alle 19:16
-- Versione del server: 10.4.20-MariaDB
-- Versione PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce`
--
CREATE DATABASE IF NOT EXISTS `e_commerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `e_commerce`;

-- --------------------------------------------------------

--
-- Struttura della tabella `anagrafica_clienti`
--

CREATE TABLE `anagrafica_clienti` (
  `id_anagrafica_clienti` int(11) NOT NULL,
  `nominativo` varchar(50) DEFAULT NULL,
  `indirizzo` varchar(100) DEFAULT NULL,
  `localita` varchar(50) DEFAULT NULL,
  `cap` varchar(5) DEFAULT NULL,
  `provincia` varchar(2) DEFAULT NULL,
  `codice_fiscale` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `username_cliente` varchar(20) DEFAULT NULL,
  `password_cliente` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `anagrafica_clienti`
--

INSERT INTO `anagrafica_clienti` (`id_anagrafica_clienti`, `nominativo`, `indirizzo`, `localita`, `cap`, `provincia`, `codice_fiscale`, `email`, `username_cliente`, `password_cliente`) VALUES
(1, 'Luca Marolla', 'Via Fieramosca,12', 'Bisceglie', '76011', 'BT', 'TBGFQL48E70B173X', 'luca.m@libero.it', 'LucaMarollas10', 'ABBA12'),
(2, 'Simone Campochiaro', 'Via Millico,56', 'Terlizzi', '70038', 'BA', 'NBGTNZ80R31F373A', 'sim.camp96@hotmail.it', 'sim.96.camp', 'terlizzi'),
(3, 'Christian Iacovelli', 'Via Metastasio, 18', 'Bari', '70121', 'BA', 'CVLCRS02C21A662Q', 'iacovelli210302@gmail.com', 'Chri_Iacov1234', 'bari56'),
(4, 'Umberto Tangari', 'Contrada Pozzo Lungo, 23', 'Terlizzi', '70038', 'BA', 'MRJSQP51A05E314O', 'umb.terl@libero.com', 'umb94T', 'aria12'),
(5, 'Nicola Narducci', 'Via Picasso, 110', 'Foggia', '7110', 'FG', 'CYGRDD99S14B557D', 'nardinoNic@libero.com', 'Nico_ultras', 'foggia1');

-- --------------------------------------------------------

--
-- Struttura della tabella `anagrafica_fornitori`
--

CREATE TABLE `anagrafica_fornitori` (
  `id_anagrafica_fornitori` int(11) NOT NULL,
  `nominativo` varchar(50) DEFAULT NULL,
  `indirizzo` varchar(100) DEFAULT NULL,
  `localita` varchar(50) DEFAULT NULL,
  `cap` varchar(5) DEFAULT NULL,
  `provincia` varchar(2) DEFAULT NULL,
  `partita_iva` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `sito_web` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `anagrafica_fornitori`
--

INSERT INTO `anagrafica_fornitori` (`id_anagrafica_fornitori`, `nominativo`, `indirizzo`, `localita`, `cap`, `provincia`, `partita_iva`, `email`, `sito_web`) VALUES
(1, 'Cellulopoli Sas', 'Via duca degli Abruzzi, 98', 'Molfetta', '70056', 'BA', '1201CYGRDD99S14B557D', 'cullulopolisas@gmail.com', 'www.cellulopolisas.it'),
(2, 'Hardware per Tutti SRL', 'Via Canonico, 12', 'Ruvo di Puglia', '70039', 'BA', '90ASGRDD99S14B334D', 'hdpertutti@live.it', 'www.hdpertutti.it');

-- --------------------------------------------------------

--
-- Struttura della tabella `assemblati`
--

CREATE TABLE `assemblati` (
  `id_assemblato` int(11) NOT NULL,
  `nome_assemblato` varchar(50) DEFAULT NULL,
  `descrizione` varchar(100) NOT NULL,
  `prezzo_di_vendita` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `assemblati`
--

INSERT INTO `assemblati` (`id_assemblato`, `nome_assemblato`, `descrizione`, `prezzo_di_vendita`) VALUES
(5, 'Lol Pc Elite Gaming', 'Descrizione pc', 1600),
(6, 'Dragon Metal', '', 5000);

-- --------------------------------------------------------

--
-- Struttura della tabella `carrello`
--

CREATE TABLE `carrello` (
  `id_carrello` int(11) NOT NULL,
  `data_carrello` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `ordinepercliente`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `ordinepercliente` (
`componente` varchar(50)
,`prezzo_di_vendita` double
);

-- --------------------------------------------------------

--
-- Struttura della tabella `ordini`
--

CREATE TABLE `ordini` (
  `id_ordine` int(11) NOT NULL,
  `id_carrello1` int(11) DEFAULT NULL,
  `id_anagrafica_cliente` int(11) DEFAULT NULL,
  `importo` double DEFAULT NULL,
  `data_consegna` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

CREATE TABLE `prodotti` (
  `id_prodotto` int(11) NOT NULL,
  `componente` varchar(50) DEFAULT NULL,
  `immagine` text DEFAULT NULL,
  `descrizione` varchar(1000) DEFAULT NULL,
  `codice_ian13` varchar(12) DEFAULT NULL,
  `quantita` int(11) NOT NULL,
  `disponibilita` tinyint(1) NOT NULL,
  `prezzo_di_acquisto` double DEFAULT NULL,
  `prezzo_di_vendita` double DEFAULT NULL,
  `id_anagrafica_fornitore` int(11) DEFAULT NULL,
  `id_assemblato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `prodotti`
--

INSERT INTO `prodotti` (`id_prodotto`, `componente`, `immagine`, `descrizione`, `codice_ian13`, `quantita`, `disponibilita`, `prezzo_di_acquisto`, `prezzo_di_vendita`, `id_anagrafica_fornitore`, `id_assemblato`) VALUES
(1, 'AMD Ryzen™ 7 5700G Processore', 'https://m.media-amazon.com/images/I/71-udC1UaXL._AC_SX450_.jpg', 'AMD Ryzen™ 7 5700G Processor\nGraphics Model: Integrated Radeon Graphics\n# of CPU Cores: 8\n# of Threads: 16\nMax Boost Clock: Up to 4.6GHz\nBase Clock: 3.8GHz\nThermal Solution: Wraith Stealth\nDefault TDP / TDP: 65W', '653352', 5, 1, 322.49, 379.49, NULL, NULL),
(2, 'RAM Samsung', 'https://m.media-amazon.com/images/I/71JOuGEq0xL._AC_SS450_.jpg', 'BL2K8G32C16U4B 3200 MHz, DDR4, DRAM, Memoria Gaming Kit per Computer Fissi, 16GB (8GB x2), CL16, Nero', '2857442', 3, 1, 70, 85, 1, NULL),
(3, 'Scheda Grafica GeForce RTX™ 3090 24GB', 'https://m.media-amazon.com/images/I/6145nLEpY-L._AC_SY450_.jpg', '24GB GDDR6X / Velocità di Memoria 19,5 Gbps / Interfaccia 384 bit / Bandwith di 936 Gbps\nMultiprocessori di streaming NVIDIA Ampere: la nuovissima architettura Ampere SM raddoppia la produttività in FP32 e migliora l\'efficienza energetica\nRT Core di 2nda generazione: scopri il doppio della produttività rispetto agli RT Core di prima generazione, oltre a ray-tracing e shading simultanei per un livello completamente nuovo in termini di prestazioni\nTensor Core di 3za generazione: ottieni fino al doppio della produttività con densità strutturale e algoritmi IA avanzati come DLSS, ora con il supporto di risoluzioni fino a 8K\nDisplayPort 1.4 (x3), HDMI 2.1', '2678126', 1, 1, 1600, 3200, 2, NULL),
(4, 'Lol Pc Elite Gaming', 'https://m.media-amazon.com/images/I/51jPaXP+YML._AC_.jpg', '-AMD Ryzen™ 7 5700G Processore\r\n-RAM Samsung (x2)\r\n-8 GB 2Rx8 PC3L-12800S RAM\r\n-Cooler Master MasterCase H500P Mesh\r\n-Asus prime x570-p\r\n-SanDisk Ultra 3d SSD 4TB\r\n-MSI V375-035R scheda video GeForce RTX 2060 Ventus\r\n-MARS GAMING MPII650,ALIMENTATORE PC 650W', '12345678', 9, 1, 1600, 600, NULL, 5),
(6, 'Dragon Metal ', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQseSNcoG3OL6X41ZNc3fI-g47qH-JZgNknWA&usqp=CAU', '-AMD Ryzen™ 7 5700G Processore\r\n-Scheda Grafica GeForce RTX™ 3090 24GB\r\n-Cooler Master MasterBox 5 MSI Gaming Edition Case\r\n-SanDisk Ultra 3d SSD 4TB\r\n-Aorus b450 pro wifi\r\n-MSI MPG A850GF 850WATT\r\n-Memoria Kingston FURY Beast  16 GB DDR4 RGB  (x2)', '856754123', 1, 1, 3800, 5000, 2, 6),
(7, 'Cooler Master MasterBox TD500', 'https://m.media-amazon.com/images/I/81PSVjYuWNL._AC_SX466_.jpg', 'Cooler Master MasterBox TD500 Mesh White - Case PC ARGB in Bianco con Rete Mesh Poligonale, 3 x 120mm Ventole Preinstallate, Panello Laterale Vetro, Configurazioni Flessibili Air Flow -Colore Bianco', '42364628', 2, 1, 42, 64, 2, NULL),
(8, 'Cooler Master MasterCase H500P Mesh', 'https://m.media-amazon.com/images/I/91vIa7kin+L._AC_SX466_.jpg', 'Cooler Master MasterCase H500P Mesh – Case PC RGB con Due Ventole da 200 mm Ottimo Flusso d\'Aria, Pannelli Fatti per Costruttori, Predisposto per Dissipazione a Liquido', '1456323', 1, 1, 230, 301, 2, NULL),
(9, 'Msi Mpg Gungnir 100D', 'https://m.media-amazon.com/images/I/51ULDo2VDNL._AC_SX450_.jpg', 'Msi Mpg Gungnir 100D Case Atx/Eatx, Logo Msi Serigrafato, Ventola Inclusa, Radiatori Fino a 420Mm, Vetro Temperato 4Mm, Airflow Ottimizzato, 2X USB 3.0 + HD Audio / Mic, Nero', '146642', 2, 1, 50, 99, 2, NULL),
(10, 'Cooler Master MasterBox 5 MSI Gaming Edition Case', 'https://m.media-amazon.com/images/I/7114UeFqfwL._AC_SL1500_.jpg', 'Cooler Master MasterBox 5 MSI Gaming Edition Case per PC \'ATX, microATX, Mini-ITX, USB 3.0, con Finestra Laterale\' MCX-B5S2-KWNN-03-MI', '083422', 4, 1, 70, 120, 1, NULL),
(11, 'msi b450 gaming plus', 'https://m.media-amazon.com/images/I/71LwU6qgv2L._AC_SL1200_.jpg', 'Supporta AMD® Ryzen™ di 1° e 2° Generazione/ Ryzen™ con processore grafico Radeon™ Vega e AMD® A-series / Athlon™ per Socket AM4\r\nSupporta Memorie DDR4-3466+(OC)\r\nEsperienza Gaming ultra veloce: TURBO M.2, StoreMI, AMD Turbo USB 3.1 GEN2\r\nAudio Boost con Nahimic: Premia le tue orecchie con la miiglior qualità audio possibile\r\nCore Boost: Layout premium e design di potenza digitale con supporto a più core\r\nDDR4 Boost: Aumenta le prestazioni delle memorie DDR4 con A-XMP\r\nMULTI-GPU: Con slot STEEL ARMOR PCI-E. Supporta 2-Way AMD Crossfire™\r\nVR Ready: Ottimizzazione automatica del sistema per l\'utilizzo VR spingendo le prestazioni al massimo.\r\nArmi In-Game: Game Boost, GAMING Hotkey, X-Boost\r\nGAMING CERTIFIED: 24 ore di test effettuati dai giocatori di eSport', '2144515', 5, 1, 230, 320, NULL, NULL),
(12, 'Asus prime x570-p', 'https://m.media-amazon.com/images/I/810cnNBBCYL._AC_SL1500_.jpg', 'ASUS Prime X570-P Scheda Madre, ATX AMD AM4 Ryzen 3000, 12 fasi di alimentazione DrMOS PCIe 4.0 M.2 DDR4 Intel LAN HDMI DP SLI CFX SATA, USB 3.2 Gen 2 Type-A Type-C Aura Sync RGB', '7853738', 5, 1, 100, 179, NULL, NULL),
(13, 'Aorus b450 pro wifi', 'https://m.media-amazon.com/images/I/61WvRrHHQSL._AC_SL1000_.jpg', 'Dotato di processori AMD Ryzen AM4, MSI B450 GAMING PRO CARBON MAX WIFII Ispirato alle linee accattivanti delle auto da corsa, offre infinite personalizzazioni con Mystic Light RGB, ottimizzato per prestazioni migliori da Core boost, DDR4 Boost, due slot M.2 con un M.2 Shield.\r\n\r\nGaming heatsinks con scheda Carbon per raffreddamento e performance incredibili\r\nDDR4 Boost Tracce ottimizzate e circuiti di memoria isolati\r\nPCI-E Steel Armor Proteggi la VGA contro la flessione\r\nAudio Boost 4 con amplificatore Audio gaming ottimizzato grazie a Nahimic 3\r\nM.2 Shield Performance termiche migliorate per dispositivi M.2', '833452', 11, 1, 89, 139, NULL, NULL),
(14, 'Aorus x299x xtreme waterforce', 'https://media.ldlc.com/r1600/ld/products/00/05/52/37/LD0005523747_2.jpg', 'Compatibilità processori Intel Core serie X\r\nDDR4 4333 MHz (OC) Quadro canale Non-ECC senza buffer, 8 DIMM\r\nUSB 3.1 Gen 2 sul pannello frontale\r\n3 PCI-Express 3.0 16x (16x/16x/16x) (a seconda del processore)\r\n2 slot M.2 PCIe 3.0 x4\r\nController 10 Gigabit Ethernet\r\nRGB Fusion 2.0 con 2 controller LED indirizzabili', '99999', 3, 1, 750, 1200.5, NULL, NULL),
(15, 'SanDisk Ultra 3d SSD 4TB', 'https://shop.westerndigital.com/content/dam/store/en-us/assets/products/internal-storage/ultra-3d-sata-iii-ssd/gallery/ultra-3d-sata-iii-ssd-right.png.wdthumb.1280.1280.webp', 'Accelerate il vostro PC per un avvio più rapido e un’esecuzione di giochi e grafica a velocità straordinare, quando passate alla SSD Ultra® 3D SanDisk. Noterete che le applicazioni vengono caricate più velocemente e i file si muovono più rapidamente, oltre ad avere una durata della batteria più lunga, una generazione di calore molto minore e un’elaborazione più silenziosa2. Non importa che uso fate del computer, le potenti tecnologie 3D NAND e nCache 2.0 di SanDisk vi permettono un’esperienza migliorata, con elevata resistenza e alta velocità sia che stiate mitragliando il nemico, modificando un video o solo navigando su internet. La comprovata resistenza a urti e vibrazioni protegge dalla perdita di dati, anche nel caso di caduta accidentale del computer. Se siete pronti per un’esperienza migliore di elaborazione la SSD Ultra® 3D SanDisk eleva le vostre prestazioni a nuovi livelli.', '257453', 33, 1, 50, 74, NULL, NULL),
(16, 'Sabrent Rocket Q NVMe PCIe M.2 2280 SSD 500GB', 'https://www.picclickimg.com/d/l400/pict/234013897708_/Sabrent-Rocket-NVMe-PCIe-M2-2280-512GB.jpg', 'Sabrent SSD Interno PCIe NVMe M.2 2280 500GB Rocket Q, Unità di Memoria a Stato Solido ad Alte Prestazioni disco a stato solido R/W 2000/1000MB/s (SB-RKTQ-500)', '123789', 4, 1, 34, 64, NULL, NULL),
(17, 'Corsair Force MP600 SSD M2 NVMe PCI-E x4 1TB', 'https://media.pangoly.com/img/1/2/1/b/121b8e7d-8a0e-4a8b-b588-b5b949581051.jpg', 'Grazie alla tecnologia PCIe Gen4 che consente di raggiungere velocità straordinarie di lettura sequenziale fino a 4.950 MB/s, l’unità SSD CORSAIR Force MP600 Gen4 PCIe x4 NVMe M.2 offre prestazioni di storage estreme.', '752652', 34, 1, 140, 199, NULL, NULL),
(18, ' Samsung v-NAND SSD 970 EVO plus 250gb', 'https://images.samsung.com/is/image/samsung/it-970-evoplus-nvme-m2-ssd-mz-v7s250bw-frontblack-140953596?$684_547_PNG$', 'Samsung Memorie MZ-V7S250 970 EVO Plus SSD Interno da 250 Gb, PCIe NVMe M.2', '009525', 7, 1, 30, 62, NULL, NULL),
(19, 'MSI V375-035R scheda video GeForce RTX 2060 Ventus', 'https://www.tomshw.it/images/images/2019/10/msi-rtx-2060-ventus-xs-oc-6gb-54019.768x432.jpg', 'MSI V375-035R scheda video GeForce RTX 2060 Ventus XS OC\r\nUn design a doppia ventola, VENTUS mostra con orgoglio le sue forme industriali in colori neutri per adattarsi a qualsiasi build. Utilizzando due dei pluripremiate ventole TORX 2.0, le schede grafiche MSI VENTUS offrono anni di prestazioni di raffreddamento di alto livello. Con tubi di calore in rame fino a 6 mm di spessore sul fondo massimizzano il trasferimento di calore.', '142141', 11, 1, 300, 700, NULL, NULL),
(20, 'ASUS TUF Gaming GeForce GTX 1650 ', 'https://www.drexinformatica.it/1901-large_default/asus-scheda-grafica-nvidia-geforce-gtx1650-o4g-lp-brk-4-gb-.jpg', 'ASUS TUF Gaming GeForce GTX 1650 OC Edition 4 GB GDDR6, Scheda Video Gaming, Dissipatore Biventola per Gaming HD, Tecnologia AutoExtreme e chip Turing', '154624', 6, 1, 150, 320, NULL, NULL),
(21, 'Msi GeForce GT710 ', 'https://m.media-amazon.com/images/I/61GDvJmGF5L._AC_SS450_.jpg', 'Msi GeForce GT710 2GD3H LP Scheda Grafica, 2 GB GDDR3, PCI Express 2.0, HDMI + DL-DVI-D, Nero', '763521', 20, 1, 22, 64, NULL, NULL),
(22, 'GeForce GT 710 2GB', ' https://media.pangoly.com/img/4/b/f/9/4bf90265-0448-40fa-b24c-88e0d19bc317.jpg \n', 'GeForce GT 710 2GB DDR3 ZT-71302-20L DVI-D + HDMI + VGA Scheda Video', '22141', 5, 1, 52, 93, NULL, NULL),
(23, 'ARGUS RGB-750W CM 750W ATX', 'https://i.ebayimg.com/images/g/NFoAAOSwleNetGFE/s-l300.jpg', 'Dotato di 80PLUS ® Gold, PFC attivo e gestione dei cavi semi-modulari, Argus RGB-750W CM II offre una vasta gamma di opzioni di connessione e la massima flessibilità possibile nell\'installazione del sistema. I cavi a nastro aumentano la facilità d\'uso e consentono un comodo passaggio dei cavi e una circolazione dell\'aria ottimizzata. La robusta vernice nera e una varietà di meccanismi protettivi completano il quadro positivo.\r\n\r\n', '904542', 7, 1, 60, 92, NULL, NULL),
(24, 'MSI MPG A850GF 850WATT', 'https://m.media-amazon.com/images/I/51OsRvb-DoS._AC_SX450_.jpg', 'MSI MPG A850GF Alimentatore PC 850 Watt, completamente modulare, 80 PLUS Gold, supporto schede RTX, condensatori 100% giapponesi', '21455', 11, 1, 70, 134, NULL, NULL),
(25, 'GAMDIAS ASTRAPE M1-650W RGB ALIMENTATORE ATX', 'https://m.media-amazon.com/images/I/71o4AuKuyXL._AC_SX425_.jpg', 'GAMDIAS Astrape M1-650B RGB Alimentatore ATX Pc Desktop da Gaming 650 Watt 80 Plus Bronzo Ventola RGB Rainbow 120 mm PFC Attivo (Astrape M1, 650W 80+ Bronze)', '34589', 3, 1, 100, 198, NULL, NULL),
(26, 'MARS GAMING MPII650,ALIMENTATORE PC 650W', 'https://m.media-amazon.com/images/I/916eOBgELvL._AC_SY450_.jpg', 'L\'alimentatore MPII650, con un design ecologico e un\'alta efficienza fino all\'85% per il risparmio energetico e la lunga durata, è alloggiato in un case con rivestimento nero opaco e griglia nera.\r\n\r\nÈ fabbricato in conformità con gli standard e le direttive richieste dall\'UE ed è compatibile con 12V ATX. Contiene un ventilatore di alta qualità con sistema anti-vibrazione e sistema di controllo intelligente della velocità Tacens, pale rosse e telaio nero.', '251112', 28, 1, 15, 50, NULL, NULL),
(27, 'Corsair Vengeance LPX 8GB DDR4-2400', 'https://images.eprice.it/nobrand/0/Lightbox/710/200947710/29565365_0077.jpg', 'Corsair Vengeance LPX 8GB DDR4-2400 Memorie per Desktop a Elevate Prestazioni, 8 GB (1 X 8 GB), DDR4, 2400 MHz, C16 XMP 2.0, Nero, dissipatore calore', '111124445', 20, 1, 24, 39, NULL, NULL),
(28, '8 GB 2Rx8 PC3L-12800S RAM', 'https://ae01.alicdn.com/kf/HTB1VEOwSAvoK1RjSZFNq6AxMVXaA/Per-iMac-MRT32LL-MRT42LL-A2116-iMac19-2-del-computer-portatile-RAM-16-GB-DDR4-PC4-19200.jpg_Q90.jpg_.webp\r\n', '8 GB 2Rx8 PC3L-12800S RAM per DELL Latitude 3540 3550 3560 3570 6430u E5250 E5520 E5530 Del Computer Portatile 4 GB DDR3L 1600 MHz di Memoria Per Notebook', '1465463', 5, 1, 40, 74, NULL, NULL),
(29, 'Memoria Kingston FURY Beast  16 GB DDR4 RGB', 'https://cdn.idealo.com/folder/Product/200095/3/200095356/s10_produktbild_gross/hyperx-fury-16gb-ddr4-2666-cl16-hx426c16fb3-16.jpg\r\n', 'Kingston FURY™ Beast DDR4 RGB1 porta le prestazioni e lo stile del tuo sistema a un livello superiore, con velocità che raggiungono i 3733MHz, un look aggressivo e l\'illuminazione RGB che attraversa tutta la lunghezza del modulo, regalando effetti unici e sbalorditivi. Questa soluzione di upgrade, straordinaria per efficienza e costo, è disponibile in velocità da 2.666MHz a 3733MHz, con latenze CL15–19 e capacità da 8GB a 32GB, nel caso di moduli singoli, e da 16GB a 128GB, nel caso di kit. È dotata di una funzione di overclocking automatico Plug N Play che porta le velocità fino a 2666MHz2 ed è Intel® XMP-ready e compatibile anche con le piattaforme AMD Ryzen™. Personalizzazione degli effetti luminosi RGB mediante il software Kingston FURY CTRL e tecnologia Infrared Sync brevettata. FURY Beast DDR4 RGB può definirsi \"cool\" sia per lo stile che per l\'efficacia del dissipatore di calore a basso profilo. Velocità testate al 100% e garanzia a vita contribuiscono a fare di questa memoria u', '0981749', 8, 1, 132, 200, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti_assemblato`
--

CREATE TABLE `prodotti_assemblato` (
  `id_componenti_assemblato` int(11) NOT NULL,
  `id_assemblato1` int(11) DEFAULT NULL,
  `id_prodotto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `prodotti_assemblato`
--

INSERT INTO `prodotti_assemblato` (`id_componenti_assemblato`, `id_assemblato1`, `id_prodotto`) VALUES
(3, 5, 1),
(4, 5, 2),
(8, 6, 10),
(9, 6, 15),
(10, 6, 13),
(11, 6, 24),
(12, 6, 29),
(13, 6, 29),
(15, 5, 28),
(16, 5, 8),
(17, 5, 12),
(18, 5, 15),
(20, 5, 19),
(21, 5, 26);

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti_nel_carrello`
--

CREATE TABLE `prodotti_nel_carrello` (
  `id_prodotto_nel_carrello` int(11) NOT NULL,
  `id_prodotto1` int(11) DEFAULT NULL,
  `id_carrello` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura per vista `ordinepercliente`
--
DROP TABLE IF EXISTS `ordinepercliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordinepercliente`  AS SELECT `p`.`componente` AS `componente`, `p`.`prezzo_di_vendita` AS `prezzo_di_vendita` FROM ((((`prodotti` `p` join `prodotti_nel_carrello` `pc` on(`p`.`id_prodotto` = `pc`.`id_prodotto1`)) join `carrello` `c` on(`pc`.`id_carrello` = `c`.`id_carrello`)) join `ordini` `o` on(`c`.`id_carrello` = `o`.`id_carrello1`)) join `anagrafica_clienti` `ac` on(`o`.`id_anagrafica_cliente` = `ac`.`id_anagrafica_clienti`)) WHERE `ac`.`id_anagrafica_clienti` = 2 ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `anagrafica_clienti`
--
ALTER TABLE `anagrafica_clienti`
  ADD PRIMARY KEY (`id_anagrafica_clienti`);

--
-- Indici per le tabelle `anagrafica_fornitori`
--
ALTER TABLE `anagrafica_fornitori`
  ADD PRIMARY KEY (`id_anagrafica_fornitori`);

--
-- Indici per le tabelle `assemblati`
--
ALTER TABLE `assemblati`
  ADD PRIMARY KEY (`id_assemblato`);

--
-- Indici per le tabelle `carrello`
--
ALTER TABLE `carrello`
  ADD PRIMARY KEY (`id_carrello`);

--
-- Indici per le tabelle `ordini`
--
ALTER TABLE `ordini`
  ADD PRIMARY KEY (`id_ordine`),
  ADD KEY `id_anagrafica_cliente` (`id_anagrafica_cliente`),
  ADD KEY `id_carrello1` (`id_carrello1`);

--
-- Indici per le tabelle `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`id_prodotto`),
  ADD KEY `id_anagrafica_fornitore` (`id_anagrafica_fornitore`),
  ADD KEY `id_assemblato` (`id_assemblato`);

--
-- Indici per le tabelle `prodotti_assemblato`
--
ALTER TABLE `prodotti_assemblato`
  ADD PRIMARY KEY (`id_componenti_assemblato`),
  ADD KEY `id_assemblato1` (`id_assemblato1`),
  ADD KEY `id_prodotto` (`id_prodotto`);

--
-- Indici per le tabelle `prodotti_nel_carrello`
--
ALTER TABLE `prodotti_nel_carrello`
  ADD PRIMARY KEY (`id_prodotto_nel_carrello`),
  ADD KEY `id_carrello` (`id_carrello`),
  ADD KEY `id_prodotto1` (`id_prodotto1`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `anagrafica_clienti`
--
ALTER TABLE `anagrafica_clienti`
  MODIFY `id_anagrafica_clienti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `anagrafica_fornitori`
--
ALTER TABLE `anagrafica_fornitori`
  MODIFY `id_anagrafica_fornitori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `assemblati`
--
ALTER TABLE `assemblati`
  MODIFY `id_assemblato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `carrello`
--
ALTER TABLE `carrello`
  MODIFY `id_carrello` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT per la tabella `ordini`
--
ALTER TABLE `ordini`
  MODIFY `id_ordine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `id_prodotto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT per la tabella `prodotti_assemblato`
--
ALTER TABLE `prodotti_assemblato`
  MODIFY `id_componenti_assemblato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT per la tabella `prodotti_nel_carrello`
--
ALTER TABLE `prodotti_nel_carrello`
  MODIFY `id_prodotto_nel_carrello` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `ordini`
--
ALTER TABLE `ordini`
  ADD CONSTRAINT `id_anagrafica_cliente` FOREIGN KEY (`id_anagrafica_cliente`) REFERENCES `anagrafica_clienti` (`id_anagrafica_clienti`) ON DELETE CASCADE,
  ADD CONSTRAINT `id_carrello1` FOREIGN KEY (`id_carrello1`) REFERENCES `carrello` (`id_carrello`) ON DELETE CASCADE;

--
-- Limiti per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  ADD CONSTRAINT `id_anagrafica_fornitore` FOREIGN KEY (`id_anagrafica_fornitore`) REFERENCES `anagrafica_fornitori` (`id_anagrafica_fornitori`) ON DELETE CASCADE,
  ADD CONSTRAINT `id_assemblato` FOREIGN KEY (`id_assemblato`) REFERENCES `assemblati` (`id_assemblato`) ON DELETE CASCADE;

--
-- Limiti per la tabella `prodotti_assemblato`
--
ALTER TABLE `prodotti_assemblato`
  ADD CONSTRAINT `id_assemblato1` FOREIGN KEY (`id_assemblato1`) REFERENCES `assemblati` (`id_assemblato`) ON DELETE CASCADE,
  ADD CONSTRAINT `id_prodotto` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id_prodotto`) ON DELETE CASCADE;

--
-- Limiti per la tabella `prodotti_nel_carrello`
--
ALTER TABLE `prodotti_nel_carrello`
  ADD CONSTRAINT `id_carrello` FOREIGN KEY (`id_carrello`) REFERENCES `carrello` (`id_carrello`) ON DELETE CASCADE,
  ADD CONSTRAINT `id_prodotto1` FOREIGN KEY (`id_prodotto1`) REFERENCES `prodotti` (`id_prodotto`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
