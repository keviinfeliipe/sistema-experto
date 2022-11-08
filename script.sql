DROP DATABASE movie;
CREATE DATABASE IF NOT EXISTS movie;
use movie;

drop table if exists movie;
create table movie (
id int auto_increment primary key,
movie_id int,
title varchar(255),
overview longtext,
poster_path varchar(255)
);


drop table if exists characteristic;
create table characteristic(
id int auto_increment primary key,
genre varchar(30)
);

drop table if exists movie_characteristic;
create table movie_characteristic(
id int auto_increment primary key,
characteristic_id int,
movie_id int
);

ALTER TABLE movie_characteristic
ADD FOREIGN KEY (characteristic_id) REFERENCES characteristic(id);

ALTER TABLE movie_characteristic
ADD FOREIGN KEY (movie_id) REFERENCES movie(id);

drop table if exists customer;
create table customer(
id int auto_increment primary key,
username varchar(255) unique
);

drop table if exists attention;
create table attention(
id int auto_increment primary key,
customer_id int,
created date
);

ALTER TABLE attention
ADD FOREIGN KEY (customer_id) REFERENCES customer(id);

drop table if exists ask;
create table ask(
id int auto_increment primary key,
ask varchar(255)
);

drop table if exists answer;
create table answer(
id int auto_increment primary key,
attention_id int,
ask_id int,
response varchar(10)
);

ALTER TABLE answer
ADD FOREIGN KEY (attention_id) REFERENCES attention(id);

ALTER TABLE answer
ADD FOREIGN KEY (ask_id) REFERENCES ask(id);

drop table if exists ask_navigate;
create table ask_navigate(
id int auto_increment primary key,
origin_ask_id int,
origin_response varchar(255),
next_ask int
);

ALTER TABLE ask_navigate
ADD FOREIGN KEY (ask_id) REFERENCES ask(id);

drop table if exists recommended_movie;
create table recommended_movie(
id int auto_increment primary key,
attention_id int,
movie_id int,
probability float
);

ALTER TABLE recommended_movie
ADD FOREIGN KEY (movie_id) REFERENCES movie(id);

ALTER TABLE recommended_movie
ADD FOREIGN KEY (attention_id) REFERENCES attention(id);

-- Agregar generos
insert into characteristic (genre) values ("action");
insert into characteristic (genre) values ("adventure");
insert into characteristic (genre) values ("animation");
insert into characteristic (genre) values ("comedy");
insert into characteristic (genre) values ("crime");
insert into characteristic (genre) values ("documentary");
insert into characteristic (genre) values ("drama");
insert into characteristic (genre) values ("family");
insert into characteristic (genre) values ("fantasy");
insert into characteristic (genre) values ("history");
insert into characteristic (genre) values ("horror");
insert into characteristic (genre) values ("music");
insert into characteristic (genre) values ("mystery");
insert into characteristic (genre) values ("romance");
insert into characteristic (genre) values ("fiction");
insert into characteristic (genre) values ("tv");
insert into characteristic (genre) values ("thriller");
insert into characteristic (genre) values ("war");
insert into characteristic (genre) values ("western");

-- Agregar preguntas
insert into ask (ask) values("animation");
insert into ask (ask) values("thriller");
insert into ask (ask) values("fantasy");
insert into ask (ask) values("adventure");
insert into ask (ask) values("horror");
insert into ask (ask) values("fiction");
insert into ask (ask) values("drama");
insert into ask (ask) values("fiction");
insert into ask (ask) values("action");
insert into ask (ask) values("music");
insert into ask (ask) values("comedy");
insert into ask (ask) values("fantasy");
insert into ask (ask) values("drama");
insert into ask (ask) values("crime");
insert into ask (ask) values("fiction");
insert into ask (ask) values("comedy");
insert into ask (ask) values("fiction");
insert into ask (ask) values("documentary");
insert into ask (ask) values("adventure");
insert into ask (ask) values("thriller");
insert into ask (ask) values("animation");
insert into ask (ask) values("fantasy");
insert into ask (ask) values("music");
insert into ask (ask) values("romance");
insert into ask (ask) values("fiction");
insert into ask (ask) values("adventure");
insert into ask (ask) values("music");
insert into ask (ask) values("music");


-- Agregar navegador de preguntas
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (1,"NO",2);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (1,"SI",3);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (2,"NO",4);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (2,"SI",5);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (3,"NO",6);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (4,"NO",7);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (4,"SI",8);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (5,"NO",9);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (6,"NO",10);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (7,"NO",11);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (8,"SI",12);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (9,"NO",13);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (10,"NO",14);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (11,"NO",15);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (12,"NO",16);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (13,"NO",17);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (14,"NO",18);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (15,"NO",19);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (16,"NO",20);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (17,"NO",21);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (18,"NO",22);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (19,"NO",23);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (20,"NO",24);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (21,"NO",25);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (25,"NO",26);
insert into ask_navigate (origin_ask_id, origin_response, next_ask) values (22,"NO",27);


-- Agregar peliculas
insert into movie (movie_id, title, overview, poster_path) values (436270,"Black Adam","Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods‚Äö√Ñ√Æand imprisoned just as quickly‚Äö√Ñ√ÆBlack Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.","https://image.tmdb.org/t/p/w500//3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg");
insert into movie (movie_id, title, overview, poster_path) values (619730,"Don't Worry Darling","Alice and Jack are lucky to be living in the idealized community of Victory, the experimental company town housing the men who work for the top-secret Victory Project and their families. But when cracks in their idyllic life begin to appear, exposing flashes of something much more sinister lurking beneath the attractive fa‚àö√üade, Alice can‚Äö√Ñ√¥t help questioning exactly what they‚Äö√Ñ√¥re doing in Victory, and why.","https://image.tmdb.org/t/p/w500//9BXYLjXtSipBp2GfAlsri4i8hPC.jpg");
insert into movie (movie_id, title, overview, poster_path) values (718930,"Bullet Train","Unlucky assassin Ladybug is determined to do his job peacefully after one too many gigs gone off the rails. Fate, however, may have other plans, as Ladybug's latest mission puts him on a collision course with lethal adversaries from around the globe‚Äö√Ñ√Æall with connected, yet conflicting, objectives‚Äö√Ñ√Æon the world's fastest train.","https://image.tmdb.org/t/p/w500//tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg");
insert into movie (movie_id, title, overview, poster_path) values (800939,"Ticket to Paradise","A divorced couple teams up and travels to Bali to stop their daughter from making the same mistake they think they made 25 years ago.","https://image.tmdb.org/t/p/w500//1tzERH50P5c2mFWtLbgixzLZS1L.jpg");
insert into movie (movie_id, title, overview, poster_path) values (634649,"Spider-Man: No Way Home","Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.","https://image.tmdb.org/t/p/w500//uJYYizSuA9Y3DCs0qS4qWvHfZg4.jpg");
insert into movie (movie_id, title, overview, poster_path) values (616037,"Thor: Love and Thunder","After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor Odinson enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher‚Äö√Ñ√¥s vengeance and stop him before it‚Äö√Ñ√¥s too late.","https://image.tmdb.org/t/p/w500//pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg");
insert into movie (movie_id, title, overview, poster_path) values (762504,"Nope","Residents in a lonely gulch of inland California bear witness to an uncanny, chilling discovery.","https://image.tmdb.org/t/p/w500//AcKVlWaNVVVFQwro3nLXqPljcYA.jpg");
insert into movie (movie_id, title, overview, poster_path) values (642885,"Hocus Pocus 2","It's been 29 years since someone lit the Black Flame Candle and resurrected the 17th-century sisters, and they are looking for revenge. Now it's up to three high-school students to stop the ravenous witches from wreaking a new kind of havoc on Salem before dawn on All Hallow's Eve.","https://image.tmdb.org/t/p/w500//7ze7YNmUaX81ufctGqt0AgHxRtL.jpg");
insert into movie (movie_id, title, overview, poster_path) values (882598,"Smile","After witnessing a bizarre, traumatic incident involving a patient, Dr. Rose Cotter starts experiencing frightening occurrences that she can't explain. As an overwhelming terror begins taking over her life, Rose must confront her troubling past in order to survive and escape her horrifying new reality.","https://image.tmdb.org/t/p/w500//aPqcQwu4VGEewPhagWNncDbJ9Xp.jpg");
insert into movie (movie_id, title, overview, poster_path) values (438148,"Minions: The Rise of Gru","A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.","https://image.tmdb.org/t/p/w500//wKiOkZTN9lUUUNZLmtnwubZYONg.jpg");
insert into movie (movie_id, title, overview, poster_path) values (760161,"Orphan: First Kill","After escaping from an Estonian psychiatric facility, Leena Klammer travels to America by impersonating Esther, the missing daughter of a wealthy family. But when her mask starts to slip, she is put against a mother who will protect her family from the murderous ‚Äö√Ñ√∫child‚Äö√Ñ√π at any cost.","https://image.tmdb.org/t/p/w500//pHkKbIRoCe7zIFvqan9LFSaQAde.jpg");
insert into movie (movie_id, title, overview, poster_path) values (507086,"Jurassic World Dominion","Four years after the destruction of Isla Nublar, Biosyn operatives attempt to track down Maisie Lockwood, while Dr Ellie Sattler investigates a genetically engineered swarm of giant insects.","https://image.tmdb.org/t/p/w500//kAVRgw7GgK1CfYEJq8ME6EvRIgU.jpg");
insert into movie (movie_id, title, overview, poster_path) values (453395,"Doctor Strange in the Multiverse of Madness","Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.","https://image.tmdb.org/t/p/w500//9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg");
insert into movie (movie_id, title, overview, poster_path) values (545611,"Everything Everywhere All at Once","An aging Chinese immigrant is swept up in an insane adventure, where she alone can save what's important to her by connecting with the lives she could have led in other universes.","https://image.tmdb.org/t/p/w500//w3LxiVYdWWRvEVdn5RYq6jIqkb1.jpg");
insert into movie (movie_id, title, overview, poster_path) values (414906,"The Batman","In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.","https://image.tmdb.org/t/p/w500//74xTEgt7R36Fpooo50r9T25onhq.jpg");
insert into movie (movie_id, title, overview, poster_path) values (760741,"Beast","A recently widowed man and his two teenage daughters travel to a game reserve in South Africa. However, their journey of healing soon turns into a fight for survival when a bloodthirsty lion starts to stalk them.","https://image.tmdb.org/t/p/w500//xIGr7UHsKf0URWmyyd5qFMAq4d8.jpg");
insert into movie (movie_id, title, overview, poster_path) values (19995,"Avatar","In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting an alien civilization.","https://image.tmdb.org/t/p/w500//jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg");
insert into movie (movie_id, title, overview, poster_path) values (120,"The Lord of the Rings: The Fellowship of the Ring","Young hobbit Frodo Baggins, after inheriting a mysterious ring from his uncle Bilbo, must leave his home in order to keep it from falling into the hands of its evil creator. Along the way, a fellowship is formed to protect the ringbearer and make sure that the ring arrives at its final destination: Mt. Doom, the only place where it can be destroyed.","https://image.tmdb.org/t/p/w500//6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg");
insert into movie (movie_id, title, overview, poster_path) values (756999,"The Black Phone","Finney Blake, a shy but clever 13-year-old boy, is abducted by a sadistic killer and trapped in a soundproof basement where screaming is of little use. When a disconnected phone on the wall begins to ring, Finney discovers that he can hear the voices of the killer‚Äö√Ñ√¥s previous victims. And they are dead set on making sure that what happened to them doesn‚Äö√Ñ√¥t happen to Finney.","https://image.tmdb.org/t/p/w500//lr11mCT85T1JanlgjMuhs9nMht4.jpg");
insert into movie (movie_id, title, overview, poster_path) values (766507,"Prey","When danger threatens her camp, the fierce and highly skilled Comanche warrior Naru sets out to protect her people. But the prey she stalks turns out to be a highly evolved alien predator with a technically advanced arsenal.","https://image.tmdb.org/t/p/w500//ujr5pztc1oitbe7ViMUOilFaJ7s.jpg");
insert into movie (movie_id, title, overview, poster_path) values (744276,"After Ever Happy","As a shocking truth about a couple's families emerges, the two lovers discover they are not so different from each other. Tessa is no longer the sweet, simple, good girl she was when she met Hardin ‚Äö√Ñ√Æ any more than he is the cruel, moody boy she fell so hard for.","https://image.tmdb.org/t/p/w500//6b7swg6DLqXCO3XUsMnv6RwDMW2.jpg");
insert into movie (movie_id, title, overview, poster_path) values (299536,"Avengers: Infinity War","As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.","https://image.tmdb.org/t/p/w500//7WsyChQLEftFiDOVTGkv3hFpyyt.jpg");
insert into movie (movie_id, title, overview, poster_path) values (675353,"Sonic the Hedgehog 2","After settling in Green Hills, Sonic is eager to prove he has what it takes to be a true hero. His test comes when Dr. Robotnik returns, this time with a new partner, Knuckles, in search for an emerald that has the power to destroy civilizations. Sonic teams up with his own sidekick, Tails, and together they embark on a globe-trotting journey to find the emerald before it falls into the wrong hands.","https://image.tmdb.org/t/p/w500//6DrHO1jr3qVrViUO6s6kFiAGM7.jpg");
insert into movie (movie_id, title, overview, poster_path) values (532639,"Pinocchio","A wooden puppet embarks on a thrilling adventure to become a real boy.","https://image.tmdb.org/t/p/w500//g8sclIV4gj1TZqUpnL82hKOTK3B.jpg");
insert into movie (movie_id, title, overview, poster_path) values (718789,"Lightyear","Legendary Space Ranger Buzz Lightyear embarks on an intergalactic adventure alongside a group of ambitious recruits and his robot companion Sox.","https://image.tmdb.org/t/p/w500//65WFr1ZMAbEniIh4jEhbRG9OHHN.jpg");
insert into movie (movie_id, title, overview, poster_path) values (818397,"Memory","Alex, an assassin-for-hire, finds that he's become a target after he refuses to complete a job for a dangerous criminal organization. With the crime syndicate and FBI in hot pursuit, Alex has the skills to stay ahead, except for one thing: he is struggling with severe memory loss, affecting his every move. Alex must question his every action and whom he can ultimately trust.","https://image.tmdb.org/t/p/w500//QaNLpq3Wuu2yp5ESsXYcQCOpUk.jpg");
insert into movie (movie_id, title, overview, poster_path) values (610150,"Dragon Ball Super: Super Hero","The Red Ribbon Army, an evil organization that was once destroyed by Goku in the past, has been reformed by a group of people who have created new and mightier Androids, Gamma 1 and Gamma 2, and seek vengeance against Goku and his family.","https://image.tmdb.org/t/p/w500//rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg");
insert into movie (movie_id, title, overview, poster_path) values (10195,"Thor","Against his father Odin's will, The Mighty Thor - a powerful but arrogant warrior god - recklessly reignites an ancient war. Thor is cast down to Earth and forced to live among humans as punishment. Once here, Thor learns what it takes to be a true hero when the most dangerous villain of his world sends the darkest forces of Asgard to invade Earth.","https://image.tmdb.org/t/p/w500//prSfAi1xGrhLQNxVSUFh61xQ4Qy.jpg");
insert into movie (movie_id, title, overview, poster_path) values (852046,"Athena","Hours after the tragic death of their youngest brother in unexplained circumstances, three siblings have their lives thrown into chaos.","https://image.tmdb.org/t/p/w500//7WfAuzUtztPJ9rDEzmjx0I4NIDw.jpg");
insert into movie (movie_id, title, overview, poster_path) values (725201,"The Gray Man","When a shadowy CIA agent uncovers damning agency secrets, he's hunted across the globe by a sociopathic rogue operative who's put a bounty on his head.","https://image.tmdb.org/t/p/w500//5Eom3JsXgQlCj6QIsGCwXkX7wyH.jpg");
insert into movie (movie_id, title, overview, poster_path) values (842942,"Bandit","After escaping a Michigan prison, a charming career criminal assumes a new identity in Canada and goes on to rob a record 59 banks and jewellery stores while being hunted by a rogue task force. Based on the story of The Flying Bandit.","https://image.tmdb.org/t/p/w500//yph9PAbmjYPvyvbeZvdYIhCZHEu.jpg");
insert into movie (movie_id, title, overview, poster_path) values (755566,"Day Shift","An LA vampire hunter has a week to come up with the cash to pay for his kid's tuition and braces. Trying to make a living these days just might kill him.","https://image.tmdb.org/t/p/w500//bI7lGR5HuYlENlp11brKUAaPHuO.jpg");
insert into movie (movie_id, title, overview, poster_path) values (585511,"Luck","Suddenly finding herself in the never-before-seen Land of Luck, the unluckiest person in the world must unite with the magical creatures there to turn her luck around.","https://image.tmdb.org/t/p/w500//1HOYvwGFioUFL58UVvDRG6beEDm.jpg");
insert into movie (movie_id, title, overview, poster_path) values (921360,"Wire Room","New recruit Justin Rosa must monitor arms-smuggling cartel member Eddie Flynn ‚Äö√Ñ√Æ and keep him alive at all costs. When a SWAT team descends on Flynn‚Äö√Ñ√¥s home, Rosa breaks protocol and contacts the gangster directly to save his life. As gunmen break into the Wire Room and chaos erupts, Mueller and Rosa make a final, desperate stand against the corrupt agents and officials who seek to destroy evidence and kill them both.","https://image.tmdb.org/t/p/w500//b9ykj4v8ykjRoGB7SpI1OuxblNU.jpg");
insert into movie (movie_id, title, overview, poster_path) values (698948,"Thirteen Lives","Based on the true nail-biting mission that captivated the world. Twelve boys and the coach of a Thai soccer team explore the Tham Luang cave when an unexpected rainstorm traps them in a chamber inside the mountain. Entombed behind a maze of flooded cave tunnels, they face impossible odds. A team of world-class divers navigate through miles of dangerous cave networks to discover that finding the boys is only the beginning.","https://image.tmdb.org/t/p/w500//yi5KcJqFxy0D6yP8nCfcF8gJGg5.jpg");
insert into movie (movie_id, title, overview, poster_path) values (877957,"Drifting Home","Sixth-graders Kosuke and Natsume grew up in the same apartment building as childhood friends. During summer break, while playing in the apartment building that is set to be demolished, they find themselves caught in a strange phenomenon. All they can see around them is a vast sea. Will Kosuke and the others make it back to their world? A journey of farewells in summer has just begun.","https://image.tmdb.org/t/p/w500//iNf1wC8cK6e8zgNyuMUqWFT7Din.jpg");
insert into movie (movie_id, title, overview, poster_path) values (601796,"Alienoid","Gurus in the late Goryeo dynasty try to obtain a fabled, holy sword, and humans in 2022 hunt down an alien prisoner that is locked in a human's body. The two parties cross paths when a time-traveling portal opens up.","https://image.tmdb.org/t/p/w500//qHXTUUJ3Rsxw67Ns75u6RdGNaMJ.jpg");
insert into movie (movie_id, title, overview, poster_path) values (10895,"Pinocchio","Lonely toymaker Geppetto has his wishes answered when the Blue Fairy arrives to bring his wooden puppet Pinocchio to life. Before becoming a real boy, however, Pinocchio must prove he's worthy as he sets off on an adventure with his whistling sidekick and conscience, Jiminy Cricket.","https://image.tmdb.org/t/p/w500//oQ6G17kIM4ZDQEfJB6DiiOpaOdW.jpg");
insert into movie (movie_id, title, overview, poster_path) values (862551,"Me Time","With his family away, a devoted stay-at-home dad enjoys his first me time in years by joining his hard-partying old friend on a wild birthday adventure.","https://image.tmdb.org/t/p/w500//bkjPoisqAavXUvtoirxTEcLLQyI.jpg");
insert into movie (movie_id, title, overview, poster_path) values (960170,"Rainbow","A modern tale of a teenager‚Äö√Ñ√¥s coming-of-age journey loosely inspired by the classic novel ‚Äö√Ñ√∫The Wonderful Wizard of Oz.‚Äö√Ñ√π","https://image.tmdb.org/t/p/w500//4nMYjNjfQdUkvVDDxPzikuZVGHd.jpg");
insert into movie (movie_id, title, overview, poster_path) values (1,"Love In The Villa","A young woman takes a trip to romantic Verona, Italy, after a breakup, only to find that the villa she reserved was double-booked, and she'll have to share her vacation with a cynical British man.","https://image.tmdb.org/t/p/w500//t92CXfEP5aWBATeOomcF0wF9NsM.jpg");
insert into movie (movie_id, title, overview, poster_path) values (2,"The Dirt","The story of Mötley Crüe and their rise from the Sunset Strip club scene of the early 1980s to superstardom.","https://image.tmdb.org/t/p/w500//xGY5rr8441ib0lT9mtHZn7e8Aay.jpg");
insert into movie (movie_id, title, overview, poster_path) values (3,"Footloose","Ren MacCormack is transplanted from Boston to the small southern town of Bomont where loud music and dancing are prohibited. Not one to bow to the status quo, Ren challenges the ban, revitalizing the town and falling in love with the minister’s troubled daughter Ariel in the process.","https://image.tmdb.org/t/p/w500//rzTuPCtIBuL4LPJBbNA5RnXDzPZ.jpg");
insert into movie (movie_id, title, overview, poster_path) values (4,"I Used To Be Famous","A former boy band star unexpectedly gets a second shot at success when he forms a bond with a gifted young drummer.","https://image.tmdb.org/t/p/w500//hJMnsf6vzgoNx0bv3uh3PTCjmks.jpg");
insert into movie (movie_id, title, overview, poster_path) values (5,"Meet Cute","A wildly inventive deconstruction of the romantic comedy built around the question: What would you do if you could travel to your loved ones’ past, heal their traumas, fix their problems, and change them into the perfect partner?","https://image.tmdb.org/t/p/w500//8NBlso3DuV3frqOzLZ4UYPMTqYu.jpg");
insert into movie (movie_id, title, overview, poster_path) values (6,"Bring It On: Cheer Or Die","When a cheer squad practices their routines on Halloween weekend in an abandoned school, they are picked off one by one by an unknown killer.","https://image.tmdb.org/t/p/w500//ciRq9QUBpFWNsFKs2opG5tP157.jpg");
insert into movie (movie_id, title, overview, poster_path) values (7,"Fullmetal Alchemist The Revenge Of Scar","The Elric brothers meet their toughest opponent yet — a lone serial killer with a large scar on his forehead.","https://image.tmdb.org/t/p/w500//c5OwwBNyJkwyroIOIJL9IiRjydR.jpg");
insert into movie (movie_id, title, overview, poster_path) values (8,"Loving Adults","The thin line between love and hate turns deadly when a wife discovers her husband’s affair — and they both take extreme measures to get what they want.","https://image.tmdb.org/t/p/w500//mNSqObjKszcxr55buQafQF9ARiC.jpg");
insert into movie (movie_id, title, overview, poster_path) values (9,"Doctor Strange","After his career is destroyed, a brilliant but arrogant surgeon gets a new lease on life when a sorcerer takes him under her wing and trains him to defend the world against evil.","https://image.tmdb.org/t/p/w500//7WfK17BXE6szXlm4WOxfswgbdsL.jpg");
insert into movie (movie_id, title, overview, poster_path) values (10,"Annihilation","A biologist signs up for a dangerous, secret expedition into a mysterious zone where the laws of nature don't apply.","https://image.tmdb.org/t/p/w500//4YRplSk6BhH6PRuE9gfyw9byUJ6.jpg");
insert into movie (movie_id, title, overview, poster_path) values (11,"A Trip To Infinity","Does infinity exist? Can we experience the Infinite? In an animated film (created by artists from 10 countries) the world's most cutting-edge scientists and mathematicians go in search of the infinite and its mind-bending implications for the universe. Eminent mathematicians, particle physicists and cosmologists dive into infinity and its mind-bending implications for the universe.","https://image.tmdb.org/t/p/w500//24EXccaDuDEMYp7eVvsCicj5K41.jpg");
insert into movie (movie_id, title, overview, poster_path) values (12,"DreamWorks Dragons","From the creators of How to Train Your Dragon comes a new series that takes Hiccup and Toothless to the edge of adventure.","https://image.tmdb.org/t/p/w500//fDzGH0jGhJMMxbgsb9JiC7Ep4uk.jpg");
insert into movie (movie_id, title, overview, poster_path) values (13,"Harry Potter and the Deathly Hallows: Part 2","Harry, Ron and Hermione continue their quest to vanquish the evil Voldemort once and for all. Just as things begin to look hopeless for the young wizards, Harry discovers a trio of magical objects that endow him with powers to rival Voldemort's formidable skills.","https://image.tmdb.org/t/p/w500//c54HpQmuwXjHq2C9wmoACjxoom3.jpg");
insert into movie (movie_id, title, overview, poster_path) values (14,"Shark Tale","Oscar is a small fish whose big aspirations often get him into trouble. Meanwhile, Lenny is a great white shark with a surprising secret that no sea creature would guess: He's a vegetarian. When a lie turns Oscar into an improbable hero and Lenny becomes an outcast, the two form an unlikely friendship.","https://image.tmdb.org/t/p/w500//r08DpyPyhXcJTfNZAICNGMzcQ8l.jpg");
insert into movie (movie_id, title, overview, poster_path) values (15,"The Boss Baby","A story about how a new baby's arrival impacts a family, told from the point of view of a delightfully unreliable narrator, a wildly imaginative 7 year old named Tim.","https://image.tmdb.org/t/p/w500//unPB1iyEeTBcKiLg8W083rlViFH.jpg");
insert into movie (movie_id, title, overview, poster_path) values (16,"47 Meters Down: Uncaged","Four teenage girls go on a diving adventure to explore a submerged Mayan city. Once inside, their rush of excitement turns into a jolt of terror as they discover the sunken ruins are a hunting ground for deadly great white sharks. With their air supply steadily dwindling, the friends must navigate the underwater labyrinth of claustrophobic caves and eerie tunnels in search of a way out of their watery hell.","https://image.tmdb.org/t/p/w500//g4z7mDmJmx23vsVg6XNWcnXb6gc.jpg");
insert into movie (movie_id, title, overview, poster_path) values (17,"Pixels","Video game experts are recruited by the military to fight 1980s-era video game characters who've attacked New York.","https://image.tmdb.org/t/p/w500//tJ1llabujSXGiKC0xv5qqJyNrSm.jpg");
insert into movie (movie_id, title, overview, poster_path) values (18,"Battleship","When mankind beams a radio signal into space, a reply comes from ‘Planet G’, in the form of several alien crafts that splash down in the waters off Hawaii. Lieutenant Alex Hopper is a weapons officer assigned to the USS John Paul Jones, part of an international naval coalition which becomes the world's last hope for survival as they engage the hostile alien force of unimaginable strength. While taking on the invaders, Hopper must also try to live up to the potential that his brother, and his fiancée's father—an Admiral—expect of him.","https://image.tmdb.org/t/p/w500//mXb3hot6ZW4hMfpZSK7UtD70WgM.jpg");
insert into movie (movie_id, title, overview, poster_path) values (19,"Hulk","Bruce Banner, a genetics researcher with a tragic past, suffers massive radiation exposure in his laboratory that causes him to transform into a raging green monster when he gets angry.","https://image.tmdb.org/t/p/w500//qnngKqAcqfH2pBxDoKu5lxzSbTo.jpg");
insert into movie (movie_id, title, overview, poster_path) values (20,"The Perfumier","To regain her sense of smell and get back her lover, a detective joins forces with a perfume maker who uses deadly methods to create the perfect scent.","https://image.tmdb.org/t/p/w500//ieivbB7SDenOGfqae0vZdJQfJA.jpg");
-- Agregar caracteristicas
insert into movie_characteristic (characteristic_id,movie_id) values (1,1);
insert into movie_characteristic (characteristic_id,movie_id) values (9,1);
insert into movie_characteristic (characteristic_id,movie_id) values (15,1);
insert into movie_characteristic (characteristic_id,movie_id) values (17,2);
insert into movie_characteristic (characteristic_id,movie_id) values (13,2);
insert into movie_characteristic (characteristic_id,movie_id) values (7,2);
insert into movie_characteristic (characteristic_id,movie_id) values (1,3);
insert into movie_characteristic (characteristic_id,movie_id) values (4,3);
insert into movie_characteristic (characteristic_id,movie_id) values (17,3);
insert into movie_characteristic (characteristic_id,movie_id) values (4,4);
insert into movie_characteristic (characteristic_id,movie_id) values (14,4);
insert into movie_characteristic (characteristic_id,movie_id) values (1,5);
insert into movie_characteristic (characteristic_id,movie_id) values (2,5);
insert into movie_characteristic (characteristic_id,movie_id) values (15,5);
insert into movie_characteristic (characteristic_id,movie_id) values (9,6);
insert into movie_characteristic (characteristic_id,movie_id) values (1,6);
insert into movie_characteristic (characteristic_id,movie_id) values (4,6);
insert into movie_characteristic (characteristic_id,movie_id) values (11,7);
insert into movie_characteristic (characteristic_id,movie_id) values (13,7);
insert into movie_characteristic (characteristic_id,movie_id) values (15,7);
insert into movie_characteristic (characteristic_id,movie_id) values (17,7);
insert into movie_characteristic (characteristic_id,movie_id) values (9,8);
insert into movie_characteristic (characteristic_id,movie_id) values (4,8);
insert into movie_characteristic (characteristic_id,movie_id) values (8,8);
insert into movie_characteristic (characteristic_id,movie_id) values (11,9);
insert into movie_characteristic (characteristic_id,movie_id) values (13,9);
insert into movie_characteristic (characteristic_id,movie_id) values (17,9);
insert into movie_characteristic (characteristic_id,movie_id) values (3,10);
insert into movie_characteristic (characteristic_id,movie_id) values (8,10);
insert into movie_characteristic (characteristic_id,movie_id) values (11,11);
insert into movie_characteristic (characteristic_id,movie_id) values (17,11);
insert into movie_characteristic (characteristic_id,movie_id) values (2,12);
insert into movie_characteristic (characteristic_id,movie_id) values (1,12);
insert into movie_characteristic (characteristic_id,movie_id) values (15,12);
insert into movie_characteristic (characteristic_id,movie_id) values (9,13);
insert into movie_characteristic (characteristic_id,movie_id) values (1,13);
insert into movie_characteristic (characteristic_id,movie_id) values (2,13);
insert into movie_characteristic (characteristic_id,movie_id) values (1,14);
insert into movie_characteristic (characteristic_id,movie_id) values (2,14);
insert into movie_characteristic (characteristic_id,movie_id) values (15,14);
insert into movie_characteristic (characteristic_id,movie_id) values (5,15);
insert into movie_characteristic (characteristic_id,movie_id) values (13,15);
insert into movie_characteristic (characteristic_id,movie_id) values (17,15);
insert into movie_characteristic (characteristic_id,movie_id) values (17,16);
insert into movie_characteristic (characteristic_id,movie_id) values (2,16);
insert into movie_characteristic (characteristic_id,movie_id) values (11,16);
insert into movie_characteristic (characteristic_id,movie_id) values (1,17);
insert into movie_characteristic (characteristic_id,movie_id) values (2,17);
insert into movie_characteristic (characteristic_id,movie_id) values (9,17);
insert into movie_characteristic (characteristic_id,movie_id) values (15,17);
insert into movie_characteristic (characteristic_id,movie_id) values (2,18);
insert into movie_characteristic (characteristic_id,movie_id) values (9,18);
insert into movie_characteristic (characteristic_id,movie_id) values (1,18);
insert into movie_characteristic (characteristic_id,movie_id) values (11,19);
insert into movie_characteristic (characteristic_id,movie_id) values (17,19);
insert into movie_characteristic (characteristic_id,movie_id) values (17,20);
insert into movie_characteristic (characteristic_id,movie_id) values (1,20);
insert into movie_characteristic (characteristic_id,movie_id) values (15,20);
insert into movie_characteristic (characteristic_id,movie_id) values (14,21);
insert into movie_characteristic (characteristic_id,movie_id) values (7,21);
insert into movie_characteristic (characteristic_id,movie_id) values (2,22);
insert into movie_characteristic (characteristic_id,movie_id) values (1,22);
insert into movie_characteristic (characteristic_id,movie_id) values (15,22);
insert into movie_characteristic (characteristic_id,movie_id) values (1,23);
insert into movie_characteristic (characteristic_id,movie_id) values (2,23);
insert into movie_characteristic (characteristic_id,movie_id) values (8,23);
insert into movie_characteristic (characteristic_id,movie_id) values (4,23);
insert into movie_characteristic (characteristic_id,movie_id) values (9,24);
insert into movie_characteristic (characteristic_id,movie_id) values (2,24);
insert into movie_characteristic (characteristic_id,movie_id) values (8,24);
insert into movie_characteristic (characteristic_id,movie_id) values (3,25);
insert into movie_characteristic (characteristic_id,movie_id) values (1,25);
insert into movie_characteristic (characteristic_id,movie_id) values (2,25);
insert into movie_characteristic (characteristic_id,movie_id) values (8,25);
insert into movie_characteristic (characteristic_id,movie_id) values (15,25);
insert into movie_characteristic (characteristic_id,movie_id) values (1,26);
insert into movie_characteristic (characteristic_id,movie_id) values (17,26);
insert into movie_characteristic (characteristic_id,movie_id) values (5,26);
insert into movie_characteristic (characteristic_id,movie_id) values (3,27);
insert into movie_characteristic (characteristic_id,movie_id) values (15,27);
insert into movie_characteristic (characteristic_id,movie_id) values (1,27);
insert into movie_characteristic (characteristic_id,movie_id) values (2,28);
insert into movie_characteristic (characteristic_id,movie_id) values (9,28);
insert into movie_characteristic (characteristic_id,movie_id) values (1,28);
insert into movie_characteristic (characteristic_id,movie_id) values (7,29);
insert into movie_characteristic (characteristic_id,movie_id) values (1,29);
insert into movie_characteristic (characteristic_id,movie_id) values (17,29);
insert into movie_characteristic (characteristic_id,movie_id) values (1,30);
insert into movie_characteristic (characteristic_id,movie_id) values (17,30);
insert into movie_characteristic (characteristic_id,movie_id) values (5,31);
insert into movie_characteristic (characteristic_id,movie_id) values (7,31);
insert into movie_characteristic (characteristic_id,movie_id) values (17,31);
insert into movie_characteristic (characteristic_id,movie_id) values (1,32);
insert into movie_characteristic (characteristic_id,movie_id) values (9,32);
insert into movie_characteristic (characteristic_id,movie_id) values (11,32);
insert into movie_characteristic (characteristic_id,movie_id) values (4,32);
insert into movie_characteristic (characteristic_id,movie_id) values (3,33);
insert into movie_characteristic (characteristic_id,movie_id) values (2,33);
insert into movie_characteristic (characteristic_id,movie_id) values (4,33);
insert into movie_characteristic (characteristic_id,movie_id) values (9,33);
insert into movie_characteristic (characteristic_id,movie_id) values (1,34);
insert into movie_characteristic (characteristic_id,movie_id) values (5,34);
insert into movie_characteristic (characteristic_id,movie_id) values (17,34);
insert into movie_characteristic (characteristic_id,movie_id) values (7,35);
insert into movie_characteristic (characteristic_id,movie_id) values (17,35);
insert into movie_characteristic (characteristic_id,movie_id) values (1,35);
insert into movie_characteristic (characteristic_id,movie_id) values (2,35);
insert into movie_characteristic (characteristic_id,movie_id) values (3,36);
insert into movie_characteristic (characteristic_id,movie_id) values (7,36);
insert into movie_characteristic (characteristic_id,movie_id) values (13,36);
insert into movie_characteristic (characteristic_id,movie_id) values (9,36);
insert into movie_characteristic (characteristic_id,movie_id) values (8,36);
insert into movie_characteristic (characteristic_id,movie_id) values (1,37);
insert into movie_characteristic (characteristic_id,movie_id) values (9,37);
insert into movie_characteristic (characteristic_id,movie_id) values (13,37);
insert into movie_characteristic (characteristic_id,movie_id) values (15,37);
insert into movie_characteristic (characteristic_id,movie_id) values (4,37);
insert into movie_characteristic (characteristic_id,movie_id) values (2,37);
insert into movie_characteristic (characteristic_id,movie_id) values (3,24);
insert into movie_characteristic (characteristic_id,movie_id) values (8,24);
insert into movie_characteristic (characteristic_id,movie_id) values (4,39);
insert into movie_characteristic (characteristic_id,movie_id) values (9,40);
insert into movie_characteristic (characteristic_id,movie_id) values (7,40);
insert into movie_characteristic (characteristic_id,movie_id) values (4,40);
insert into movie_characteristic (characteristic_id,movie_id) values (12,40);
insert into movie_characteristic (characteristic_id,movie_id) values (14,41);
insert into movie_characteristic (characteristic_id,movie_id) values (4,41);
insert into movie_characteristic (characteristic_id,movie_id) values (7,42);
insert into movie_characteristic (characteristic_id,movie_id) values (12,42);
insert into movie_characteristic (characteristic_id,movie_id) values (10,42);
insert into movie_characteristic (characteristic_id,movie_id) values (4,42);
insert into movie_characteristic (characteristic_id,movie_id) values (7,43);
insert into movie_characteristic (characteristic_id,movie_id) values (12,43);
insert into movie_characteristic (characteristic_id,movie_id) values (14,43);
insert into movie_characteristic (characteristic_id,movie_id) values (4,44);
insert into movie_characteristic (characteristic_id,movie_id) values (7,44);
insert into movie_characteristic (characteristic_id,movie_id) values (12,44);
insert into movie_characteristic (characteristic_id,movie_id) values (14,45);
insert into movie_characteristic (characteristic_id,movie_id) values (4,45);
insert into movie_characteristic (characteristic_id,movie_id) values (7,45);
insert into movie_characteristic (characteristic_id,movie_id) values (15,45);
insert into movie_characteristic (characteristic_id,movie_id) values (17,46);
insert into movie_characteristic (characteristic_id,movie_id) values (11,46);
insert into movie_characteristic (characteristic_id,movie_id) values (4,46);
insert into movie_characteristic (characteristic_id,movie_id) values (16,46);
insert into movie_characteristic (characteristic_id,movie_id) values (9,47);
insert into movie_characteristic (characteristic_id,movie_id) values (1,47);
insert into movie_characteristic (characteristic_id,movie_id) values (2,47);
insert into movie_characteristic (characteristic_id,movie_id) values (17,48);
insert into movie_characteristic (characteristic_id,movie_id) values (1,49);
insert into movie_characteristic (characteristic_id,movie_id) values (2,49);
insert into movie_characteristic (characteristic_id,movie_id) values (9,49);
insert into movie_characteristic (characteristic_id,movie_id) values (15,50);
insert into movie_characteristic (characteristic_id,movie_id) values (11,50);
insert into movie_characteristic (characteristic_id,movie_id) values (6,51);
insert into movie_characteristic (characteristic_id,movie_id) values (3,52);
insert into movie_characteristic (characteristic_id,movie_id) values (1,52);
insert into movie_characteristic (characteristic_id,movie_id) values (2,52);
insert into movie_characteristic (characteristic_id,movie_id) values (15,52);
insert into movie_characteristic (characteristic_id,movie_id) values (9,52);
insert into movie_characteristic (characteristic_id,movie_id) values (4,52);
insert into movie_characteristic (characteristic_id,movie_id) values (9,53);
insert into movie_characteristic (characteristic_id,movie_id) values (2,53);
insert into movie_characteristic (characteristic_id,movie_id) values (3,54);
insert into movie_characteristic (characteristic_id,movie_id) values (1,54);
insert into movie_characteristic (characteristic_id,movie_id) values (4,54);
insert into movie_characteristic (characteristic_id,movie_id) values (8,54);
insert into movie_characteristic (characteristic_id,movie_id) values (3,55);
insert into movie_characteristic (characteristic_id,movie_id) values (4,55);
insert into movie_characteristic (characteristic_id,movie_id) values (8,55);
insert into movie_characteristic (characteristic_id,movie_id) values (11,56);
insert into movie_characteristic (characteristic_id,movie_id) values (7,56);
insert into movie_characteristic (characteristic_id,movie_id) values (2,56);
insert into movie_characteristic (characteristic_id,movie_id) values (1,57);
insert into movie_characteristic (characteristic_id,movie_id) values (4,57);
insert into movie_characteristic (characteristic_id,movie_id) values (15,57);
insert into movie_characteristic (characteristic_id,movie_id) values (17,58);
insert into movie_characteristic (characteristic_id,movie_id) values (1,58);
insert into movie_characteristic (characteristic_id,movie_id) values (2,58);
insert into movie_characteristic (characteristic_id,movie_id) values (15,58);
insert into movie_characteristic (characteristic_id,movie_id) values (15,59);
insert into movie_characteristic (characteristic_id,movie_id) values (1,59);
insert into movie_characteristic (characteristic_id,movie_id) values (7,60);
insert into movie_characteristic (characteristic_id,movie_id) values (5,60);
insert into movie_characteristic (characteristic_id,movie_id) values (13,60);
insert into movie_characteristic (characteristic_id,movie_id) values (17,60);
