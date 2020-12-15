/*INSERT into USER 
    (username, user_password, email)
VALUES
    ('TuanHong', 'admin', 'tuanhong@sponsorme.com'),
    ('Kenneth', 'admin', 'kenneth@sponsorme.com'),
    ('Kim', 'admin', 'kim@sponsorme.com'),
    ('hanmeimei', 'hanmeimei', 'hanmeimei@gmail.com'),
    ('moft', 'moft', 'moft@gmail.com');*/

INSERT into USER 
    (username, user_password, email)
VALUES
    ('ximena', 'ximena', 'ximena@gmail.com');

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
        6,
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
        'Hatsune Miku Global Concert ""HATSUNE MIKU EXPO 2021 Online""',
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

--category    enum('tech', 'design', 'film', 'art', 'publish', 'food', 'game')    not null,

INSERT into campaign (project_id, project_status, story)

--project_status    enum('concept', 'prototype', 'production', 'shipping')      not null,

INSERT into faq (project_id, question, answer)

INSERT into comment (project_id, user_id, COMMENT, parent_comment, COMMENT_date)

INSERT into perk (project_id, title, price)

INSERT into item (item_name, option_type)

--option_type   enum('size', 'color', 'storage')    not null,

INSERT into reward_item(perk_id, item_id)

INSERT into item_option (item_id, option_provided)

INSERT into backed_project (backer_id, project_id, perk_id)


