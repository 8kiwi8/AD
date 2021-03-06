# MySQL-Front Dump 2.5
#
# Host: localhost   Database: finalyearproject
# --------------------------------------------------------
# Server version 5.1.22-rc-community


#
# Table structure for table 'announcement'
#

CREATE TABLE IF NOT EXISTS announcement (
  annID int(10) unsigned NOT NULL auto_increment,
  annTitle varchar(255) NOT NULL DEFAULT '' ,
  annDesc text NOT NULL DEFAULT '' ,
  annShow varchar(45) NOT NULL DEFAULT '' ,
  PRIMARY KEY (annID)
);



#
# Dumping data for table 'announcement'
#

INSERT INTO announcement VALUES("3", "PSM Presentaion Seminar", "Seminar Place: CICT D07", "Y");
INSERT INTO announcement VALUES("9", "PSM", "Pre test", "Y");
INSERT INTO announcement VALUES("11", "PSM 121", "ABCEDEEEEE", "Y");


#
# Table structure for table 'demo_room'
#

CREATE TABLE IF NOT EXISTS demo_room (
  room_name varchar(50) NOT NULL DEFAULT '' ,
  roomID int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY (roomID)
);



#
# Dumping data for table 'demo_room'
#

INSERT INTO demo_room VALUES("Case Lab", "17");
INSERT INTO demo_room VALUES("PSM Lab", "18");


#
# Table structure for table 'engapply'
#

CREATE TABLE IF NOT EXISTS engapply (
  metricNo varchar(20) NOT NULL DEFAULT '' ,
  reason text NOT NULL DEFAULT '' ,
  svSuppReason text ,
  status varchar(45) ,
  proID int(10) unsigned NOT NULL DEFAULT '' ,
  PRIMARY KEY (metricNo)
);



#
# Dumping data for table 'engapply'
#

INSERT INTO engapply VALUES("AC060106", "Weak in bahasa malaysia", NULL, "Approved", "2");
INSERT INTO engapply VALUES("AC060117", "This is because i am weak in bahas Melayu", "ghghghghghghgh", "Pending", "1");


#
# Table structure for table 'ev_pembentangan_psm1'
#

CREATE TABLE IF NOT EXISTS ev_pembentangan_psm1 (
  metricNo varchar(20) NOT NULL DEFAULT '' ,
  peradaban varchar(20) NOT NULL DEFAULT '' ,
  persiapan varchar(20) NOT NULL DEFAULT '' ,
  ketepatan varchar(20) NOT NULL DEFAULT '' ,
  kefahaman varchar(20) NOT NULL DEFAULT '' ,
  keyakinan varchar(20) NOT NULL DEFAULT '' ,
  soal_jawab varchar(20) NOT NULL DEFAULT '' ,
  jumlah varchar(20) NOT NULL DEFAULT '' ,
  ev_comment text NOT NULL DEFAULT '' ,
  PRIMARY KEY (metricNo)
);



#
# Dumping data for table 'ev_pembentangan_psm1'
#

INSERT INTO ev_pembentangan_psm1 VALUES("AC060114", "1", "2", "3", "5", "2", "1.4", "14.4", "kkh");
INSERT INTO ev_pembentangan_psm1 VALUES("AC060117", "0.9", "2", "3", "5", "2", "1.8", "14.700000000000001", "fefe");
INSERT INTO ev_pembentangan_psm1 VALUES("AC060122", "0.3", "0.8", "1.2000000000000001", "1.5", "0.4", "0.4", "4.6000000000000005", "fefefef");
INSERT INTO ev_pembentangan_psm1 VALUES("AC060295", "0.2", "0.6", "0.8999999999999999", "1.5", "0.4", "0.6", "4.2", "e");
INSERT INTO ev_pembentangan_psm1 VALUES("BC070095", "1", "2", "3", "5", "2", "2", "15", "fefefef");
INSERT INTO ev_pembentangan_psm1 VALUES("BC070108", "0.2", "0.4", "0.8999999999999999", "3", "1.6", "1.2", "7.3", "fefe");


#
# Table structure for table 'ev_pembentangan_psm2'
#

CREATE TABLE IF NOT EXISTS ev_pembentangan_psm2 (
  metricNo varchar(20) NOT NULL DEFAULT '' ,
  peradaban varchar(20) NOT NULL DEFAULT '' ,
  persiapan varchar(20) NOT NULL DEFAULT '' ,
  ketepatan varchar(20) NOT NULL DEFAULT '' ,
  kefahaman varchar(20) NOT NULL DEFAULT '' ,
  keyakinan varchar(20) NOT NULL DEFAULT '' ,
  soal_jawab varchar(20) NOT NULL DEFAULT '' ,
  jumlah varchar(20) NOT NULL DEFAULT '' ,
  ev_comment text NOT NULL DEFAULT '' ,
  PRIMARY KEY (metricNo)
);



#
# Dumping data for table 'ev_pembentangan_psm2'
#

INSERT INTO ev_pembentangan_psm2 VALUES("AC060117", "0.9", "2", "2.4000000000000004", "3.5", "1.6", "1.6", "12", "fefef");
INSERT INTO ev_pembentangan_psm2 VALUES("AC060218", "0.3", "2", "3", "4.5", "2", "2", "13.8", "ab");
INSERT INTO ev_pembentangan_psm2 VALUES("BC070095", "0.3", "1.4", "1.7999999999999998", "2.5", "1", "1.2", "8.2", "fefefe");


#
# Table structure for table 'ev_penilaian_psm1'
#

CREATE TABLE IF NOT EXISTS ev_penilaian_psm1 (
  metricNo varchar(10) NOT NULL DEFAULT '' ,
  matlamat varchar(20) NOT NULL DEFAULT '' ,
  kajian varchar(20) NOT NULL DEFAULT '' ,
  perancangan varchar(20) NOT NULL DEFAULT '' ,
  pengumpulan varchar(20) NOT NULL DEFAULT '' ,
  teknik varchar(20) NOT NULL DEFAULT '' ,
  rekabentuk varchar(20) NOT NULL DEFAULT '' ,
  perkakasan varchar(20) NOT NULL DEFAULT '' ,
  hasil varchar(20) NOT NULL DEFAULT '' ,
  rujukan varchar(20) NOT NULL DEFAULT '' ,
  lampiran varchar(20) NOT NULL DEFAULT '' ,
  laporan varchar(20) NOT NULL DEFAULT '' ,
  total varchar(20) NOT NULL DEFAULT '' ,
  komen text NOT NULL DEFAULT '' ,
  PRIMARY KEY (metricNo)
);



#
# Dumping data for table 'ev_penilaian_psm1'
#

INSERT INTO ev_penilaian_psm1 VALUES("AC060106", "2", "3", "1", "2", "3", "5", "2", "3", "1", "1", "25", "fefe", "");
INSERT INTO ev_penilaian_psm1 VALUES("AC060117", "1.8", "1.5", "0.9", "1.6", "2.7", "3.5", "1.4", "2.4000000000000004", "0.7", "0.7", "1.6", "18.8", "fefe");
INSERT INTO ev_penilaian_psm1 VALUES("AC060169", "2", "3", "1", "2", "3", "5", "2", "3", "1", "1", "2", "25", "nvnvnv");
INSERT INTO ev_penilaian_psm1 VALUES("BC070095", "2", "3", "1", "2", "3", "5", "2", "3", "1", "1", "2", "25", "efefefef");


#
# Table structure for table 'ev_penilaian_psm2'
#

CREATE TABLE IF NOT EXISTS ev_penilaian_psm2 (
  metricNo varchar(10) NOT NULL DEFAULT '' ,
  skop varchar(20) NOT NULL DEFAULT '' ,
  metodologi varchar(20) NOT NULL DEFAULT '' ,
  hasil varchar(20) NOT NULL DEFAULT '' ,
  teknologi varchar(20) NOT NULL DEFAULT '' ,
  komersial varchar(20) NOT NULL DEFAULT '' ,
  total varchar(20) NOT NULL DEFAULT '' ,
  komen text NOT NULL DEFAULT '' ,
  PRIMARY KEY (metricNo)
);



#
# Dumping data for table 'ev_penilaian_psm2'
#

INSERT INTO ev_penilaian_psm2 VALUES("AC073112", "10", "10", "10", "10", "10", "25", "fefe");
INSERT INTO ev_penilaian_psm2 VALUES("BC070095", "4", "4", "4", "4", "6", "10.8", "fefefef");


#
# Table structure for table 'expertisefield'
#

CREATE TABLE IF NOT EXISTS expertisefield (
  staffNo varchar(50) NOT NULL DEFAULT '' ,
  expertised varchar(100) NOT NULL DEFAULT '' ,
  description text NOT NULL DEFAULT '' ,
  expertised_ID int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY (expertised_ID)
);



#
# Dumping data for table 'expertisefield'
#

INSERT INTO expertisefield VALUES("S001", "SED01", "Web developement, sheduling system.", "27");
INSERT INTO expertisefield VALUES("S002", "SED03", "Expert System", "28");
INSERT INTO expertisefield VALUES("S004", "SED03", "Component based software engineering", "30");
INSERT INTO expertisefield VALUES("S002", "SED01", "Web Developtment", "31");
INSERT INTO expertisefield VALUES("S002", "SED02", "Genetic Algoritm", "32");
INSERT INTO expertisefield VALUES("S004", "SED02", "fefef", "33");
INSERT INTO expertisefield VALUES("S006", "SED01", "Web Development", "34");
INSERT INTO expertisefield VALUES("S006", "SED02", "Genetic algoritm", "35");
INSERT INTO expertisefield VALUES("S003", "SED01", "Web Developtment", "36");
INSERT INTO expertisefield VALUES("4724", "SED02", "Intelligent System\r\nSpeech recognition and verification", "37");
INSERT INTO expertisefield VALUES("7331", "SED01", "Compotent based software engineering\r\n,Software reuse", "38");
INSERT INTO expertisefield VALUES("7351", "SED02", "Planning and schedulling", "39");
INSERT INTO expertisefield VALUES("7351", "SED01", "Web based software developement", "40");
INSERT INTO expertisefield VALUES("6838", "SED01", "Web based application", "41");
INSERT INTO expertisefield VALUES("6838", "SED03", "", "42");
INSERT INTO expertisefield VALUES("10054", "SED02", "Data/ Text mining", "43");
INSERT INTO expertisefield VALUES("2135", "SED01", "Web Development", "44");
INSERT INTO expertisefield VALUES("7019", "SED01", "Real Time Software", "45");
INSERT INTO expertisefield VALUES("5809", "SED02", "Computational Peteomic, computation genomic", "46");
INSERT INTO expertisefield VALUES("1898", "SED01", "Computer science education/ elearning", "47");
INSERT INTO expertisefield VALUES("1898", "SED03", "Expert System", "48");
INSERT INTO expertisefield VALUES("5160", "SED01", "Intelligent System, elearning algorithm", "49");
INSERT INTO expertisefield VALUES("S008", "SED01", "Intelligent learning system", "50");
INSERT INTO expertisefield VALUES("S009", "SED01", "Web development", "51");
INSERT INTO expertisefield VALUES("2157", "SED02", "Fuzzy logic, neural network, genetic algorithm", "52");
INSERT INTO expertisefield VALUES("S010", "SED01", "Agent oriented software engineering", "53");
INSERT INTO expertisefield VALUES("1234", "SED01", "Software engineering", "54");
INSERT INTO expertisefield VALUES("1234", "SED02", "Genetic algorithm, case base reasoning, neural network, support vector machine", "55");
INSERT INTO expertisefield VALUES("4298", "SED01", "Software engineering", "56");
INSERT INTO expertisefield VALUES("S011", "SED01", "Web based System", "57");
INSERT INTO expertisefield VALUES("6749", "SED01", "Software engineering", "58");
INSERT INTO expertisefield VALUES("6749", "SED02", "Soft computing, techniques and applications", "59");
INSERT INTO expertisefield VALUES("7352", "SED01", "Software design / architechture", "60");
INSERT INTO expertisefield VALUES("4724", "null", "null", "61");


#
# Table structure for table 'lec_ev_timetable'
#

CREATE TABLE IF NOT EXISTS lec_ev_timetable (
  ev1 varchar(10) NOT NULL DEFAULT '' ,
  ev2 varchar(10) NOT NULL DEFAULT '' ,
  slot varchar(45) NOT NULL DEFAULT '' ,
  room varchar(100) NOT NULL DEFAULT '' 
);



#
# Dumping data for table 'lec_ev_timetable'
#

INSERT INTO lec_ev_timetable VALUES("7331", "4724", "tt0102", "17");
INSERT INTO lec_ev_timetable VALUES("7351", "7331", "tt0202", "17");
INSERT INTO lec_ev_timetable VALUES("6838", "4724", "tt0302", "17");
INSERT INTO lec_ev_timetable VALUES("7351", "4724", "tt0402", "17");
INSERT INTO lec_ev_timetable VALUES("7331", "4724", "tt0103", "17");
INSERT INTO lec_ev_timetable VALUES("7351", "7331", "tt0203", "17");
INSERT INTO lec_ev_timetable VALUES("7019", "5809", "tt0104", "17");


#
# Table structure for table 'lec_timetable'
#

CREATE TABLE IF NOT EXISTS lec_timetable (
  staffNo varchar(10) NOT NULL DEFAULT '' ,
  free_period varchar(6) NOT NULL DEFAULT '' 
);



#
# Dumping data for table 'lec_timetable'
#

INSERT INTO lec_timetable VALUES("6838", "tt0102");
INSERT INTO lec_timetable VALUES("6838", "tt0109");
INSERT INTO lec_timetable VALUES("6838", "tt0202");
INSERT INTO lec_timetable VALUES("6838", "tt0203");
INSERT INTO lec_timetable VALUES("6838", "tt0205");
INSERT INTO lec_timetable VALUES("6838", "tt0208");
INSERT INTO lec_timetable VALUES("6838", "tt0302");
INSERT INTO lec_timetable VALUES("6838", "tt0308");
INSERT INTO lec_timetable VALUES("6838", "tt0403");
INSERT INTO lec_timetable VALUES("6838", "tt0404");
INSERT INTO lec_timetable VALUES("6838", "tt0503");
INSERT INTO lec_timetable VALUES("6838", "tt0504");
INSERT INTO lec_timetable VALUES("6838", "tt0505");
INSERT INTO lec_timetable VALUES("6838", "tt0507");
INSERT INTO lec_timetable VALUES("2135", "tt0102");
INSERT INTO lec_timetable VALUES("2135", "tt0103");
INSERT INTO lec_timetable VALUES("2135", "tt0108");
INSERT INTO lec_timetable VALUES("2135", "tt0109");
INSERT INTO lec_timetable VALUES("2135", "tt0202");
INSERT INTO lec_timetable VALUES("2135", "tt0203");
INSERT INTO lec_timetable VALUES("2135", "tt0205");
INSERT INTO lec_timetable VALUES("2135", "tt0303");
INSERT INTO lec_timetable VALUES("2135", "tt0305");
INSERT INTO lec_timetable VALUES("2135", "tt0308");
INSERT INTO lec_timetable VALUES("2135", "tt0402");
INSERT INTO lec_timetable VALUES("2135", "tt0403");
INSERT INTO lec_timetable VALUES("2135", "tt0404");
INSERT INTO lec_timetable VALUES("2135", "tt0506");
INSERT INTO lec_timetable VALUES("2135", "tt0509");
INSERT INTO lec_timetable VALUES("7019", "tt0102");
INSERT INTO lec_timetable VALUES("7019", "tt0104");
INSERT INTO lec_timetable VALUES("7019", "tt0105");
INSERT INTO lec_timetable VALUES("7019", "tt0108");
INSERT INTO lec_timetable VALUES("7019", "tt0307");
INSERT INTO lec_timetable VALUES("7019", "tt0309");
INSERT INTO lec_timetable VALUES("7019", "tt0407");
INSERT INTO lec_timetable VALUES("7019", "tt0408");
INSERT INTO lec_timetable VALUES("7019", "tt0409");
INSERT INTO lec_timetable VALUES("7019", "tt0507");
INSERT INTO lec_timetable VALUES("7019", "tt0508");
INSERT INTO lec_timetable VALUES("7019", "tt0509");
INSERT INTO lec_timetable VALUES("5809", "tt0103");
INSERT INTO lec_timetable VALUES("5809", "tt0104");
INSERT INTO lec_timetable VALUES("5809", "tt0202");
INSERT INTO lec_timetable VALUES("5809", "tt0203");
INSERT INTO lec_timetable VALUES("5809", "tt0303");
INSERT INTO lec_timetable VALUES("5809", "tt0304");
INSERT INTO lec_timetable VALUES("5809", "tt0402");
INSERT INTO lec_timetable VALUES("5809", "tt0403");
INSERT INTO lec_timetable VALUES("5809", "tt0405");
INSERT INTO lec_timetable VALUES("5809", "tt0505");
INSERT INTO lec_timetable VALUES("5809", "tt0507");
INSERT INTO lec_timetable VALUES("7331", "tt0102");
INSERT INTO lec_timetable VALUES("7331", "tt0103");
INSERT INTO lec_timetable VALUES("7331", "tt0202");
INSERT INTO lec_timetable VALUES("7331", "tt0203");
INSERT INTO lec_timetable VALUES("7331", "tt0206");
INSERT INTO lec_timetable VALUES("7331", "tt0302");
INSERT INTO lec_timetable VALUES("7331", "tt0303");
INSERT INTO lec_timetable VALUES("7331", "tt0307");
INSERT INTO lec_timetable VALUES("7331", "tt0405");
INSERT INTO lec_timetable VALUES("7331", "tt0407");
INSERT INTO lec_timetable VALUES("4724", "tt0102");
INSERT INTO lec_timetable VALUES("4724", "tt0103");
INSERT INTO lec_timetable VALUES("4724", "tt0105");
INSERT INTO lec_timetable VALUES("4724", "tt0106");
INSERT INTO lec_timetable VALUES("4724", "tt0107");
INSERT INTO lec_timetable VALUES("4724", "tt0202");
INSERT INTO lec_timetable VALUES("4724", "tt0203");
INSERT INTO lec_timetable VALUES("4724", "tt0204");
INSERT INTO lec_timetable VALUES("4724", "tt0205");
INSERT INTO lec_timetable VALUES("4724", "tt0206");
INSERT INTO lec_timetable VALUES("4724", "tt0207");
INSERT INTO lec_timetable VALUES("4724", "tt0302");
INSERT INTO lec_timetable VALUES("4724", "tt0303");
INSERT INTO lec_timetable VALUES("4724", "tt0304");
INSERT INTO lec_timetable VALUES("4724", "tt0402");
INSERT INTO lec_timetable VALUES("4724", "tt0403");
INSERT INTO lec_timetable VALUES("4724", "tt0404");
INSERT INTO lec_timetable VALUES("4724", "tt0502");
INSERT INTO lec_timetable VALUES("4724", "tt0503");
INSERT INTO lec_timetable VALUES("4724", "tt0504");
INSERT INTO lec_timetable VALUES("7351", "tt0202");
INSERT INTO lec_timetable VALUES("7351", "tt0203");
INSERT INTO lec_timetable VALUES("7351", "tt0204");
INSERT INTO lec_timetable VALUES("7351", "tt0205");
INSERT INTO lec_timetable VALUES("7351", "tt0206");
INSERT INTO lec_timetable VALUES("7351", "tt0207");
INSERT INTO lec_timetable VALUES("7351", "tt0302");
INSERT INTO lec_timetable VALUES("7351", "tt0303");
INSERT INTO lec_timetable VALUES("7351", "tt0304");
INSERT INTO lec_timetable VALUES("7351", "tt0305");
INSERT INTO lec_timetable VALUES("7351", "tt0306");
INSERT INTO lec_timetable VALUES("7351", "tt0307");
INSERT INTO lec_timetable VALUES("7351", "tt0402");
INSERT INTO lec_timetable VALUES("7351", "tt0405");


#
# Table structure for table 'lecturer'
#

CREATE TABLE IF NOT EXISTS lecturer (
  lectName varchar(200) NOT NULL DEFAULT '' ,
  staffNo varchar(45) NOT NULL DEFAULT '' ,
  emailAdd varchar(100) NOT NULL DEFAULT '' ,
  phoneNo varchar(45) NOT NULL DEFAULT '' ,
  pass varchar(250) NOT NULL DEFAULT '' ,
  roomNo varchar(100) NOT NULL DEFAULT '' ,
  PRIMARY KEY (staffNo)
);



#
# Dumping data for table 'lecturer'
#

INSERT INTO lecturer VALUES("Ito Wasito", "10054", "ito@utm.my", "075532225", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "D07-447-01");
INSERT INTO lecturer VALUES("Safaai Deris", "1234", "safaai@utm.my", "075532343", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-05");
INSERT INTO lecturer VALUES("Noraniah Mohd Yassin", "1898", "noraniah@utm.my", "075532346", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-09 ");
INSERT INTO lecturer VALUES("Mabeni Mapoh", "2135", "mabeni@utm.my", "075532232", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "D07-354-01");
INSERT INTO lecturer VALUES("Puteh Saad", "2157", "puteh@utm.my", "075532344", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-06");
INSERT INTO lecturer VALUES("Safie Mat Yatim", "4298", "safiematyatim@utm.my", "075532347", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-10");
INSERT INTO lecturer VALUES("Abdul Manan Ahmad", "4724", "manan@utm.my", "075532201", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-04");
INSERT INTO lecturer VALUES("Norazah Yusof", "5160", "norazah@utm.my", "075532344", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-12");
INSERT INTO lecturer VALUES("Muhammad Razib Othman", "5809", "razib@utm.my", "075532258", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-04 ");
INSERT INTO lecturer VALUES("Siti Zaiton Mohd Hashim", "6749", "sitizaiton@utm.my", "075532439", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-18");
INSERT INTO lecturer VALUES("Ismail Mat Amin", "6838", "ismailma@utm.my", "075532345", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-08");
INSERT INTO lecturer VALUES("Mohd Yazid Idris", "7019", "yazid@utm.my", "075532309", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-14 ");
INSERT INTO lecturer VALUES("Dayang Norhayati Abg Jawawi", "7331", "dayang@utm.my", "075532354", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-06");
INSERT INTO lecturer VALUES("Hishammuddin Asmuni", "7351", "hishammuddin@utm.my", "075532353", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-05");
INSERT INTO lecturer VALUES("Wan Mohd Nasir Wan Kadir", "7352", "wnasir@utm.my", "075532348", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-11");
INSERT INTO lecturer VALUES("Norbahiah Ahmad", "S008", "bahiah@utm.my", "012345678", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "-");
INSERT INTO lecturer VALUES("Paridah Samsuri", "S009", "paridah@fsksm.utm.my", "075532042", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-15");
INSERT INTO lecturer VALUES("Radziah Mohamad", "S010", "radziahm@utm.my", "075532013", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-17");
INSERT INTO lecturer VALUES("Sazali Abd Manaf", "S011", "sazali@utm.my", "075532432", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-20");


#
# Table structure for table 'presentation_table'
#

CREATE TABLE IF NOT EXISTS presentation_table (
  staffNo varchar(10) NOT NULL DEFAULT '' ,
  slot varchar(10) NOT NULL DEFAULT '' ,
  evaluator varchar(10) NOT NULL DEFAULT '' ,
  room varchar(10) NOT NULL DEFAULT '' 
);



#
# Dumping data for table 'presentation_table'
#



#
# Table structure for table 'project_evaluation'
#

CREATE TABLE IF NOT EXISTS project_evaluation (
  slot varchar(10) NOT NULL DEFAULT '' ,
  roomID varchar(10) NOT NULL DEFAULT '' ,
  marks_ev1 varchar(45) ,
  marks_ev2 varchar(45) ,
  comment_ev1 text ,
  comment_ev2 text ,
  metricNo varchar(20) NOT NULL DEFAULT '' ,
  session varchar(5) NOT NULL DEFAULT '' ,
  PRIMARY KEY (metricNo)
);



#
# Dumping data for table 'project_evaluation'
#

INSERT INTO project_evaluation VALUES("tt0203", "17", NULL, NULL, NULL, NULL, "AC060106", "1");
INSERT INTO project_evaluation VALUES("tt0102", "17", NULL, NULL, NULL, NULL, "AC060114", "1");
INSERT INTO project_evaluation VALUES("tt0103", "17", NULL, NULL, NULL, NULL, "AC060117", "2");
INSERT INTO project_evaluation VALUES("tt0202", "17", NULL, NULL, NULL, NULL, "AC060120", "1");
INSERT INTO project_evaluation VALUES("tt0203", "17", NULL, NULL, NULL, NULL, "AC060169", "2");
INSERT INTO project_evaluation VALUES("tt0102", "17", NULL, NULL, NULL, NULL, "AC060218", "2");
INSERT INTO project_evaluation VALUES("tt0103", "17", NULL, NULL, NULL, NULL, "AC060253", "1");
INSERT INTO project_evaluation VALUES("tt0302", "17", NULL, NULL, NULL, NULL, "AC060295", "2");
INSERT INTO project_evaluation VALUES("tt0402", "17", NULL, NULL, NULL, NULL, "BC070095", "1");
INSERT INTO project_evaluation VALUES("tt0302", "17", NULL, NULL, NULL, NULL, "BC070108", "1");


#
# Table structure for table 'projectfield'
#

CREATE TABLE IF NOT EXISTS projectfield (
  ID varchar(20) NOT NULL DEFAULT '' ,
  proField varchar(255) NOT NULL DEFAULT '' ,
  PRIMARY KEY (ID)
);



#
# Dumping data for table 'projectfield'
#

INSERT INTO projectfield VALUES("SED01", "Software Engineering");
INSERT INTO projectfield VALUES("SED02", "Computational Intelligent");
INSERT INTO projectfield VALUES("SED03", "Expert System");
INSERT INTO projectfield VALUES("SED04", "Agent Based Project");
INSERT INTO projectfield VALUES("SED05", "Mobile Application");
INSERT INTO projectfield VALUES("SED06", "Web Development");


#
# Table structure for table 'quota_lecturer'
#

CREATE TABLE IF NOT EXISTS quota_lecturer (
  ev1 int(10) unsigned ,
  ev2 int(10) unsigned ,
  supervision int(10) unsigned ,
  semester varchar(10) NOT NULL DEFAULT '' ,
  ev_title int(10) unsigned ,
  PRIMARY KEY (semester)
);



#
# Dumping data for table 'quota_lecturer'
#

INSERT INTO quota_lecturer VALUES("11", "11", "11", "200820092", "11");


#
# Table structure for table 'student'
#

CREATE TABLE IF NOT EXISTS student (
  studName varchar(100) NOT NULL DEFAULT '' ,
  metricNo varchar(20) NOT NULL DEFAULT '' ,
  icNo varchar(12) NOT NULL DEFAULT '' ,
  emailAdd varchar(50) NOT NULL DEFAULT '' ,
  pass varchar(50) NOT NULL DEFAULT '' ,
  phoneNo varchar(45) NOT NULL DEFAULT '' ,
  semester varchar(10) NOT NULL DEFAULT '' ,
  PRIMARY KEY (metricNo)
);



#
# Dumping data for table 'student'
#

INSERT INTO student VALUES("Kwan Lai Pheng", "AC060106", "850521075288", "lpkwan@hotmail.com", "*E9D057131C22A0D76B4AAD2C61655BDFA706E637", "0164972445", "200820092");
INSERT INTO student VALUES("LEE SIANG CHOON", "AC060114", "850112075439", "Jol2dan@hotmail.com", "*8B29741A2324BB8BDFAF73A25C2639D56F3D30A1", "0167676257", "200820092");
INSERT INTO student VALUES("Lee Yih Rou", "AC060117", "860922406072", "bluelyrou@hotmail.com", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "0124263568", "200820092");
INSERT INTO student VALUES("Lim Bee Yean", "AC060120", "860213075090", "tulip_limby@yahoo.com", "*A4B6157319038724E3560894F7F932C8886EBFCF", "0164698981", "200820092");
INSERT INTO student VALUES("Lim Kah Seng", "AC060122", "860709025011", "mike@hotmail.com", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "0122345667", "200820092");
INSERT INTO student VALUES("Ng Chew Hun", "AC060169", "860922405072", "chew@hotmail.com", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "012345678", "200820092");
INSERT INTO student VALUES("OOI CHAI YOON", "AC060218", "860305386478", "cyoon5030@hotmail.com", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "0165068428", "200820092");
INSERT INTO student VALUES("Siew Huey Ing", "AC060237", "850701135436", "angeline_hi@hotmail.com", "*31D2CAC6513D1CD15CA1512E7131DC3D8ADAC778", "0168729270", "200820092");
INSERT INTO student VALUES("Sim Hiew Moi", "AC060238", "860817526390", "candy_shm@hotmail.com", "*A4B6157319038724E3560894F7F932C8886EBFCF", "0168557648", "200820092");
INSERT INTO student VALUES("Tan Eng Chen", "AC060253", "861223355015", "aexon86@hotmail.com", "*069A5D7AA5BF71183026C67DAE0596DF372B872D", "0125201153", "200820092");
INSERT INTO student VALUES("Sim Hiew Moi", "AC060286", "860817355288", "sim@hotmail.com", "*FD571203974BA9AFE270FE62151AE967ECA5E0AA", "01685576411", "200820092");
INSERT INTO student VALUES("Chia Tze Seng", "AC060295", "861110236749", "ts_maryn@hotmail.com", "*23AE809DDACAF96AF0FD78ED04B6A265E05AA257", "0167966103", "200820092");
INSERT INTO student VALUES("Ong Wei Kuan", "AC073112", "860922405072", "weikuan@hotmail.com", "*12033B78389744F3F39AC4CE4CCFCAD6960D8EA0", "0125548282", "200820092");
INSERT INTO student VALUES("Saw Jin Keat", "BC070095", "861124097899", "sawjk@hotmail.com", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "0172217017", "200820092");
INSERT INTO student VALUES("Tan Kai Chun", "BC070108", "860920236594", "dolphintan2002@yahoo.com", "*E56A114692FE0DE073F9A1DD68A00EEB9703F3F1", "0166825195", "200820092");


#
# Table structure for table 'supervision_marks_psm1'
#

CREATE TABLE IF NOT EXISTS supervision_marks_psm1 (
  metricNo varchar(20) NOT NULL DEFAULT '' ,
  gantt varchar(20) NOT NULL DEFAULT '' ,
  kebolehan varchar(20) NOT NULL DEFAULT '' ,
  daya varchar(20) NOT NULL DEFAULT '' ,
  kekerapan varchar(20) NOT NULL DEFAULT '' ,
  peningkatan varchar(20) NOT NULL DEFAULT '' ,
  keberkesanan varchar(20) NOT NULL DEFAULT '' ,
  peranan varchar(20) NOT NULL DEFAULT '' ,
  formet varchar(20) NOT NULL DEFAULT '' ,
  abstrak varchar(20) NOT NULL DEFAULT '' ,
  objektif varchar(20) NOT NULL DEFAULT '' ,
  analisis varchar(20) NOT NULL DEFAULT '' ,
  kajian varchar(20) NOT NULL DEFAULT '' ,
  metodologi varchar(20) NOT NULL DEFAULT '' ,
  kesimpulan varchar(20) NOT NULL DEFAULT '' ,
  rujukan varchar(20) NOT NULL DEFAULT '' ,
  lampiran varchar(20) NOT NULL DEFAULT '' ,
  persembahan varchar(20) NOT NULL DEFAULT '' ,
  ayat varchar(20) NOT NULL DEFAULT '' ,
  gambarajah varchar(20) NOT NULL DEFAULT '' ,
  total varchar(20) NOT NULL DEFAULT '' ,
  komen text NOT NULL DEFAULT '' ,
  PRIMARY KEY (metricNo)
);



#
# Dumping data for table 'supervision_marks_psm1'
#

INSERT INTO supervision_marks_psm1 VALUES("AC060117", "3", "2", "2", "1", "1", "1", "5", "5", "3", "5", "5", "5", "6", "2", "1", "3", "4", "4", "2", "60", "fef");
INSERT INTO supervision_marks_psm1 VALUES("AC060122", "3", "2", "2", "1", "0.9", "1", "5", "5", "3", "5", "5", "5", "6", "2", "1", "3", "4", "3.6", "2", "59.5", "fefe");
INSERT INTO supervision_marks_psm1 VALUES("AC060238", "3", "2", "2", "1", "1", "1", "5", "5", "3", "5", "5", "5", "6", "2", "1", "3", "4", "4", "2", "60", "ffefefef");
INSERT INTO supervision_marks_psm1 VALUES("BC070095", "2.7", "1.4", "0.6", "0.7", "0.9", "0.8", "5", "2", "2.0999999999999996", "3.5", "4", "5", "5.4", "1.6", "0.9", "2.0999999999999996", "2", "3.2", "0.8", "44.7", "ffefef");


#
# Table structure for table 'supervision_marks_psm2'
#

CREATE TABLE IF NOT EXISTS supervision_marks_psm2 (
  metricNo varchar(10) NOT NULL DEFAULT '' ,
  panduan varchar(20) NOT NULL DEFAULT '' ,
  skop varchar(20) NOT NULL DEFAULT '' ,
  teknologi varchar(20) NOT NULL DEFAULT '' ,
  komersial varchar(20) NOT NULL DEFAULT '' ,
  persembahan varchar(20) NOT NULL DEFAULT '' ,
  ayat varchar(20) NOT NULL DEFAULT '' ,
  gambarajah varchar(20) NOT NULL DEFAULT '' ,
  kajian varchar(20) NOT NULL DEFAULT '' ,
  teknik varchar(20) NOT NULL DEFAULT '' ,
  fakta varchar(20) NOT NULL DEFAULT '' ,
  keterperincian varchar(20) NOT NULL DEFAULT '' ,
  total varchar(20) NOT NULL DEFAULT '' ,
  komen text NOT NULL DEFAULT '' ,
  PRIMARY KEY (metricNo)
);



#
# Dumping data for table 'supervision_marks_psm2'
#

INSERT INTO supervision_marks_psm2 VALUES("AC060117", "5", "5", "3", "1", "1.6", "3.2", "1.6", "4.199999999999999", "4.800000000000001", "1.6", "3.6", "34.6", " fefef");
INSERT INTO supervision_marks_psm2 VALUES("AC060122", "5", "5", "3", "2", "4", "4", "2", "6", "6", "4", "4", "45", " fefefe");
INSERT INTO supervision_marks_psm2 VALUES("BC070095", "3", "3", "1.2000000000000002", "1.6", "3.2", "3.2", "1.4", "4.199999999999999", "4.199999999999999", "2", "0.8", "27.799999999999997", " fefe");


#
# Table structure for table 'supervision_phase1_psm2'
#

CREATE TABLE IF NOT EXISTS supervision_phase1_psm2 (
  metricNo varchar(10) NOT NULL DEFAULT '' ,
  gantt varchar(20) NOT NULL DEFAULT '' ,
  kebolehan varchar(20) NOT NULL DEFAULT '' ,
  daya varchar(20) NOT NULL DEFAULT '' ,
  kekerapan varchar(20) NOT NULL DEFAULT '' ,
  peningkatan varchar(20) NOT NULL DEFAULT '' ,
  keberkesanan varchar(20) NOT NULL DEFAULT '' ,
  total varchar(20) NOT NULL DEFAULT '' ,
  komen text ,
  PRIMARY KEY (metricNo)
);



#
# Dumping data for table 'supervision_phase1_psm2'
#

INSERT INTO supervision_phase1_psm2 VALUES("AC060117", "2", "1.4", "1.4", "1.8", "1.6", "2", "10.2", NULL);
INSERT INTO supervision_phase1_psm2 VALUES("AC060122", "0", "0.2", "1.4", "1", "0.4", "1", "3.9999999999999996", "fefefefefef");
INSERT INTO supervision_phase1_psm2 VALUES("BC070095", "1.5", "0.6", "0.6", "1.2", "1", "2", "6.9", "fefefe");


#
# Table structure for table 'supervision_phase2_psm2'
#

CREATE TABLE IF NOT EXISTS supervision_phase2_psm2 (
  metricNo varchar(10) NOT NULL DEFAULT '' ,
  gantt varchar(20) NOT NULL DEFAULT '' ,
  kebolehan varchar(20) NOT NULL DEFAULT '' ,
  daya varchar(20) NOT NULL DEFAULT '' ,
  kekerapan varchar(20) NOT NULL DEFAULT '' ,
  peningkatan varchar(20) NOT NULL DEFAULT '' ,
  keberkesanan varchar(20) NOT NULL DEFAULT '' ,
  total varchar(20) NOT NULL DEFAULT '' ,
  komen text ,
  PRIMARY KEY (metricNo)
);



#
# Dumping data for table 'supervision_phase2_psm2'
#

INSERT INTO supervision_phase2_psm2 VALUES("AC060117", "2", "0.2", "0.8", "2", "1", "0.4", "6.4", "ab");
INSERT INTO supervision_phase2_psm2 VALUES("AC060122", "5", "2", "2", "2", "2", "2", "15", " abc");
INSERT INTO supervision_phase2_psm2 VALUES("BC070095", "3", "1.4", "0.8", "1", "1.6", "1.2", "9", " fefefe");


#
# Table structure for table 'supervisor'
#

CREATE TABLE IF NOT EXISTS supervisor (
  staffNo varchar(50) NOT NULL DEFAULT '' ,
  metricNo varchar(20) NOT NULL DEFAULT '' ,
  status varchar(50) ,
  semester varchar(10) NOT NULL DEFAULT '' 
);



#
# Dumping data for table 'supervisor'
#

INSERT INTO supervisor VALUES("2135", "AC060106", "Approved", "200820092");
INSERT INTO supervisor VALUES("7331", "BC070095", "Approved", "200820092");
INSERT INTO supervisor VALUES("4724", "AC060122", "Approved", "200820092");
INSERT INTO supervisor VALUES("7331", "AC073112", "Approved", "200820092");
INSERT INTO supervisor VALUES("7019", "AC060169", "Approved", "200820092");
INSERT INTO supervisor VALUES("6749", "AC060114", "Approved", "200820092");
INSERT INTO supervisor VALUES("2157", "AC060218", "Approved", "200820092");
INSERT INTO supervisor VALUES("2157", "AC060253", "Approved", "200820092");
INSERT INTO supervisor VALUES("5160", "AC060120", "Approved", "200820092");
INSERT INTO supervisor VALUES("7352", "BC070108", "Approved", "200820092");
INSERT INTO supervisor VALUES("2157", "AC060295", "Approved", "200820092");
INSERT INTO supervisor VALUES("7351", "AC060238", "Approved", "200820092");
INSERT INTO supervisor VALUES("7351", "AC060117", "Approved", "200820092");


#
# Table structure for table 'title'
#

CREATE TABLE IF NOT EXISTS title (
  proTitle varchar(255) NOT NULL DEFAULT '' ,
  bgProblem text NOT NULL DEFAULT '' ,
  objective text NOT NULL DEFAULT '' ,
  scope text NOT NULL DEFAULT '' ,
  proType text NOT NULL DEFAULT '' ,
  proField text NOT NULL DEFAULT '' ,
  softSpecification text NOT NULL DEFAULT '' ,
  hardware text NOT NULL DEFAULT '' ,
  technology text NOT NULL DEFAULT '' ,
  metricNo varchar(20) NOT NULL DEFAULT '' ,
  status varchar(60) NOT NULL DEFAULT '' ,
  semester varchar(45) NOT NULL DEFAULT '' ,
  proID int(10) unsigned NOT NULL auto_increment,
  evaluator varchar(45) ,
  comment text ,
  title_flag varchar(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY (proID)
);



#
# Dumping data for table 'title'
#

INSERT INTO title VALUES("Sistem Penjadualan dan Pengurusan PSM berasaskan Web", "Susah untuk mengendalikan pengurusan PSM.\r\nTiada satu sistem yang menyimpan maklumat secara pusat.", "Mengenalpasti masalah sistem sekarang.", "Fakulti Sistem Maklumat dan Komputer Sains\r\nJabatan Kejuruteraan Perisian", "softDev", "SED01", "Netbeans.", "Labtop", "Java, Java server pages", "AC060117", "Full Approval", "200820092", "1", "4724", "fgfgfg", "Y");
INSERT INTO title VALUES("Sistem Pengurusan Jualan Vevarry Enterprise Sdn Bhd", "Kaedah manual pengurusan penjualan digunakan oleh syarikat ini.", "Mengenalpasti masalah yang dihadapti oleh Vevarry Enterprise Sdn Bhd dengan melaksanakan kajian analisis.", "Penggunaan hanya terhad kepada pekerja Vevary Sahaja.", "softDev", "SED01", "Microsoft visual studio", "Labtop", "ASP.net", "AC060106", "Full Approval", "200820092", "2", "S011", NULL, "Y");
INSERT INTO title VALUES("Web-Based Video Conferencing For Cooperative Learning in FSKSM", "Generally, an event needs to be attended by people physically. For instance, people have to physically attend to a meeting. When the meeting is unable for people to attend, the meeting either being postponed or canceled, or other methods are being used in order to run the meeting.In addition, whenever a training program or seminar for people being involved, the training program or seminar have to physically attend by the people. Meanwhile, all the works need to be hold. Otherwise, works is done in free time in between of the training program or seminar.Furthermore, lecture or class needs to be physically attended by students and lecturers. When students are involved in some events such as sport competition or other competition from the university or college and unable to attend lecture, some important information will be missed by them. Similarly, some classes might be missed by students if they fall sick or not feeling well.In FSKSM, UTM has a very good network communication technology and foundation, and a very wide WAN bandwidth. Students and lecturers are not required to pay for a cent in order to use the Internet service. However, these technologies are not being used wisely.Moreover, UTM is currently driving towards and trying to implement cooperative learning in academic. UTM is trying to use cooperative learning in order to boost students�?¢?? academic performance where it is a win-win situation. Students�?¢?? academic not only good in themselves but students are helping others to be good as well. However, there are several problem faced such as each students have their own time table, different student stay in different hostel where not all students have transport and distance between hostels are far.", "i.�? To study on Session Initiation Protocol (SIP).ii.�? To identify the features and capabilities of current video conferencing application.iii.�? To develop a web-based video conferencing with features and capabilities for students and lecturers communication in cooperative learning in FSKSM.", "The scope of this project is limited to students and lecturers of FSKSM in UTM only. This project also limited to devices such as personal computer, microphone for personal computer. It is not covered for other mobile communication devices such as mobile phone, PDA; other microphone devices except microphone for personal computer.", "softDev", "SED06", "Java Runtime Environment (JRE) 1.6Tomcat service  ", "Web serverMySQL server", "  Network Socket Programming (Multicast)JSP / Servlet", "BC070095", "Full Approval", "200820092", "3", "6838", "fefefef", "Y");
INSERT INTO title VALUES("Sistem Penempahan Tiket Wayang Melalui Aplikasi Mobile", "Menonton wayang sekian menjadi salah satu aktiviti hiburan bagi masyarakat umum. Kebiasaanya, masyarakat akan memilih hujung minggu sebagai â??hari keluargaâ?? atau keluar bersama-sama dengan kawan. Mereka kena beratur panjang untuk membeli tiket terutamanya pada  musim perayaaan dan musim cuti persekolahan, ataupun mereka juga boleh menempah tiket secara atas talian. Namun demikian, masalahnya ialah bukan setiap rumah mempunyai komputer dan perkhidmatan internet di rumah dan pelanggan terpaksa berbaris panjang untuk mendapatkan tiket wayang secara tidak langsung pelanggan telah membazir masa yang panjang, wang dan tenaga untuk membeli ticket wayang. Ini menyebabkan mereka yang ingin berhibur dan rehat pada hari cuti, semua habis digunakan dalam membeli tiket wayang. ", "i.	Melakukan kajian terhadap sistem tempahan tiket yang sedia ada\r\nii.	Membangunkan satu sistem penempahan tiket dengan menggunakan aplikasi mudah alih.\r\niii.	Membuat pengujian terhadap sistem tempahan tiket tersebut. \r\n", "i.	Sistem ini hanya boleh diaplikasikan di dalam tekefon bimbit yang mempunyai perisian Java sahaja.\r\nii.	Sistem ini dibina untuk memudahkan masyarakat membuat penempahan tiket wayang. \r\niii.	Bagi tujuan pengujian, sistem ini dihasilkan untuk satu pawagam sahaja\r\niv.	Sistem ini menggunakan teknologi aplikasi dalam telefon menggunakan java  sahaja.\r\n", "softDev", "SED01", "Tomcat", " Computer", "Java", "AC073112", "Pending", "200820092", "4", "S008", NULL, "Y");
INSERT INTO title VALUES("Health Care Application integration and information sharring", "There are many clinics and hospital have already using computer to computerize their records for their patients. But most of the existing system, there are no interaction among their system with other clinical system/hospital system. The patients�?? data just recorded in their local system plus a patient�??s health information may be spread out over a number of different institutes which do not interoperate. This makes it very difficult for clinicians to capture a complete clinical history of a patient. Standard Integration of the information between inter-clinical system and inter-hospital system has not yet been implemented. Therefore, this kind of system should be improved by applying web services, so that the information sharing can be integrated. This service is important especially during emergency situation like accident. A patient�??s data can be retrieved through the web services. His or her important medical information can be reviewed to help doctors and nurses to save a lot of time and then apply suitable medicine/method to help the patient. By doing so, errors can be reduced too, for an example; based-on the information provided through web services, the doctor can know if the patient is allergies with that particular medicine.", "To achieve the above aim, the aim of this project is divided into the following sub-system.\r\n1.	To study the web services technique in application exchange & information sharing. \r\n2.	To identify various requirements on exchanging the healthcare information.\r\n3.	To design & implement the integration of healthcare system using web services.\r\n", "1.	X-ray reports which consists of detail X-ray diagnosis information and X-Ray report.\r\n2.	Lab report which includes blood examination record, renal function test and etc.\r\n3.	Patient record which includes all the patient basic information.\r\n4.	General medical information (Ex: Patient�??s sickness information, consultation and etc.).\r\n", "softDev", "SED01", ".net Framework", "Web server, sql server", "C# programming", "AC060169", "Pending", "200820092", "5", "4724", NULL, "Y");
INSERT INTO title VALUES("Tourism Mobile Services", " - ", "To search the information and view the map", " - View Map \r\n - Search Tourism spot information", "softDev", "SED01", "Java IDE", "PDA or mobile devices", " Java, Servelt", "AC060114", "Pending", "200820092", "6", "4298", NULL, "Y");
INSERT INTO title VALUES("Web-Based Diet Advisory", "Obesity", "Weight Loss Program", "Information Food Nutrition", "softDev", "SED01", " ASP.NET", " Laptop", " ASP.NET", "AC060218", "Full Approval", "200820092", "7", "4724", "", "Y");
INSERT INTO title VALUES("Sistem Pengesanan Kehadiran Pelajar Dengan Menggunakan Teknologi Kod Bar", "Attendance was important for UTM student.", "To trace student attendance effectively", "For FSKSM", "softDev", "SED01", "Microsoft Visual Studio 2008", "Barcode reader", "ASP Dot Net", "AC060253", "Pending", "200820092", "8", "4724", NULL, "Y");
INSERT INTO title VALUES("Pembangunan sistem migrasi pangkalan data antara sistem pengurusan latihan praktik dan sistem penilaian latihan praktik", "dua pangkalan data yang tidak bersandar dapat mengambil data dari kedua-dua pangkalan data", "kajian perisian yang sedia ada.\r\nmembangunkan sistem migrasi pangkalan data", "antara sistem pengurusan latihan praktik, ITMS dan\r\nsistem penilaian latihan praktik", "softDev", "SED01", "php and mysql", " laptop and printer", " -", "AC060120", "Pending", "200820092", "9", "4724", NULL, "Y");
INSERT INTO title VALUES("Sistem Automasi Rantaian Bekalan menggunakan Web Services", "Sistem rantaian bekalan di restoran secara manual mengambil masa yang panjang lagi membazir kos.", "Menghasilkan satu sistem rantaian bekalan yang automasi yang menghubungkan pihak restoran dan pembekal.", "Digunakan untuk proses perbandingan harga dan pembelian bahan mentah untuk pihak restoran.", "softDev", "SED01", "Microsoft Visual Studio 2008\r\nMySQL", "Computer with RAM more than 1GB", "ASP.NET", "BC070108", "Pending", "200820092", "10", "4724", NULL, "Y");
INSERT INTO title VALUES("Sistem Pemesanan dan Pengurasan Farmasi Berasaskan Web dan teknologi SMS", "Ordering pharmacy product via online.", "For user orders and admin to configure adn maintain the data.", "Purchase pharmacy order through web application.", "softDev", "SED01", "  NetBean IDE 6.1", " GSM Modem", " SMS", "AC060295", "Pending", "200820092", "11", "10054", NULL, "Y");
INSERT INTO title VALUES("Genetic Algorithm Based Heuristic For Workforce Scheduling", "Workforce scheduling is a very complex task and time consuming task. Many constraint and requirement need to be fulfilled in order to generate a schedule with zero penalty.", "i) To analyze genetic algorithm in order to generate workforce schedule.\r\nii) To implement genetic algorithm to produce a schedule with zero penalty", "Two benchmark dataset problem is used as the problem to be solved. Only hard constraint will be considered.", "research", "SED02", " Netbean   ", " Laptop", "  Genetic Algorithm", "AC060238", "Pending", "200820092", "12", "10054", NULL, "Y");
INSERT INTO title VALUES("fefe", "fefef", "fefefefe", "efefefe", "softDev", "SED01", " fefefefef ", " fefefefef", " fefef", "AC060122", "Pending", "200820092", "13", NULL, NULL, "Y");


#
# Table structure for table 'users_login'
#

CREATE TABLE IF NOT EXISTS users_login (
  psw varchar(50) NOT NULL DEFAULT '' ,
  userID varchar(20) NOT NULL DEFAULT '' ,
  usertype int(11) ,
  PRIMARY KEY (userID)
);



#
# Dumping data for table 'users_login'
#

INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "10054", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "1234", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "1898", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "2135", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "2157", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "4298", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "4724", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "5160", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "5809", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "6749", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "6838", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "7019", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "7331", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "7351", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "7352", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "AC060106", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "AC060114", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "AC060117", "1");
INSERT INTO users_login VALUES("*A4B6157319038724E3560894F7F932C8886EBFCF", "AC060120", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "AC060122", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "AC060169", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "AC060218", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "AC060237", "1");
INSERT INTO users_login VALUES("*A4B6157319038724E3560894F7F932C8886EBFCF", "AC060238", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "AC060253", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "AC060286", "1");
INSERT INTO users_login VALUES("*23AE809DDACAF96AF0FD78ED04B6A265E05AA257", "AC060295", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "AC073112", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "admin", "3");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "BC070095", "1");
INSERT INTO users_login VALUES("*E56A114692FE0DE073F9A1DD68A00EEB9703F3F1", "BC070108", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "S008", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "S009", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "S010", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "S011", "2");
