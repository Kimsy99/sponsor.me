/*INSERT into USER 
    (username, user_password, email)
VALUES
    ('TuanHong', 'admin', 'tuanhong@sponsorme.com'),
    ('Kenneth', 'admin', 'kenneth@sponsorme.com'),
    ('Kim', 'admin', 'kim@sponsorme.com'),
    ('hanmeimei', 'hanmeimei', 'hanmeimei@gmail.com'),
    ('moft', 'moft', 'moft@gmail.com');*/

-- INSERT into ADMIN 
--     (name, admin_password, email)
-- VALUES
--     ('TuanHong', 'admin', 'tuanhong@sponsorme.com'),
--     ('Kenneth', 'admin', 'kenneth@sponsorme.com'),
--     ('Kim', 'admin', 'kim@sponsorme.com');

-- INSERT into USER 
--     (username, user_password, email)
-- VALUES
--     ('ximena', 'ximena', 'ximena@gmail.com');

-- update user
-- set creation_date = '2020-12-15';

/*
INSERT into project (project_name, funding_goal, small_description, category, creator_id, creation_date)
VALUES
    (
        'MOFT Float: Invisible Stand&Case for iPad Pro&New iPad Air',
        500000,
        'A slim stand&case that provides adjustable height and unlimited angles. Taking your iPad Pro to next-level height and experience.',
        'tech',
        5,
        '2020-12-15'
    ),
    (
        'Monument 2: Smart photo storage and organization',
        700000,
        'The next generation smart photo storage and organization that protects your privacy.',
        'tech',
        1,
        '2020-12-15'
    ),
    (
        'ARCO 2-in-1 Coffee Grinder',
        400000,
        'Combining the luxury of electrical and the freedom of a hand grinder.',
        'tech',
        2,
        '2020-12-15'
    ),
    (
        'Carta Prat: The Animation',
        40000,
        'Carta Prat is an animation project in development, help us make the Pilot episode!',
        'film',
        11,
        '2020-12-15'
    ),
    (
        'Shinto: The Way of The Kami',
        30000,
        'A documentary film about Shinto, the Japanese philosophy of life, and Hiroko, a Shinto priestess.',
        'film',
        3,
        '2020-12-15'
    ),
    (
        '45th Atlanta Film Festival: Building Community Through Film',
        10000,
        'ATLFF21 is not just April 22nd to May 2nd, but a year-round experience that fosters a thriving film community.',
        'film',
        4,
        '2020-12-15'
    ),
    (
        'Strata Records-The Sound of Detroit-Reimagined by Jazzanova',
        5000,
        'Help 180 Proof Records and Jazzanova reimagine music from the legendary Strata catalog for an album release.',
        'art',
        1,
        '2020-12-15'
    ),
    (
        'Hatsune Miku Global Concert "HATSUNE MIKU EXPO 2021 Online"',
        100000,
        'Help us create an online show featuring virtual singer Hatsune Miku!',
        'art',
        2,
        '2020-12-15'
    ),
    (
        'Dances and Fantasies: Debut Album from Trio Ghidorah',
        1000,
        'Music composed and arranged for three guitars featuring pieces by Stephen Dodgson, Annette Kruisbrink, Philip Glass and more!',
        'art',
        3,
        '2020-12-15'
    ),
    (
        'Jaroslav Benda 1882–1970 Typographic designs and letterforms',
        20000,
        'Extraordinary book about one of the important figures in the history of Czech Republic – English edition 2021.',
        'publish',
        4,
        '2020-12-15'
    ),
    (
        'The Book',
        7000,
        'The Ultimate Guide To Rebuilding A Civilization. Over 400 pages of detailed and catchy illustrations.',
        'publish',
        1,
        '2020-12-15'
    ),
    (
        'The Fox''s Wedding: a Compendium of Japanese Folklore',
        50000,
        'A fully illustrated encyclopedia with over 100 illustrations of yokai, ghosts, demons, and fox spirits from Japanese folklore.',
        'publish',
        2,
        '2020-12-15'
    ),
    (
        'Slow Bloom Coffee Cooperative: Building a Coffee Roastery',
        400000,
        'Looking for hyper generous coffee lovers to help us fundraise our ~hyper cool~ coffee cooperative: Slow Bloom Coffee Cooperative.',
        'food',
        3,
        '2020-12-15'
    ),
    (
        'Chef Katsu Brooklyn',
        30000,
        'We hope CKB will be your family''s go-to spot for your Japanese comfort food fix, while being health conscious :)',
        'food',
        4,
        '2020-12-15'
    ),
    (
        'Kimchi Hotel: Fermentation garden & community hub, Amsterdam',
        10000,
        'Join in to complete the sustainable garden for the full circle of fermentation experience, community gardening, art exhibitions, & more',
        'food',
        1,
        '2020-12-15'
    ),
    (
        'STORROR Parkour PRO',
        60000,
        'The OFFICIAL Parkour Videogame Experience',
        'game',
        2,
        '2020-12-15'
    ),
    (
        'Hell Architect – Build and manage your own Hell',
        30000,
        'Hell Architect - the game where you can create and manage your own hell! Join Lucifer corporation and be the first Hell Manager!',
        'game',
        3,
        '2020-12-15'
    ),
    (
        'Alhambra Big Box 2nd Edition',
        3000,
        'All new artwork, all 6 expansions, 2 Queenies and Tile Dispenser Tower!',
        'game',
        1,
        '2020-12-15'
    ),
    (
        'Steven Rhodes Games',
        23000,
        'A 3-Pack of games featuring Steven Rhodes'' unique style of nostalgia with a twist of darkness',
        'game',
        2,
        '2020-12-15'
    );
    */
;

--category    enum('tech', 'design', 'film', 'art', 'publish', 'food', 'game')    not null,

INSERT into campaign (project_id, project_status, story)

--project_status    enum('concept', 'prototype', 'production', 'shipping')      not null,

/*
INSERT into faq (project_id, question, answer)
VALUES
(
    20,
    'Which iPads are compatible with MOFT Float 11"?',
    'iPad Air 2020, iPadPro 11-in (1st generation) 2018, iPadPro 11-in (2nd generation) 2020'
),
(
    20,
    'Which iPads are compatible with MOFT Float 12.9"?',
    'iPadPro 12.9-in (3rd generation) 2018, iPadPro 12.9-in (4th generation) 2020'
),
(
    20,
    'How high does MOFT Float raise the iPad screen',
    'It can elevate the screen up to 3.15in/8cm when it''s used in Floating Mode.'
),
(
    20,
    'What is MOFT Float made of?',
    'It''s made of TPU, glassfiber, PC, magnets, aluminum, alloy steel and silicone.'
),
(
    21,
    'What makes Monument different?',
    'It''s a powerful photo storage and organization solution while providing cloud-level experience and protecting privacy.'
),
(
    21,
    'When will it be available?',
    'Estimated shipping date is May 2021.'
),
(
    21,
    'How does it differ from Google Photos?',
    'Compared to Google Photos, Monument provides a similar photo management experience while protecting user privacy and security. We do not use, market, or sell any personal data. None of your content is visible except you.'
),
(
    29,
    'Why don''t you use hard cover on your Special Limited Edition of the book?',
    'We did not intend to design a monumental publication, that would be heavyweight, thick, and solid as a tombstone as it usually is. We wanted to make Benda''s book more lively, nice, easily open publication, accessible to the young generation, which is afraid of reading books and scared of milestone publications. Graphic layout is also corresponding to that logic – no wasting with paper and white spaces, as much information as possible in the shortest text possible. Also, we spent much time choosing the right paper and cover materials to make this book light, nicely flexible, and soft in touch. We wanted to create a sexy book full of interesting images and content. Usually, the production lacks sophisticated details and materials. Our book is mainly about the content, form follows function and materials are top quality. So for the Special Limited Edition, we tried to keep the same approach, only add luxurious paper on the cover, use silkscreen print, sign all of the books personally and limit the number of copies.'
),
(
    29,
    'Why is the shipping in EU expensive?',
    'We know, it''s a lot. Yet, we don''t know the exact weight of the book (translation and new additions might enlarge the number of pages). So we had to choose to heavier option – under 2 kg. Another problem we had in our country is almost a state monopoly on postal service. We were given a general price for the whole of Europe. We couldn''t differentiate between each EU country separately. Sending one or two parcels is another thing than sending hundreds (by ourselves).'
),
(
    30,
    'How do I order more than one pledge?',
    'You can''t'
),
(
    30,
    'How do I pay for shipping?',
    'Shipping will be invoiced after the project ends in Bakerkit. You can see shipping rates at the Shipping Rates section.'
),
(
    31,
    'How will shipping fee be calculated?',
    'After the project is funded, pledges will be handled by BackerKit. In BackerKit it is possible to calculate more precise shipping costs based on your country and the weight of your package, to minimize the shipping costs to you.'
),
(
    33,
    'Why does it enter $10 extra than the listed amount when I enter for a pledge?',
    'The extra $10 is the shipping cost for the item to be shipped out. Anywhere else in the world (outside of U.S) may cost more.'
),
(
    33,
    'I backed a knife and would like my name on it, how/where do I submit that info',
    'Once we reach our goal, we will reach out individually to everyone who kindly backed our project! Then, we will ask you for all the necessary information. Until then, please hang tight and think about what you would like to say on your chef''s selection knife! :)'
),
(
    35,
    'Is £55k enough to make a video game on this level?',
    'Yep, £55k is low and actually we are hoping to raise a lot more than that. The kickstarter funds are only aiming to cover the budget of motion capture and sounds design. The rest is covered by our existing fundings. We have plans to raise more through other avenues.'
),
(
    35,
    'You said the ''world''s first pure parkour game'' what about Mirrors Edge?',
    'Mirrors Edge, although a fun game is not a good comparison for what we are developing. Mirrors Edge is simple action-adventure platform game with a weird story, it is completely ignorant to the culture of the sport it is trying to emulate and covers up its lack of parkour controls by forcing the player into combat situations.'
),
(
    35,
    'Is the game going to be 3rd person or POV?',
    'Both! We are planning on giving the player the option to toggle between either perspectives. This way we get the best of both worlds, you can see the movement animation in 3rd person, and you can feel the sense of vertigo in POV.'
),
(
    38,
    'If I want extra copies of the games, can I over pledge ahead of time to set aside funds for the additional item(s)?',
    'Yes! You can always over pledge on Kickstarter. You can reach out to us through the ''contact me'' button on our creator page if you need confirmation on the exact amount of funds you''ll need to add to your initial pledge. Then when we conduct the survey at the end of the campaign, you can add a note about which extra copies you wanted.'
),
(
    38,
    'What will my shipping cost be?',
    'The shipping costs can be found in each individual tier of the campaign page, and are the best rates available to us at the time of fulfillment. They are based on actual costs to ship your rewards (depending on your country) and will be charged as part of your pledge. In some regions, the cost of shipping may exceed the cost of the tier you’re pledging for; unfortunately, this cannot be avoided. In most cases, pledging for two or three games (“Double Trouble” and "Slipcase Exclusive" Tiers) costs almost the same in terms of shipping as pledging for one game.'
);
*/

/*
INSERT into comment (project_id, user_id, COMMENT, parent_comment, COMMENT_date)
VALUES
    -- (20, 1, 'Hi, I''ve PMed a message a while back / sent an email but have not received a response', null, '2020-12-17'),
    -- (20, 2, 'Hi. Can i change my shipping address to different country?', null, '2020-12-17'),
    -- (20, 4, 'Have you allready sent us the survey?, because I haven’t recieved it yet.', null, '2020-12-17'),
    -- (20, 5, 'Hello, thanks for your support. The survey will be sent out before shipping which is expected to start in 2021 January,', 3, '2020-12-17'),
    -- (21, 3, 'Does the SSD model allow you to add an external drive to increase local storage or am I limited to the size of the SSD? If I change my pledge for a unit without internal storage can I add all the external storage I want?', null, '2020-12-17'),
    -- (21, 11, 'Would it be compatible with encrypted external hard drives (e.g. The WD passport)?', null, '2020-12-17'),
    -- (21, 1, 'Hi Raul, Extending the internal storage is not possible, but it can be exchanged to a larger one. For the non-SSD version, you can use any USB drive to be the primary storage.', 5, '2020-12-17'),
    -- (21, 1, 'Hi, It''s not possible.', 6, '2020-12-17'),
    -- (22, 1, 'Hey, it seems like a great idea! I''ve seen some DIY projects of motorized hand grinders and even started gathering parts for my own adaptation. Now... I may do it some day but I''m looking forward to ARCO :)', null, '2020-12-17'),
    -- (22, 3, 'I''m grad that I was able to catch one of the super early 2in1 Arco. I just what to ask if you will provide add-on kits such as a brush, Case for the hand grinder, additional holding cup and cap for the cup (could be Vacuum cap "I wish") and so on... many of us would love to buy them. I hope that you are planning for it ^^!', null, '2020-12-17'),
    -- (24, 11, 'I am a film and music enthusiast from the Deep South of Japan, who used to live nearby Hakozaki Shrine. I am looking forward your project!', null, '2020-12-17'),
    -- (25, 4, 'Starting strong with over $2K raised in just 1 day thanks to our Kickstarter21 backers. But there''s still work to be done to reach $20K in 26 days. Join the community of film supporters by pledging today.', null, '2020-12-17'),
    -- (27, 5, 'I am so happy this is successful. Well done! Looking forward to the concert. Check out my card game on Kickstarter "CHOOSE A BETTER TOMORROW".', null, '2020-12-17'),
    -- (27, 3, 'I''m so excited for this', null, '2020-12-17'),
    -- (28, 1, 'Congratulations on reaching the funding goal!', null, '2020-12-17'),
    -- (29, 2, 'I also pledged an extra $29 for the original book to be included with my order because I didn''t see a way to combine pledges. Thank you.', null, '2020-12-17'),
    -- (29, 11, 'Hi - how do I make two pledges? One for the book and one for an original Benda book, for instance? Seems to be one or the other, not both.', null, '2020-12-17'),
    -- (29, 4, 'Yes, great, I''ll keep a track of your order. Thank you.', 16, '2020-12-17'),
    -- (29, 4, 'Hi, it should be possible to combine pledges. If it is not available, choose one reward (for instance Standard edition of JB book for US$59) and pledge an extra US$29 for the f.e. original book (in total with shipping US$119). You’ll save on shipping, all will be shipped in one time and I will take personal care of your order to get everything all right. Thank you for your support, Robin! Really appreciate. Petra', 17, '2020-12-17'),
    -- (29, 11, 'Great, thanks - I will have to do it on checking out when it comes to the final confirmation, as I can''t work out how to do it now...', 19, '2020-12-17'),
    -- (30, 2, 'Brilliant Idea! Cannot wait to see the finished product and very excited to be on this journey with you all! Make sure to spread the word and tell your friends. The more The Book out there the better chance humanity has at surviving when/if the world collapses :P', null, '2020-12-17'),
    -- (30, 3, '@creator how do you plan on using the funds and any guarantees this project won’t go bust like so many others? So just burned too many times', null, '2020-12-17'),
    -- (30, 5, 'HI ''The Book'' friends! With the book growing more and more, what have your thoughts been on adding 2-3 ribbon bookmarks onto the book to help keep track of preferred chapters/pages?', null, '2020-12-17'),
    -- (31, 1, 'I''m very excited for you on how successful this campaign has been and continues to be! I''ve loved all the books so far and really look forward to this to continue my set. Good luck on all the continued success and thank you for the wonderful and informative updates.', null, '2020-12-17'),
    -- (31, 3, 'You do amazing and inspiring work. I am so happy to see the great success this Kickstarter is having, it is truly deserved. For the past 10 years I have been running table top roleplaying games set in Japan. Once I discovered your books, they entered the inventories of the player characters to help them solve the mysteries about the strange Yokai they encountered. Thank you for these amazing resources.', null, '2020-12-17'),
    -- (31, 2, 'Thank you so much!', 24, '2020-12-17'),
    -- (31, 2, 'Thanks! I''m glad they''ve been helpful!', 25, '2020-12-17'),
    -- (32, 1, 'I want you to succeed, to encourage others to take charge and take action. I raise my cup of bean water to your team.', null, '2020-12-17'),
    -- (33, 3, 'Thank you again for inviting us over for your delicious food today - your hot Yuzu tea was amazing, which inspired me to update my pledge :-) . I''m reaching out to all my social media contacts to spread the word. Happy Holidays and best of luck!', null, '2020-12-17'),
    -- (33, 4, 'I can''t tell you how much we appreciate your help! I truly thank you from the bottom of my heart. We will serve some gluten free menus at our restaurant. Please come and enjoy them :)', 29, '2020-12-17'),
    -- (35, 1, 'So you could play with pc people playing from PS4 for example?', null, '2020-12-17'),
    -- (35, 3, 'Hi! I''ve just back the project and I''m hyped to see the progress made over the next little while. Question though, I''m on a MacBook. Will the game be playable on Mac? or only on windows linux, etc?', null, '2020-12-17'),
    -- (35, 11, 'Hope this kicks off lol cnt wait to be running around as my fave storrors', null, '2020-12-17'),
    -- (35, 2, 'Hi, we are developing the game cross-platform but it''s unluckily that a fully-fledged Mac version will be playable. I can''t give you a final answer right now but it doesn''t look probable at the moment.', 32, '2020-12-17'),
    -- (36, 1, 'I don''t normally play on my laptop, but was ready to try out the demo this weekend while I was on holidays and was disappointed that it''s not able to be played on Mac OS X 10.15. Any chance of rebuilding the demo for the most recent Mac OS X update?', null, '2020-12-17'),
    -- (36, 2, 'It looks like the art book is strictly digital, is that correct?', null, '2020-12-17'),
    -- (36, 11, 'Behold, We have finally reached the 4th circle of heck, We now begin to drag ourselves over to the 5th circle and get try to hire some Succubi Interns to help handle the latest influx of sinners.', null, '2020-12-17'),
    -- (36, 3, 'Only final version of Hell will be on Mac OSX', 35, '2020-12-17'),
    -- (36, 3, 'correct', 36, '2020-12-17'),
    -- (36, 3, ':) We are waiting :)', 37, '2020-12-17'),
    -- (37, 3, 'Could the lion fountains be redesigned? Or some additional printing on them? They look a bit bland.', null, '2020-12-17'),
    -- (37, 2, 'Can you please offer the new artwork versions of the six original expansions as a standalone? Otherwise I will be buying the base game for the third time (my original purchase 15 years ago, the Revised Kickstarter from last year, and now this one). Thanks.', null, '2020-12-17'),
    -- (37, 1, 'There is a significant difference between how the punchboards are laid out for a base game, and how we have to lay them out for individual expansions, such that we would have to print them as totally different products. At the moment, we do not forsee enough demand for the expansions as stand alone products to warrant a new print run of them with the revised artwork, so we aren''t able to offer them as stand alones. (We might print them in the future, but we do not have plans to at this time).', 42, '2020-12-17'),
    -- (37, 2, 'Thanks for the reply. As long as you looked at laying out the expansions as their own punchboards and could not make that work, then I can understand this. My hope is that you did, in consideration of long-time fans of the game like me. I am fairly certain I am not alone in this.', 43, '2020-12-17'),
    (38, 1, 'It''s awesome that the stretch goals are going to be exclusives..is the maptile standee serve a purpose in the game? First player marker maybe?', null, '2020-12-17'),
    (38, 3, 'It''s great to see that such cool games as these are the second most backed and second most funded campaign in tabletop games right now!', null, '2020-12-17'),
    (38, 5, 'Will the slipcase has some cuts on the side so we can remove games from it without having to tip the whole box on an angle? Like a half circle so we can get purchase on the boxes inside.', null, '2020-12-17')
;
*/

/*
INSERT into perk (project_id, title, price, description)
VALUES
    -- (20, 'Workstation Combo - Super Early Bird *1', 690, 'Two Sizes to Choose(11"/12.9"). We will send you a survey to collect the size options and mailing address after the campaign ends. Will retail for $1180 | 37% off retail'),
    -- (21, 'Monument 2 SSD 1TB | Early Bird', 2990, 'Built-in 1TB SSD storage included. ◇ Taxes will be collected after the campaign. ◇ Pledge as a gift available.'),
    -- (22, 'Early Bird - ARCO 2-in-1', 2900, 'The 2-in-1 coffee grinder that will change the way you grind. Forever.'),
    -- (23, 'ALTO RENDIMIENTO', 1500, 'Regalos digitales exclusivos de este Kickstarte y con los primeros tomos de la historia de CARTA PRAT en eBook. Digital rewards exclusively made for this Kickstarter besides the first two book of the CARTA PRAT comic series.')
    -- (24, 'The Film (Download) & Backer Credit', 2500, 'All of the above, plus: 1. Digital download of the film, delivered after release date. 2. You will be credited as Backer in end credits of the film.')
    -- (25, 'Thank You in Our App!', 10000, 'Your name will be listed on a page in our exclusive festival mobile app, as well as on the big screen at the festival during the pre-show slides and on our website, plus you''ll get access to the backer updates.')
    -- (26, 'Sound of Detroit Digital album', 1500, 'Strata Records-The Sound Of Detroit-Reimagined By Jazzanova digital album. Be the first to receive an exclusive download of the album fresh after mastering!')
    -- (27, 'Music Pack', 3900, ''),
    -- (28, 'Signed Copy of the Album', 2000, '1 physical copy of the CD signed by Trio Ghidorah.'),
    -- (29, 'Original book designed by Jaroslav Benda', 2900, 'Receive a rare publication carefully selected from the author''s collection of Jaroslav Benda''s artworks, restored with the utmost care to perfect condition. Original language: Czech.')
    -- (30, 'Super Early Bird', 69999, 'Wholesale tire. This catchy, witty compilation of inventions, filled with beautiful illustrations, is a wonderful gift for collectors, enthusiasts, and curious minds. Shipping will be invoiced after the project ends. You can see shipping rates at the Shipping Rates section.')
    -- (31, 'Paperback', 49999, 'Insider access to project updates, your name listed as a backer in the book, the ebook, and a paperback copy of the book.')
    -- (36, 'EMPLOYER BRANDING SPECIALIST IN HELL', 5999999, 'We need new Architects of Hell. We hope that you and Lilith will be able to retrieve the lost souls!')
;
*/

INSERT into item (item_name, project_id)
VALUES
    ('MOFT Float', 20),
    ('MOFT Keyboard', 20),
    ('Monument 2', 21),
    ('Universal power supply', 21),
    ('Monument 2 SSD (1TB)', 21),
    ('Handle', 22),
    ('ARCO hand grinder', 22),
    ('ARCO electric dock', 22),
    ('Polaroids (Digital)', 23),
    ('Emilio''s Letter (Digital)', 23),
    ('Mailman Guide (Digital)', 23),
    ('Carta Prat Vol.1 & 2 (Digital)', 23),
    ('Online film screening, months ahead of release', 24),
    ('Digital download - The Film', 24),
    ('Backer credit in film', 24),
    ('Pledge without reward', 26),
    ('Endroll Credits', 27),
    ('VIP Newsletter Subscription', 27),
    ('Theme Song Early Access', 27),
    ('SONOCA Music Download Card Set', 27),
    ('Thank you card', 28),
    ('Digital album download', 28),
    ('Physical CD', 28),
    ('Thank you from the authors', 29),
    ('Your name in imprint of the book', 29),
    ('1 original book', 29),
    ('Digital version', 30),
    ('2 x The Book', 30),
    ('ebook version of The Fox''s Wedding', 31),
    ('paperback version of The Fox''s Wedding', 31),
    ('your name listed as a backer in the book', 31),
    ('Final PC Game digital download.', 35),
    ('Exclusive access to the game development', 35),
    ('Early access to updates, announcements, game footage...', 35),
    ('In-game ''Creator-Backer'' badge.', 35),
    ('FREE in-game store voucher, worth £20.', 35),
    ('Early access to the Hell Architect Prologue', 36),
    ('A name for one of the demons', 36),
    ('Your own painting - an in-game decor item', 36),
    ('LIVESTREAM WITH THE DEV TEAM', 36),
    ('4 more keys for your friends', 36),
    ('Physical game (in a BOX!)', 36)
;

--option_type   enum('size', 'color', 'storage')    not null,

INSERT into reward_item(perk_id, item_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (3, 2),
    (4, 3),
    (4, 4),
    (5, 4),
    (5, 5),
    (6, 6),
    (6, 7),
    (7, 6),
    (7, 7),
    (8, 6),
    (8, 7),
    (8, 8),
    (9, 9),
    (9, 10),
    (10, 9),
    (10, 10),
    (10, 11),
    (10, 12),
    (11, 13),
    (12, 13),
    (12, 14),
    (12, 15),
    (16, 16),
    (17, 17),
    (17, 18),
    (18, 17),
    (18, 18),
    (18, 19),
    (18, 20),
    (19, 21),
    (20, 21),
    (20, 22),
    (20, 23),
    (21, 24),
    (21, 25),
    (22, 24),
    (22, 25),
    (22, 26),
    (23, 27),
    (24, 28),
    (26, 29),
    (26, 30),
    (26, 31),
    (44, 32),
    (44, 33),
    (44, 34),
    (44, 35),
    (44, 36),
    (45, 37),
    (45, 38),
    (45, 39),
    (45, 40),
    (45, 41),
    (45, 42)
;




INSERT into item_option (item_id, option_provided)

INSERT into backed_project (backer_id, project_id, perk_id)


