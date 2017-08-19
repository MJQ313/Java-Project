-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.10-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema mjq
--

CREATE DATABASE IF NOT EXISTS mjq;
USE mjq;

--
-- Definition of table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `Cust_name` varchar(50) DEFAULT NULL,
  `accno` varchar(50) NOT NULL,
  `Balance` int(11) DEFAULT NULL,
  `Acc_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`accno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`Cust_name`,`accno`,`Balance`,`Acc_type`) VALUES 
 ('Fidyan','100',300000,'saving'),
 ('Arshad','101',4000,'current'),
 ('Rizwan','102',23000,'saving'),
 ('Affan','103',45300,'fixed'),
 ('Taufik','104',568400,'current'),
 ('javed','121',250000,'current'),
 ('Junaid','313',500000,'fixed'),
 ('Aamir','561',889944,'Saving'),
 ('Zayan','786',500000,'saving');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


--
-- Definition of table `account1`
--

DROP TABLE IF EXISTS `account1`;
CREATE TABLE `account1` (
  `Accno` varchar(50) DEFAULT NULL,
  `Balance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account1`
--

/*!40000 ALTER TABLE `account1` DISABLE KEYS */;
INSERT INTO `account1` (`Accno`,`Balance`) VALUES 
 ('456',45667),
 ('456',4561);
/*!40000 ALTER TABLE `account1` ENABLE KEYS */;


--
-- Definition of table `account2`
--

DROP TABLE IF EXISTS `account2`;
CREATE TABLE `account2` (
  `Accno` varchar(50) DEFAULT NULL,
  `Balance` int(11) DEFAULT NULL,
  `Cust_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account2`
--

/*!40000 ALTER TABLE `account2` DISABLE KEYS */;
INSERT INTO `account2` (`Accno`,`Balance`,`Cust_name`) VALUES 
 ('123',4567,'Junaid');
/*!40000 ALTER TABLE `account2` ENABLE KEYS */;


--
-- Definition of table `acctrans`
--

DROP TABLE IF EXISTS `acctrans`;
CREATE TABLE `acctrans` (
  `accno` int(11) DEFAULT NULL,
  `trtype` varchar(10) DEFAULT NULL,
  `trdate` datetime NOT NULL,
  `amt` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acctrans`
--

/*!40000 ALTER TABLE `acctrans` DISABLE KEYS */;
INSERT INTO `acctrans` (`accno`,`trtype`,`trdate`,`amt`) VALUES 
 (101,'deposit','2017-02-26 15:10:35',2000);
/*!40000 ALTER TABLE `acctrans` ENABLE KEYS */;


--
-- Definition of trigger `transection`
--

DROP TRIGGER /*!50030 IF EXISTS */ `transection`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `transection` AFTER INSERT ON `acctrans` FOR EACH ROW begin
if new.trtype='deposit' then
update account set balance=balance+new.amt where
account.accno=new.accno;
end if;
if new.trtype='withdraw'
then
update account set balance=balance-new.amt
where
account.accno=new.accno;
end if;
END $$

DELIMITER ;

--
-- Definition of table `addm`
--

DROP TABLE IF EXISTS `addm`;
CREATE TABLE `addm` (
  `title` varchar(255) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `discription` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addm`
--

/*!40000 ALTER TABLE `addm` DISABLE KEYS */;
INSERT INTO `addm` (`title`,`price`,`discription`) VALUES 
 ('Blade','52','abvhjgjkjgzjkhkjxhil');
/*!40000 ALTER TABLE `addm` ENABLE KEYS */;


--
-- Definition of table `card`
--

DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `noc` varchar(255) DEFAULT NULL,
  `cno` varchar(255) DEFAULT NULL,
  `exdt` varchar(255) DEFAULT NULL,
  `sc` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `card`
--

/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` (`noc`,`cno`,`exdt`,`sc`,`zip`) VALUES 
 ('Mohammad Junaid','1122334455667788','09/40','786','444601'),
 ('Aamir Nabeel','1122334455669999','08/31','796','444602'),
 ('Karan Chauhan','6628334455669999','05/38','666','444603');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;


--
-- Definition of table `catagories`
--

DROP TABLE IF EXISTS `catagories`;
CREATE TABLE `catagories` (
  `ID` varchar(20) NOT NULL,
  `cat_id` varchar(30) NOT NULL,
  `popular` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `discription` varchar(5000) NOT NULL,
  `price` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catagories`
--

/*!40000 ALTER TABLE `catagories` DISABLE KEYS */;
INSERT INTO `catagories` (`ID`,`cat_id`,`popular`,`title`,`discription`,`price`) VALUES 
 ('1','Ac','Y','Dangal','Dangal (English: Wrestling competition) is a 2016 Indian Hindi-language biographical sports drama film directed by Nitesh Tiwari. It stars Aamir Khan as Mahavir Singh Phogat,','500'),
 ('10','Cd','N','Housefull','Housefull is a 2010 Indian comedy film directed by Sajid Khan, starring Akshay Kumar and Deepika Padukone in the lead roles. Arjun Rampal, Ritesh Deshmukh, Lara Dutta, Jiah Khan and Boman Irani are featured in supporting roles, whilst Malaika Arora Khan and Jacqueline Fernandez make special appearances. This would be Jiah Khan\'s final film before her death in 2013. The film was shot over several months in London and Italy. Produced by Sajid Nadiadwala, the film released at more than 750 theatres on 30 April 2010 in India.[3] It received negative reviews upon release, but was nonetheless a success at the box office. It is the first installment of the Housefull film series.','350'),
 ('11','Cd','N','Golmaal 3','Golmaal 3 is a 2010 Bollywood action comedy film directed by Rohit Shetty and the sequel to the 2008 film Golmaal Returns and the third film in the Golmaal series.[4] The film stars most of the actors from the previous films, including Ajay Devgan, Kareena Kapoor, Arshad Warsi, Tusshar Kapoor and Shreyas Talpade. New additions to the cast include actors Mithun Chakraborty and Kunal Khemu.[5] Principal photography for the film began in March 2010 in Mumbai, Goa and Hyderabad.[5] It was reportedly inspired by Basu Chatterjee\'s Khatta Meetha (1978) (which itself was based on the 1968 movie Yours, Mine and Ours ) wherein Ashok Kumar and Pearl Padamsee played an old couple marrying with children from their previous marriages, and film\'s rights were later bought over.[6][7]\r\n\r\nGolmaal 3 was released on 5 November 2010. In 2014, a Telugu feature film Pandavulu Pandavulu Tummada is a remake of Golmaal with top actors like Mohan Babu, Manchu Vishnu, Manchu Manoj, Varun Sandesh, Raveena Tandon.[8]','450'),
 ('12','Cd','N','Housefull','Housefull is a 2010 Indian comedy film directed by Sajid Khan, starring Akshay Kumar and Deepika Padukone in the lead roles. Arjun Rampal, Ritesh Deshmukh, Lara Dutta, Jiah Khan and Boman Irani are featured in supporting roles, whilst Malaika Arora Khan and Jacqueline Fernandez make special appearances. This would be Jiah Khan\'s final film before her death in 2013. The film was shot over several months in London and Italy. Produced by Sajid Nadiadwala, the film released at more than 750 theatres on 30 April 2010 in India.[3] It received negative reviews upon release, but was nonetheless a success at the box office. It is the first installment of the Housefull film series','450'),
 ('13','An','N','Zootopia','Zootopia (also known as Zootropolis in some regions) is a 2016 American 3D computer-animated buddy comedy-adventure film[6] produced by Walt Disney Animation Studios and released by Walt Disney Pictures. It is the 55th Disney animated feature film. The film was directed by Byron Howard and Rich Moore, co-directed by Jared Bush, and stars the voices of Ginnifer Goodwin, Jason Bateman, Idris Elba, Jenny Slate, Nate Torrence, Bonnie Hunt, Don Lake, Tommy Chong, J. K. Simmons, Octavia Spencer, Alan Tudyk, and Shakira. The film details the unlikely partnership between a rabbit police officer and a red fox con artist as they uncover a conspiracy involving the disappearance of savage predator inhabitants of a mammalian metropolis','550'),
 ('14','An','N','Finding Dory','Finding Dory is a 2016 American 3D computer-animated comedy-drama adventure film produced by Pixar Animation Studios and released by Walt Disney Pictures. Directed by Andrew Stanton with co-direction by Angus MacLane,[5][6] the screenplay was written by Stanton and Victoria Strouse.[7] The film is a sequel/spinoff[8][9] to 2003\'s Finding Nemo and features the returning voices of Ellen DeGeneres and Albert Brooks, with Hayden Rolence (replacing Alexander Gould), Ed O\'Neill, Kaitlin Olson, Ty Burrell, Diane Keaton and Eugene Levy joining the cast. Finding Dory focuses on the amnesiac fish Dory, who journeys to be reunited with her parents.[10]\r\n\r\nThe film premiered at the El Capitan Theatre in Los Angeles on June 8, 2016, and was released in the United States on June 17, 2016.[11] Upon release, the film was a critical and commercial success, grossing over $1 billion worldwide, becoming the second Pixar film to cross this mark after 2010\'s Toy Story 3. The film set numerous records, including the highest-grossing animated film opening of all \r\n','400'),
 ('15','An','N','Moana ','Moana (/mo????n?/) is a 2016 American computer-animated family film produced by Walt Disney Animation Studios and released by Walt Disney Pictures. It is the 56th Disney animated feature film. Directed by Ron Clements and John Musker, co-directed by Don Hall and Chris Williams, the film introduces Auli\'i Cravalho as Moana and features the voices of Dwayne Johnson, Rachel House, Temuera Morrison, Jemaine Clement, Nicole Scherzinger, and Alan Tudyk. The film features music written by Lin-Manuel Miranda, Opetaia Foa\'i, and Mark Mancina.\r\n\r\nThe film tells the story of Moana, the strong-willed daughter of the chief of a Polynesian tribe, who is chosen by the ocean itself to reunite a mystical relic with a goddess. When a blight strikes her island, Moana sets sail in search of Maui, a legendary demigod, in the hope of saving her people.\r\n','500'),
 ('16','An','Y','The Secret Life of Pets','The Secret Life of Pets is a 2016 American computer-animated film produced by Illumination Entertainment. It is directed by Chris Renaud and co-directed by Yarrow Cheney and written by Brian Lynch, Cinco Paul and Ken Daurio.[5][2] The film stars Louis C.K., Eric Stonestreet, Kevin Hart, Steve Coogan in a dual role, Ellie Kemper, Bobby Moynihan, Lake Bell, Dana Carvey, Hannibal Buress, Jenny Slate, and Albert Brooks.\r\n\r\nThe Secret Life of Pets premiered at the Annecy International Animated Film Festival on June 16, 2016, and was released in theaters in the United States on July 8, 2016, by Universal Pictures. Upon release, it received positive reviews and grossed $875 million worldwide, becoming the highest-grossing original animated film not produced by Disney or Pixar,[6] and the sixth highest-grossing film of 2016.\r\n','700'),
 ('17','An','N','Kubo and the Two Strings','Kubo and the Two Strings is a 2016 American 3D stop-motion fantasy action-adventure film directed and co-produced by Travis Knight (in his directorial debut), and written by Marc Haimes and Chris Butler. It stars the voices of Charlize Theron, Art Parkinson, Ralph Fiennes, Rooney Mara, George Takei, and Matthew McConaughey. It is Laika\'s fourth feature film produced. The film revolves around Kubo, who wields a magical shamisen and whose left eye was stolen. Accompanied by an anthropomorphic snow monkey and beetle, he must subdue his mother\'s corrupted sisters and his power-hungry grandfather Raiden (aka, the Moon King), who stole his left eye.\r\n\r\nKubo premiered at Melbourne International Film Festival and was released by Focus Features in the United States on August 19 to universal critical acclaim and has grossed $74 million worldwide against a budget of $60 million. The film won the BAFTA for Best Animated Film and was nominated for the Academy Award for Best Animated Feature Film and Best Visual Effects, becoming the second animated film to be nominated in the latter category following The Nightmare Before Christmas (1993).\r\n','550'),
 ('18','An','N','Sausage Party','Sausage Party is a 2016 American adult computer-animated comedy film directed by Greg Tiernan and Conrad Vernon and written by Kyle Hunter, Ariel Shaffir, Seth Rogen and Evan Goldberg. It stars the voices of Seth Rogen, Kristen Wiig, Jonah Hill, Bill Hader, Michael Cera, James Franco, Danny McBride, Craig Robinson, Paul Rudd, Nick Kroll, David Krumholtz, Edward Norton, and Salma Hayek. It is the first CGI-animated film to be rated R by the MPAA.[7][8][9]\r\n\r\nA spoof of Disney and Pixar films,[10] it follows a sausage who tries to discover the truth about his existence and goes on a journey with his friends to escape their fate. The film\'s rough cut premiered on March 14, 2016 at South by Southwest and the film was theatrically released in the United States on August 12, 2016 by Columbia Pictures.[11] The film received positive reviews from critics and grossed more than $140 million.\r\n','400'),
 ('19','Rm','N','Bridget Jones\'s Baby','Bridget Jones\'s Baby is a 2016 romantic comedy film directed by Sharon Maguire and written by Helen Fielding, Dan Mazer and Emma Thompson, based on the fictional columns by Fielding. It is the third film in the franchise and a sequel to 2004 film Bridget Jones: The Edge of Reason. The film stars Renée Zellweger as Bridget Jones, who after becoming pregnant is unsure if Mark Darcy (Colin Firth, also reprising his role) or Jack Qwant (Patrick Dempsey) is the father.[3]\r\n\r\nFilming began on 2 October 2015 in London, England. The film was released theatrically on 16 September 2016 in the United Kingdom and United States and on 5 October in France. It received generally positive reviews and has grossed over $211 million worldwide\r\n','650'),
 ('2','Ac','Y','Raees','Raees (English: Wealthy) is a 2017 Indian action crime thriller film directed by Rahul Dholakia and produced by Gauri Khan, Ritesh Sidhwani and Farhan Akhtar under their banners Red Chillies Entertainment and Excel Entertainment.[5] It stars Shah Rukh Khan, Mahira Khan and Nawazuddin Siddiqui.[6][7][8]\r\n\r\nRaees was said to be based on criminal Abdul Latif\'s life[9][10][11] but, the filmmakers denied this, saying \"The story of the film is a pure work of fiction, not based on any person; living or dead.\"[12][13] The film was released on 25 January 2017.','650'),
 ('20','Rm','N','La La Land ','La La Land is a 2016 American musical romantic drama film written and directed by Damien Chazelle, and starring Ryan Gosling and Emma Stone as a musician and an aspiring actress who meet and fall in love in Los Angeles. The film\'s title refers both to the city of Los Angeles and to the idiom for being out of touch with reality.\r\n\r\nChazelle wrote the screenplay in 2010 but did not find a studio willing to finance the production without changes to his design. Following the success of his 2014 film Whiplash, the project was picked up by Summit Entertainment. La La Land was premiered at the Venice Film Festival on August 31, 2016, and was released in the United States on December 9, 2016. It has grossed $436 million worldwide on a production budget of $30 million.[a]\r\n\r\nLa La Land received critical acclaim and was regarded as one of the best films of 2016. Critics praised Chazelle\'s screenplay and direction, Gosling and Stone\'s performances, Justin Hurwitz\'s score and the film\'s musical numbers. It won in every category it was nominated for at the 74th Golden Globe Awards, with a record-breaking seven wins, and received 11 nominations at the 70th British Academy Film Awards, winning five. It received 14 nominations at the 89th Academy Awards, tying the record for most nominations with Titanic (1997) and All About Eve (1950), and won the awards for Best Director, Best Actress (Stone), Best Cinematography, Best Original Score, Best Original Song (\"City of Stars\") and Best Production Design\r\n','500'),
 ('21','Rm','N','Befikre','Befikre (English: Carefree) is a 2016 Indian romantic-comedy drama film written, directed, and produced by Aditya Chopra under his Yash Raj Films banner. It features Ranveer Singh and Vaani Kapoor in the lead roles.[3][4] The film was shot over a period of 50 days in Paris and Mumbai.[5] It released worldwide on 9 December 2016 to mixed to negative reviews.\r\n\r\nThe film\'s songs has been composed by Vishal-Shekhar and produced by Mikey McCleary.[6] McCleary also composed the background score of the movie.\r\n','350'),
 ('22','Rm','Y','Ae Dil Hai Mushkil','Ae Dil Hai Mushkil (English: This Heart is Complicated) is a 2016 Indian romantic drama film written and directed by Karan Johar. It features Aishwarya Rai Bachchan, Ranbir Kapoor and Anushka Sharma in lead roles. It was released on 28 October 2016 on the Diwali weekend.','700'),
 ('23','Rm','N','Kapoor & Sons','Kapoor & Sons, also known as Kapoor & Sons (Since 1921), is an Indian Hindi-language comedy-drama film directed by Shakun Batra and produced by Karan Johar, Hiroo Yash Johar, and Apoorva Mehta under the banners of Dharma Productions and Fox Star Studios.[4] The film stars an ensemble cast featuring Rishi Kapoor, Ratna Pathak, Rajat Kapoor, Fawad Khan, Sidharth Malhotra and Alia Bhatt.[5][6] Kapoor & Sons tells the story of two estranged brothers who return to their dysfunctional family after their grandfather suffers a cardiac arrest.\r\n\r\nThe film was released worldwide on 18 March 2016 and received critical acclaim mainly for its direction and performances, especially of Fawad Khan, Rishi Kapoor and Ratna Pathak Shah.[7] Made on a budget of ?35 crore (US$5.2 million), the film earned over ?152 crore (US$23 million) worldwide. At the 62nd Filmfare Awards, Kapoor & Sons won five awards, including Best Supporting Actor (Rishi Kapoor), Best Story and Best Screenplay.[8] It also was nominated for Best Film.\r\n','500'),
 ('24','Rm','N','Ki & Ka','Ki & Ka (English: She and He) is a 2016 Indian romantic drama film written, directed, and produced by R. Balki. The film follows a young, married couple contradicting the gender roles placed upon women and men in Indian society. It stars Kareena Kapoor and Arjun Kapoor.[3][4][5][6]\r\n\r\nThe film released worldwide on 1 April 2016. Made on a budget of ?200 million (US$3.0 million) the film has earned over ?1.02 billion (US$15 million) worldwide.\r\n','550'),
 ('3','Ac','N','Don 2','Don 2 (also known as Don: The King Is Back) is a 2011 Indian action thriller film co-written and directed by Farhan Akhtar. It is the second installment of the Don series. The film was produced by Excel and Red Chillies Entertainment. The film stars Shah Rukh Khan, Priyanka Chopra, Lara Dutta, Om Puri, Boman Irani and Kunal Kapoor. A sequel to Don (2006), the film picks up five years after the previous film: The titular chracter, now the leader of the Asian underworld, plans to take over the European drug cartel. Meanwhile, Roma has joined the Interpol with a mission to hunt him down.\r\n\r\nAfter the success of the first film, a sequel was immediately planned. However, several delays caused the film to be pushed ahead. The film was officially announced in early 2010, with filming scheduled to begin in later that year. Akhtar revealed that the reasons for the delay was the selection of the right script. Two fans of the film, Ameet Mehta and Amrish Shah approached Akhtar with a storyline and later he co-wrote the film with them. Principal photography took place in Berlin, where it was shot extensively. Shankar-Ehsaan-Loy returned to compose the soundtrack of the film.','400'),
 ('4','Ac','N','Shivaay','Shivaay is a 2016 Indian action thriller film directed and produced by Ajay Devgan under his banner Ajay Devgn FFilms. It features Ajay Devgn, Sayyeshaa Saigal, and Erika Kaar in lead roles. Mithoon has composed the film\'s score and soundtrack.[4] British band The Vamps and composer Jasleen Royal are also a part of the music.[5] The film revolves around a skilled mountaineer who turns into a destroyer when his daughter gets kidnapped by flesh traders and he is left helpless.\r\n\r\nShivaay was released on 28 October 2016 on the Diwali weekend.[1] The film ran for more than 50 days at the Box Office.[6][7][8][9] The film also won the 64th National Film Award for best visual effects in 2017','450'),
 ('5','Ac','Y','Avengers age of Ultron','Avengers: Age of Ultron is a 2015 American superhero film based on the Marvel Comics superhero team the Avengers, produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures. It is the sequel to 2012\'s The Avengers and the eleventh film in the Marvel Cinematic Universe (MCU). The film was written and directed by Joss Whedon and features an ensemble cast that includes Robert Downey Jr., Chris Hemsworth, Mark Ruffalo, Chris Evans, Scarlett Johansson, Jeremy Renner, Don Cheadle, Aaron Taylor-Johnson, Elizabeth Olsen, Paul Bettany, Cobie Smulders, Anthony Mackie, Hayley Atwell, Idris Elba, Stellan Skarsgård, James Spader, and Samuel L. Jackson. In Avengers: Age of Ultron, the Avengers fight Ultron, an artificial intelligence obsessed with causing human extinction.\r\n\r\nThe sequel was announced in May 2012, after the successful release of The Avengers. Whedon, the director of the first film, was brought back on board in August and a release date was set. By April 2013, Whedon had completed a draft of the script, and casting began in June with the re-signing of Downey. Second unit filming began in February 2014 in South Africa with principal photography taking place between March and August 2014. The film was primarily shot at Shepperton Studios in Surrey, England, with additional footage filmed in Italy, South Korea, Bangladesh, New York City, and various locations around England. While in post production, the film was converted to 3D and over 3,000 visual effects shots were added.','700'),
 ('6','Ac','Y','Iron Man 3','Marvel\'s \"Iron Man 3\" pits brash-but-brilliant industrialist Tony Stark/Iron Man against an enemy whose reach knows no bounds. When Stark finds his personal world destroyed at his enemy\'s hands, he embarks on a harrowing quest to find those responsible. This journey, at every turn, will test his mettle. With his back against the wall, Stark is left to survive by his own devices, relying on his ingenuity and instincts to protect those closest to him. As he fights his way back, Stark discovers the answer to the question that has secretly haunted him: does the man make the suit or does the suit make the man?','650'),
 ('7','Cd','Y','Hera Pheri','Hera Pheri is a 2000 Indian comedy film directed by Priyadarshan starring Akshay Kumar, Paresh Rawal, Sunil Shetty and Tabu.[1] It is a remake of the 1989 Malayalam film Ramji Rao Speaking. The film spawned a sequel, Phir Hera Pheri, released in 2006. Hera Pheri 3 will succeed Phir Hera Pheri and is in pre-production.[2]\r\n\r\nOver the years it has become a cult classic.[3] It was voted as the best Bollywood comedy film of all time in an online poll conducted by The Indian Express.[4] Paresh Rawal won the best comedian award in Filmfare, IIFA and Star Screen Awards.','450'),
 ('8','Cd','N','Golmaal Returns','Golmaal Returns is a 2008 Bollywood comedy drama film directed by Rohit Shetty. The film is a sequel to the 2006 film, Golmaal: Fun Unlimited with Ajay Devgn, Tusshar Kapoor and Arshad Warsi reprising their roles, whilst Shreyas Talpade replaced the role originally played by Sharman Joshi. The film also features Kareena Kapoor, Amrita Arora and Celina Jaitley in supporting roles.\r\n\r\nThe film is remake of 1989 marathi film Pheka Pheki starring Ashok Saraf and Laxmikant Berde. Where the role of Ashok Saraf is played by Ajay Devgn and the role of Laxmikant Berde is played by Shreyas Talpade in this film. The film\'s storyline also meets that one of 1973 film, Aaj Ki Taaza Khabar.\r\n\r\nProduced by Dhillin Mehta under Shree Ashtavinayak Cine Vision LTD, the film released on 29 October 2008 and received mixed response from critics. However, managed to do very well at the box office.','500'),
 ('9','Cd','Y','3 Idiots','3 Idiots is a 2009 Indian coming of age comedy-drama film co-written, edited, and directed by Rajkumar Hirani and produced by Vidhu Vinod Chopra. Abhijat Joshi wrote the screenplay. It was inspired by the novel Five Point Someone by Chetan Bhagat.[4] The film stars Aamir Khan, Kareena Kapoor, R. Madhavan, Sharman Joshi, Omi Vaidya, Parikshit Sahni and Boman Irani.\r\n\r\nUpon release, the film was the highest-grossing film in its opening weekend in India and had the highest opening day collections for an Indian film up until that point. It also held the record for the highest net collections in the first week for a Bollywood film','550');
/*!40000 ALTER TABLE `catagories` ENABLE KEYS */;


--
-- Definition of table `cust`
--

DROP TABLE IF EXISTS `cust`;
CREATE TABLE `cust` (
  `SNo` int(11) NOT NULL,
  `Nm` varchar(20) DEFAULT NULL,
  `ID` int(11) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Sal` int(11) DEFAULT NULL,
  PRIMARY KEY (`SNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cust`
--

/*!40000 ALTER TABLE `cust` DISABLE KEYS */;
INSERT INTO `cust` (`SNo`,`Nm`,`ID`,`City`,`Sal`) VALUES 
 (1,'Vinay',111,'Delhi',50000),
 (2,'Ranganathan',222,'Noida',15000),
 (3,'Gaurav',333,'Chennai',15000),
 (4,'Vinay',444,'Gujrat',20000),
 (5,'Puneet',555,'Bangalore',30000),
 (6,'Kamal',666,'Kashmir',15000),
 (7,'Abhijeet',777,'Haryana',15000),
 (8,'Rajesh',888,'Chandigarh',20000);
/*!40000 ALTER TABLE `cust` ENABLE KEYS */;


--
-- Definition of table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `custno` int(11) NOT NULL AUTO_INCREMENT,
  `custnm` varchar(30) DEFAULT NULL,
  `prodid` varchar(5) DEFAULT NULL,
  `paymode` varchar(30) DEFAULT 'online transfer',
  PRIMARY KEY (`custno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`custno`,`custnm`,`prodid`,`paymode`) VALUES 
 (1,'Boris Becker','ml650','online transfer'),
 (2,'Amir Khan','hp419','online transfer'),
 (3,'Michael Schumacher','lt532','online transfer'),
 (4,'Arnold Schwarzenegger','hp419','online transfer'),
 (5,'Bear Grylls','lt532','online transfer'),
 (6,'Bill Gates','ms488','online transfer'),
 (7,'Lionel Messi','sg375','online transfer'),
 (8,'Ferdinand Porsche','ml650','online transfer'),
 (9,'Tom Cruise','ss210','online transfer'),
 (10,'Roger Federer','ml650','online transfer');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;


--
-- Definition of table `details`
--

DROP TABLE IF EXISTS `details`;
CREATE TABLE `details` (
  `title` varchar(50) NOT NULL,
  `price` varchar(45) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

/*!40000 ALTER TABLE `details` DISABLE KEYS */;
INSERT INTO `details` (`title`,`price`,`description`) VALUES 
 ('1920','49.10 dolars','Jaidev, a famous poet, meets a girl who has no recollection of her past. He brings her home and tries to help her. However, the woman is soon possessed by a spirit and things spiral out of control.'),
 ('Ae Dil Mushkil','51.13 dolars','Musician Ayan\'s quest for true love remains unfulfilled as Alizeh doesn\'t reciprocate his feelings. In his journey, he comes across different people who make him realise the power of unrequited love.'),
 ('Angry Birds','33.38 dolars','Red, Chuck and Bomb have always been the outcasts within a community of flightless birds on an island. But when mysterious green pigs intrude the island, it\'s up to them to figure out the reason.'),
 ('Baby Boss','57.99 dolars','A new baby\'s arrival impacts a family, \ntold from the point of view of a delightfully unreliable narrator -- a wildly imaginative 7-year-old \nnamed Tim. The most unusual Boss Baby (Alec Baldwin) arrives at Tim\'s home in a taxi, wearing a suit\n and carrying a briefcase. '),
 ('Badri ki Dulhaniya','45.67 dolars','A man (Varun Dhawan) and a woman (Alia Bhatt) fall in love despite their\n opposing views on gender and life in general.'),
 ('Bahubali2','67.20 dolars','Baahubali 2: The Conclusion is an upcoming Indian epic historical fiction film directed by S. S. Rajamouli. It is the continuation of Baahubali:'),
 ('Bhoot','48.15 dolars','When a married couple moves into a flat that is haunted by a spirit, a series of inexplicable experiences drive the wife to near madness. Now, the husband must protect his wife to save their marriage.'),
 ('Boyhood','45.13 dolars','After MJ\'s parents\' divorce, he and his sister Samantha live with their mother, whereas the father has visiting rights. Incidents that occur across a period of twelve years mould MJ\'s life.'),
 ('Captain America','65.35 dolars','Captain America is a fictional superhero appearing in American comic books published by Marvel Comics'),
 ('Conjuring 2','65.35 dolars','In 1977, paranormal investigators Ed (Patrick Wilson) and Lorraine Warren come out of a self-imposed sabbatical to travel to Enfield, a borough in north London. There, they meet Peggy Hodgson, an overwhelmed single mother of four who tells the couple that something evil is in her home'),
 ('Dangal','60.35 dolars','Former wrestler Mahavir \nSingh Phogat (Aamir Khan) trains young daughters Geeta (Fatima Sana Shaikh) and Babita\n (Sanya Malhotra) to follow in his footsteps and become world-class grapplers.'),
 ('Dhamal','58.03 dolars','Four slackers embark on a race to find a hidden treasure in Goa, little knowing that their plans will soon be foiled.'),
 ('Dhol','65.35 dolars','Four lazy friends want to make easy money and plan to get married to a rich girl. Their plan backfires after they get embroiled with a dangerous criminal.'),
 ('Dishoom','54.25 dolars','Two cops, Kabir and Junaid, go on a mission to rescue Viraj, a leading cricketer, who has been kidnapped by Wagah, a bookie, and his associate.'),
 ('Entertenment','44.67 dolars','Akhil, an underdog and a failure, comes to know that his real father is a rich diamond merchant who has just passed away. When he goes to retrieve his wealth, he learns that a dog has inherited it.'),
 ('Fan','55.40 dolars','Delhiite Gaurav is a big fan of Bollywood superstar Aryan Khanna, whose looks resemble his own. He sets off to Mumbai to meet him but is spurned by him, which is when Gaurav decides to ruin his life.'),
 ('Good Dinosaur','57.25 dolars','A rainstorm separates Arlo, a young Apatosaurus, from his family. While traveling through a harsh landscape, he befriends Spot, a feral human kid, who helps him reunite with his family.'),
 ('Half Ticket','61.42 dolars','Half Ticket is a 2016 Indian Marathi language film directed by Samit Kakkad and produced by Video Palace. The film is the story of two slum boy brothers and their absolute focus to get what they cannot dare dream '),
 ('Horror Story','34.98 dolars','A few friends come together to bid farewell to another friend who is going abroad for higher studies. They decide to spend the night in a haunted hotel, which turns out to be the biggest mistake ever.'),
 ('Houseful3','37.28 dolars','Batook, a rich businessman, doesn\'t want his three daughters to get married because of a superstitious belief. Now, their boyfriends must prove to Batook that they are perfect for his daughters.'),
 ('Kapoor & Sons','38.13 dolars','Brothers Arjun and Rahul return home to visit their ailing grandfather. Amidst numerous ongoing family problems, emotions get intensified when a girl causes a rift between the two.'),
 ('Kung Fu Panda','54.23 dolars','The Dragon Warrior, Po, has to deal with challenges galore when circumstances compel him to train a bunch of awkward pandas in martial arts so that they can trounce Kai, a wicked supernatural warrior.'),
 ('Lights Out','54.23 dolars','When Rebecca (Teresa Palmer) left home, she thought that her childhood fears were behind her. As a young girl growing up, she was never really sure of what was real when the lights went out at night. Now, her little brother Martin (Gabriel Bateman) is experiencing the same unexplained and terrifying events that jeopardized her safety and sanity. Holding a mysterious attachment to their mother (Maria Bello), a supernatural entity has returned with a vengeance to torment the entire family.'),
 ('M.S.Dhoni','55.15 dolars','Ranchi lad M S Dhoni aspires to play cricket for India. Though he initially tries to please his father by taking up a job with the Indian Railways, he ultimately decides to chase his dreams.'),
 ('Minions','51.40 dolars','Minions Kevin, Stuart and Bob decide to find a new master. They embark on a global trip and meet Scarlett Overkill, a female super-villain who recruits them and hatches a plan to take over the world.'),
 ('Mirzay','40.40 dolars','Monish and Suchitra, who are childhood sweethearts, get separated while growing up. Their romance is reignited when they meet as adults. However, a twist of fate separates them again.'),
 ('Moana','54.35 dolars','The epic journey continues for Moana fans as Walt Disney Animation Studios introduces an all-new sing-along version of the hit, critically-lauded comedy-adventure Moana. From Walt Disney Animation Studios comes Moana, a sweeping, CG-animated adventure about a spirited teenager who sails out on a daring mission to prove herself a master wayfinder and fulfill her ancestors\' unfinished quest.'),
 ('Natsamrat','64.25 dolars','After retirement, Ganpat Belwalkar, a Shakespearean actor, divides his property amongst his two children. However, their ungratefulness leaves Ganpat and his wife homeless during their old age.'),
 ('Pele','52.07 dolars','Under guidance from manager Vicente Feola (Vincent D\'Onofrio), young Pelé (Kevin de Paula) utilizes his street soccer skills to lead Brazil to the World Cup in 1958.'),
 ('Photocopy','41.67 dolars','The identical twins Madhu and Mala both unknowingly fall in love with Sameer Wankhede while he does not know he is actually dating two people'),
 ('Poster Girl','42.23 dolars','Poshter Girl takes you on a mad roller coaster ride of a quaint, little village in Maharashtra - Paragao-Tekawde, which is ill-famous for female infanticide and as a result there are no girls left within the village. When the question of boys\' marriage is on heat, a beautiful and Intelligent girl enters the scenario and changes everything. This is the story of the girl Rupali and her chosen 5 candidates who would do anything to win her heart.'),
 ('Raees','69.78 dolars','Threat looms over bootlegger Raees Alam and his business after ACP Majmudar decides to get better of him. In order to survive and keep his trade thriving, Raees must overcome him.'),
 ('Rogue One','54.23 dolars','Former scientist Galen Erso lives on a farm with his wife and young daughter Jyn. His peaceful existence comes crashing down when the evil Orson Krennic takes him away from his beloved family. Many years later, Galen is now the Empire\'s lead engineer for the most powerful weapon in the galaxy,'),
 ('Sairat','58.15 dolars','College friends Archi and Parshya, who have contrasting personalities and belong to different castes, fall in love. However, their relationship falls prey to the stringent practice of casteism.'),
 ('Sarrainodu','57.42 dolars','Gana, an ex-military man, beats up corrupt people who have escaped punishment from the law. When his ladylove promises to marry him if he gives up his violent ways, he is caught up in a fix'),
 ('Secret.L.P','49.67 dolars','Max (Louis C.K.) is a spoiled terrier who enjoys a comfortable life in a New York building until his owner adopts Duke, a giant and unruly canine. During their walk outside, they encounter a group of ferocious alley cats and wind up in a truck that\'s bound for the pound. Luckily, a rebellious bunny named Snowball swoops in to save the doggy duo from captivity. In exchange, Snowball demands that Max and Duke join his gang of abandoned pets on a mission against the humans who\'ve done them wrong.'),
 ('Shivaay','40.25 dolars','In order to unite her daughter with her mother, a young man travels to Bulgaria. However, things don\'t go as planned as soon something goes awry and he has to fight evil forces.'),
 ('Silence','43.18 dolars','Two 17th-century Portuguese missionaries, Father Sebastian Rodrigues (Andrew Garfield) and Father Francisco Garupe (Adam Driver), embark on a perilous journey to Japan to find their missing mentor (Liam Neeson). While there, the two men minister to the Christian villagers who worship in secret'),
 ('Suicide Squad','45.67 dolars','Figuring they\'re all expendable, a U.S. intelligence officer decides to assemble a team of dangerous, incarcerated supervillains for a top-secret mission. Now armed with government weapons, Deadshot (Will Smith), Harley Quinn (Margot Robbie), Captain Boomerang, Killer Croc and other despicable inma'),
 ('Sultan','63.38 dolars','After the death of his son, Sultan Ali Khan, a middle-aged wrestler, gives up the sport. However, years later, circumstances force him to revive his career and win back the respect of his loved ones.'),
 ('Tere bin Ladeen','53.15 dolars','Ali, a reporter, is frustrated after his US visa gets rejected repeatedly. He stumbles upon a lookalike of the dreaded Osama Bin Laden and releases a video on the internet, creating widespread havoc.'),
 ('The Pursuit','59.15 dolars','Chris Gardner takes up an unpaid internship in a brokerage firm after he loses his life\'s earnings selling a product he invested in. His wife leaves him and he is left with the custody of his son.'),
 ('The Pursuit of Happyness','59.15 dolars','Chris Gardner takes up an unpaid internship in a brokerage firm after he loses his life\'s earnings selling a product he invested in. His wife leaves him and he is left with the custody of his son.'),
 ('Time Pass','57.18 dolars','Dagdu and Prajakta fall in love with each other after some initial friction. However, their parents oppose the match and Prajakta\'s parents, in the quiet of the night, leave town with Prajakta in tow.'),
 ('Udta Punjab','52.35 dolars','A rock star, a migrant labourer, a doctor and a policeman find themselves struggling to cope with the ensuing chaos surrounding a drug crisis in Punjab, India.');
/*!40000 ALTER TABLE `details` ENABLE KEYS */;


--
-- Definition of table `disease_info`
--

DROP TABLE IF EXISTS `disease_info`;
CREATE TABLE `disease_info` (
  `d_id` int(3) NOT NULL,
  `d_name` text NOT NULL,
  `sym1` text NOT NULL,
  `sym2` text NOT NULL,
  `sym3` text NOT NULL,
  `med` text NOT NULL,
  `home_remedy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `disease_info`
--

/*!40000 ALTER TABLE `disease_info` DISABLE KEYS */;
INSERT INTO `disease_info` (`d_id`,`d_name`,`sym1`,`sym2`,`sym3`,`med`,`home_remedy`) VALUES 
 (1,'Headache','Pain occuring on both sides of head','Start from back of head and spreads forward','Shoulders, neck or jaw feel sore','Aspirin\r\n\r\nIbuprofen\r\n\r\nNaproxen','Gentle Massage'),
 (2,'Tonsilitis','Throat pain','Difficulty in swallowing','Fever\r\n','Cefadroxil\r\n\r\nCefixime\r\n\r\nParacetamol','Gargle with warm salty water several times a day'),
 (3,'Common Cold','Sneezing','Watery nose','Mucus draining from nose into throat','Loratadine\r\n\r\nNasal Spray\r\n\r\nAspirin','Drink hot liquids\r\n\r\nGargle with warm salty water\r\n'),
 (4,'Cough','Chills','Fever','Nausea','Decongestant\r\n\r\nNasal spray','Drink hot liquids\r\n\r\nUse humidifier'),
 (5,'Dizziness','Light Headedness','loss of balance','Feeling of floating','Meclizine\r\n\r\nDiazepam','Avoid sudden change in posture\r\n\r\n\r\n'),
 (6,'Abdominal pain','Bloating','Discomfort in abdomen','Dehydration','Loperamide\r\n\r\nRanitidine\r\n','Drink Lemon Juice\r\n\r\nDrink ginger tea'),
 (7,'Food Poisoning','Nausea','Vometting','Abdominal Pain','Loperamide\r\n\r\nBismuth subsalicylates','Drink ORS\r\n\r\nEat banana, rice.'),
 (8,'Ulcer','Painful sores inside mouth or on tongue','burning sensation','Round white sores','Corticosteroids\r\n\r\nOral tetracycline\r\n\r\nChlorhexidine mouth wash','avoid acidic food\r\n\r\neat balanced diet'),
 (9,'Nose Infection','Runny nose','watery eyes','Stuffy Nose','Antihistamine\r\n\r\nAspirin\r\n','use humidifier'),
 (10,'Back Pain','Difficulty in moving','Difficulty in sitting','Local soreness','NSAIDS\r\n\r\nPain killer\r\n','Massage'),
 (11,'Dehydration','Weakness','increased thirst/ dry mouth','Palpitations','ORS solution','Drink plenty of water'),
 (12,'Joint Pain','Pain with local swelling','Soreness','Stiffness','Benzodiazepines','Apply ice cube and massage the area.'),
 (13,'Muscle cramp','Sudden pain','hard lump of muscle tissue beneath skin','sharp pain','NSAIDs\r\n\r\nMuscle Relaxant','Stop any activity and try stretching and massaging of the muscle.'),
 (14,'Depression ','Feeling sad/empty','trouble with concentration','Gaining or losing of weight','Antidepressants','Yoga'),
 (15,'Fatigue','Frequent headaches','Loss of concentration','insomnia','Sleeping pills\r\n\r\nAntidepressants','Sleep enough and eat healthy, balanced diet'),
 (16,'Migrain','Severe Headache','sensitivity to sound/light','eye pain','Metoclopramide','Yoga'),
 (17,'Conjuctivitis','Redness in inner eyelid','itchy eyes','burning feeling in eyes','Eye drops','use damp cotton wool to wipe away discharge from eye'),
 (18,'Blurred vision','increased tear production','poor night vision','Discharge from  eye','Eye drops','Wear sunglasses to protect eyes');
/*!40000 ALTER TABLE `disease_info` ENABLE KEYS */;


--
-- Definition of table `pay`
--

DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay` (
  `noc` varchar(255) DEFAULT NULL,
  `cno` varchar(255) DEFAULT NULL,
  `exdt` varchar(255) DEFAULT NULL,
  `sc` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pay`
--

/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
INSERT INTO `pay` (`noc`,`cno`,`exdt`,`sc`,`zip`) VALUES 
 ('Mohammad Junaid','1122334455667788','09/40','786','444601'),
 ('karan chauhan','6628334455669999','05/38','666','444603'),
 ('Aamir Nabeel','1122334455669999','08/31','796','444602'),
 ('Mohammad Junaid','1122334455667788','09/40','786','444601');
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;


--
-- Definition of table `prod`
--

DROP TABLE IF EXISTS `prod`;
CREATE TABLE `prod` (
  `SNo` int(11) NOT NULL,
  `ProdNm` varchar(20) DEFAULT NULL,
  `ProdType` varchar(20) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  PRIMARY KEY (`SNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prod`
--

/*!40000 ALTER TABLE `prod` DISABLE KEYS */;
INSERT INTO `prod` (`SNo`,`ProdNm`,`ProdType`,`Price`) VALUES 
 (1,'Parrot','Bird',75),
 (2,'Horse','Animal',50),
 (3,'Vulture','Bird',60),
 (4,'Dog','Animal',30),
 (5,'Cat','Animal',35),
 (6,'Pigeon','Bird',40),
 (7,'Sparrow','Bird',40),
 (8,'Crow','Bird',35),
 (9,'Elephant','Animal',45),
 (10,'Lion','Animal',70);
/*!40000 ALTER TABLE `prod` ENABLE KEYS */;


--
-- Definition of table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `prodid` varchar(5) NOT NULL,
  `prodnm` varchar(50) DEFAULT NULL,
  `company` varchar(20) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`prodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`prodid`,`prodnm`,`company`,`price`) VALUES 
 ('bs251','2 Ton 5 star AC','blue star',47000),
 ('hp419','development laptop','HP',54600),
 ('ip627','iphone 6','apple',69100),
 ('lt532','Full HD LED TV','samsung',36500),
 ('ml650','lumia 650','microsoft',14900),
 ('ms488','Surface Pro4','microsoft',125000),
 ('ph618','5.1 home theatre','phillips',23200);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


--
-- Definition of table `user1`
--

DROP TABLE IF EXISTS `user1`;
CREATE TABLE `user1` (
  `USER_NAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user1`
--

/*!40000 ALTER TABLE `user1` DISABLE KEYS */;
/*!40000 ALTER TABLE `user1` ENABLE KEYS */;


--
-- Definition of table `user2`
--

DROP TABLE IF EXISTS `user2`;
CREATE TABLE `user2` (
  `USER_NAME` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `MOBILE_NO` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user2`
--

/*!40000 ALTER TABLE `user2` DISABLE KEYS */;
/*!40000 ALTER TABLE `user2` ENABLE KEYS */;


--
-- Definition of table `user3`
--

DROP TABLE IF EXISTS `user3`;
CREATE TABLE `user3` (
  `USER_NAME` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `MOBILE_NO` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user3`
--

/*!40000 ALTER TABLE `user3` DISABLE KEYS */;
/*!40000 ALTER TABLE `user3` ENABLE KEYS */;


--
-- Definition of table `user4`
--

DROP TABLE IF EXISTS `user4`;
CREATE TABLE `user4` (
  `name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `type` varchar(255) DEFAULT 'user',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user4`
--

/*!40000 ALTER TABLE `user4` DISABLE KEYS */;
INSERT INTO `user4` (`name`,`email`,`pass`,`dob`,`gender`,`phone`,`country`,`type`) VALUES 
 ('aaa','aaa@gmail.com','112233','123','Male','9011361','india',NULL),
 ('Aamir Nabeel','aamir@gmail.com','123456789','4dec95','Male','7769995262','India','user'),
 ('Junaid Qureshi','junaid@gmail.com','1122','23aug1997','Male','9011608809','India','user'),
 ('Karan','karan@gmail.com','112233','22jun95','Male','8899665544','India','user'),
 ('Arjun','karanchauhan@gmail.com','arjun123','22jun95','Male','646136498','INDIA','user'),
 ('Junaid','mjq313@gmail.com','23081997','23aug97','Male','9011608809','India','Admin'),
 ('sohef khan','sohef@live.com','123456','1jan1995','Male','7788881244','england','user');
/*!40000 ALTER TABLE `user4` ENABLE KEYS */;


--
-- Definition of table `userperosonal`
--

DROP TABLE IF EXISTS `userperosonal`;
CREATE TABLE `userperosonal` (
  `id` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `mob_no` varchar(50) DEFAULT NULL,
  `Emai_id` varchar(50) DEFAULT NULL,
  `S_Que` varchar(50) DEFAULT NULL,
  `S_ans` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userperosonal`
--

/*!40000 ALTER TABLE `userperosonal` DISABLE KEYS */;
/*!40000 ALTER TABLE `userperosonal` ENABLE KEYS */;


--
-- Definition of table `userpersonal`
--

DROP TABLE IF EXISTS `userpersonal`;
CREATE TABLE `userpersonal` (
  `id` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `mob_no` varchar(50) DEFAULT NULL,
  `Emai_id` varchar(50) DEFAULT NULL,
  `S_Que` varchar(50) DEFAULT NULL,
  `S_ans` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userpersonal`
--

/*!40000 ALTER TABLE `userpersonal` DISABLE KEYS */;
INSERT INTO `userpersonal` (`id`,`name`,`age`,`gender`,`city`,`mob_no`,`Emai_id`,`S_Que`,`S_ans`) VALUES 
 ('sfd','vxc',12,'Male','dsfc','111','dsff','what is your Birth place?','qsa'),
 ('aaa','AAA',20,NULL,'','','','what is your Birth place?','');
/*!40000 ALTER TABLE `userpersonal` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(50) DEFAULT NULL,
  `nm` varchar(50) DEFAULT NULL,
  `ps` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT 'Active',
  `u_type` varchar(50) DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`nm`,`ps`,`type`,`u_type`) VALUES 
 ('sfd','vxc','xcv','Active','User'),
 ('aaa','AAA','AAA','Active','User');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Definition of procedure `accbal`
--

DROP PROCEDURE IF EXISTS `accbal`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `accbal`()
BEGIN
SELECT Balance FROM account;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
