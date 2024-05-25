use netflix;

-- INSERT VALUES INTO TABLES
insert into customer 
values(1,'Rawabi','Albaqami','rawabi@gmail.com','Alqassab','Premium'),
(2, 'Eric','Clapton','ec@gmail.com',' United Kingdom','Premium'),
(3, 'Lina','Alfawzan','Lina@gmail.com','Alqassab','Basic'),
(4, 'Sho','Sakurai','ShoAra@gmail.com','Tokyo','Mobile'),
(5, 'Mark','Tuan','Mark7@gmail.com','Los Angeles','Premium'),
(6, 'Jinyoung','Park','jyp@gmail.com','Busan','Standard'),
(7, 'Reem','Alossaimi','reem@gmail.com','Alqassab','Premium'),
(8, 'Mohammad','Alanezi','MA@gmail.com','Kuwait','Standard'),
(9, 'Yaya','Alsadi','yoyo@gmail.com','Egypt','Standard'),
(10, 'Neda','Albaqami','nedaj@gmail.com','Alqassab','Basic');

insert into starred_by
values(10,1,'Golden Globe Award for Best Actor ',2008),
(10,2,'People\'s Choice Award for Favorite Movie ',2014),
(1,3,'Palme d\'Or',2022),
(7,4,'Baeksang Arts Award for Most Popular Actor',2023),
(2,5,'Asia Best Couple',2016),
(5, 6,'Teen Choice Award for Choice TV Actress',2010),
(10,7,'Honorary César',1999),
(9,8,'MTV Movie & TV Award for Best Fight',2006),
(1,9,'Golden Globe Award for Best Actor',1997),
(3,10,'MTV Movie Award for Best Breakthrough',1999);

insert into payment 
values(128793, '2019-05-12 16:05:55'),
(122293, '2018-11-01 06:45:01'),
(128234, '2020-01-30 04:16:40'),
(182793, '2020-05-25 09:38:33'),
(125553, '2019-12-04 22:13:14'),
(128893, '2018-11-02 00:09:35'),
(128444, '2022-02-28 02:02:00'),
(128443, '2019-05-22 01:45:59'),
(148793, '2023-04-15 13:25:02'),
(128743, '2023-01-21 23:05:11');

insert into stars 
values(1, 'Tom', 'Cruise'),
(2, 'Jong ki', 'Song'),
(3, 'Katie', 'Holmes'),
(4, 'Leonardo', 'DiCaprio'),
(5, 'Leighton', 'Meester'),
(6, 'Penn', 'Badgley'),
(7, 'Jinyoung', 'Park'),
(8, 'Brad', 'Pitt'),
(9, 'Angelina', 'Jolie'),
(10, 'Johnny', 'Depp');

insert into payment_method
values('Apple pay',128793),
('Credit cards',122293),
('Credit cards',128234),
('Apple pay',182793),
('Apple pay',125553),
('Apple pay',128893),
('Credit cards',128444),
('Credit cards', 128443),
('Apple pay', 148793),
('Credit cards', 128743);

-- CASCADE IMPLEMENTATION
CREATE TABLE IF NOT EXISTS `Netflix`.`Starred_by` (
  `Stars_Stars_id` INT NOT NULL,
  `Content_Content_id` INT NOT NULL,
  `Award_name` VARCHAR(45) NOT NULL,
  `Award_year` YEAR(4) NOT NULL,
  PRIMARY KEY (`Stars_Stars_id`, `Content_Content_id`),
  INDEX `fk_Stars_has_Content_Content1_idx` (`Content_Content_id` ASC) VISIBLE,
  INDEX `fk_Stars_has_Content_Stars1_idx` (`Stars_Stars_id` ASC) VISIBLE,
  CONSTRAINT `fk_Stars_has_Content_Stars1`
    FOREIGN KEY (`Stars_Stars_id`)
    REFERENCES `Netflix`.`Stars` (`Stars_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Stars_has_Content_Content1`
    FOREIGN KEY (`Content_Content_id`)
    REFERENCES `Netflix`.`Content` (`Content_id`)
    ON DELETE cascade
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

delete from starred_by where stars_stars_id=1;
drop table starred_by;

-- TRIGGER IMPLEMENTATION
create trigger package 
before insert 
ON 
subscription
for each row
set new.subscription_type=upper(new.subscription_type);

-- INDEX IMPLEMENTATION
CREATE TABLE IF NOT EXISTS `Netflix`.`Customer` (
  `Customer_id` INT NOT NULL AUTO_INCREMENT,
  `First_name` VARCHAR(45) NOT NULL,
  `Last_name` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Subscription_Subscription_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Customer_id`),
  INDEX `Subscription_Subscription_id_idx` (`Subscription_Subscription_id` ASC) VISIBLE,
  CONSTRAINT `Subscription_Subscription_id`
    FOREIGN KEY (`Subscription_Subscription_id`)
    REFERENCES `Netflix`.`Subscription` (`Subscription_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;