create schema sponsorme authorization 'root';

create table user
(
    user_id             int             not null    auto_increment,
    user_name           varchar(50)     not null,
    profile_picture     mediumblob,
    user_password       varchar(30)     not null,
    email               varchar(40)     not null,
    unique(username, email),
    primary key(user_id),
);

create table project
(
    project_id          int             not null    auto_increment,
    project_name        varchar(50)     not null,
    funding_goal        decimal(10, 2)  not null,
    small_description   mediumtext,
    category            enum('tech', 'design', 'film', 'art', 'publish', 'food', 'game')    not null,
    creator_id          int             not null,
    creation_date       date            not null,
    primary key(project_id),
    foreign key(creator_id) 
        references user(user_id)
        on delete cascade,
);

create TABLE project_picture
(
    picture_id      INT         NOT NULL    AUTO_INCREMENT,
    project_id      INT         NOT NULL,
    picture         mediumblob  not null,
    primary key(picture_id),
    foreign key(project_id)
        references project(project_id)
        on delete cascade,
);

create table backed_project
(
    id              INT     NOT NULL    AUTO_INCREMENT,
    backer_id       INT     NOT NULL,
    project_id      INT     NOT NULL,
    perk_id         INT     NOT NULL,
    primary key(id),
    foreign key(backer_id) 
        REFERENCES user(user_id)
        ON DELETE SET NULL,
    foreign key(project_id) 
        REFERENCES project(project_id)
        ON DELETE CASCADE,
    foreign key(perk_id)
        REFERENCES perk(perk_id)
        ON DELETE RESTRICT,
);

create table campaign
(
    project_id          INT         NOT NULL,
    project_status      enum('concept', 'prototype', 'production', 'shipping')      not null,
    story               LONGTEXT    not null,
    primary key(project_id),
    foreign key(project_id)
        references project(project_id)
        on delete cascade,
);

create table faq
(
    question_id         INT         AUTO_INCREMENT,
    project_id          INT         NOT NULL,
    question            TINYTEXT    NOT NULL,
    answer              MEDIUMTEXT  NOT NULL,
    primary key(question_id),
    foreign key(project_id) 
        REFERENCES project(project_id)
        ON DELETE CASCADE,
);

create table comment
(
    comment_id          INT             AUTO_INCREMENT,
    project_id          INT             NOT NULL,
    user_id             INT             NOT NULL,
    comment             MEDIUMTEXT      NOT NULL,
    parent_comment      INT,
    comment_date        DATE            NOT NULL,
    primary key(comment_id),
    foreign key(project_id) 
        REFERENCES project(project_id)
        ON DELETE CASCADE,
    foreign key(user_id) 
        REFERENCES user(user_id)
        ON DELETE CASCADE,
    foreign key(parent_comment)
        REFERENCES comment(comment_id)
        ON DELETE CASCADE,
);

create table perk
(
    perk_id             INT             AUTO_INCREMENT,
    project_id          INT             NOT NULL,
    title               VARCHAR(100)    NOT NULL,
    price               DECIMAL(10, 2)  NOT NULL,
    description         TINYTEXT,
    primary key(perk_id),
    foreign key(project_id) 
        REFERENCES project(project_id)
        ON DELETE CASCADE,
);



create table reward_item
(
    perk_id     INT     NOT NULL,
    item_id     INT     NOT NULL,
    primary key(perk_id, item_id),
    foreign key(perk_id) 
        REFERENCES perk(perk_id)
        ON DELETE CASCADE,
    foreign key(item_id) 
        REFERENCES item(item_id)
        ON DELETE CASCADE,
);

create table item
(
    item_id             INT             AUTO_INCREMENT,
    item_name           VARCHAR(50)     NOT NULL,
    option_type         enum('size', 'color', 'storage')    not null,
    primary key(item_id),
    foreign key(item_id) 
        references reward_item(item_id)
        on delete cascade,
);

create table item_option
(
    option_id           INT         AUTO_INCREMENT,
    item_id             INT         NOT NULL,
    option_provided     TINYTEXT    NOT NULL,
    primary key(option_id),
    foreign key(item_id) 
        REFERENCES item(item_id)
        ON DELETE CASCADE,
);
