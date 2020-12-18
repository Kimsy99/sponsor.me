create schema sponsorme;

create table user
(
    user_id                 int             not null    auto_increment,
    username                varchar(50)     not null,
    profile_picture_name    VARCHAR(100)    DEFAULT 'default_user_icon',
    password_hash           varchar(128)    not null,
    salt                    VARCHAR(512)    NOT NULL,
    email                   varchar(40)     not null,
    registration_date       DATE            NOT NULL,
    unique(username, email),
    primary key(user_id)
);

create table project
(
    project_id          int             not null    auto_increment,
    project_name        varchar(100)    not null,
    funding_goal        decimal(10, 2)  not null,
    small_description   text,
    category            enum('tech', 'design', 'film', 'art', 'publish', 'food', 'game')    not null,
    creator_id          int             not null,
    creation_date       date            not null,
    team                text,
    primary key(project_id),
    foreign key(creator_id) 
        references user(user_id)
        on delete cascade
);

create TABLE project_picture
(
    picture_id      INT             NOT NULL    AUTO_INCREMENT,
    project_id      INT             NOT NULL,
    picture_name    VARCHAR(100)    not null,
    primary key(picture_id),
    foreign key(project_id)
        references project(project_id)
        on delete cascade
);

create table campaign
(
    project_id          INT             NOT NULL,
    project_status      enum('concept', 'prototype', 'production', 'shipping')      not null,
    story               mediumTEXT      not null,
    primary key(project_id),
    foreign key(project_id)
        references project(project_id)
        on delete cascade
);

create table faq
(
    question_id         INT         AUTO_INCREMENT,
    project_id          INT         NOT NULL,
    question            TINYTEXT    NOT NULL,
    answer              TEXT        NOT NULL,
    primary key(question_id),
    foreign key(project_id) 
        REFERENCES project(project_id)
        ON DELETE CASCADE
);

create table comment
(
    comment_id          INT             AUTO_INCREMENT,
    project_id          INT             NOT NULL,
    user_id             INT             NOT NULL,
    comment             TEXT            NOT NULL,
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
        ON DELETE CASCADE
);

create table perk
(
    perk_id             INT             AUTO_INCREMENT,
    project_id          INT             NOT NULL,
    title               VARCHAR(100)    NOT NULL,
    price               DECIMAL(10, 2)  NOT NULL,
    description         TEXT,
    primary key(perk_id),
    foreign key(project_id) 
        REFERENCES project(project_id)
        ON DELETE CASCADE
);

create table item
(
    item_id             INT             AUTO_INCREMENT,
    item_name           VARCHAR(100)    NOT NULL,
    project_id          int             NOT NULL,
    primary key(item_id),
    FOREIGN KEY(project_id)
        REFERENCES project(project_id)
        on DELETE CASCADE
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
        ON DELETE CASCADE
);

create table item_option
(
    option_id           INT         AUTO_INCREMENT,
    item_id             INT         NOT NULL,
    option_provided     TINYTEXT    NOT NULL,
    primary key(option_id),
    foreign key(item_id) 
        REFERENCES item(item_id)
        ON DELETE CASCADE
);

create table backed_project
(
    id              INT             NOT NULL    AUTO_INCREMENT,
    backer_id       INT,
    project_id      INT             NOT NULL,
    perk_id         INT             NOT NULL,
    backed_amount   DECIMAL(10,2)   NOT NULL,
    primary key(id),
    foreign key(backer_id) 
        REFERENCES user(user_id)
        ON DELETE SET NULL,
    foreign key(project_id) 
        REFERENCES project(project_id)
        ON DELETE CASCADE,
    foreign key(perk_id)
        REFERENCES perk(perk_id)
        ON DELETE RESTRICT
);

create TRIGGER Backed_amount_check
Before insert on backed_project
for each ROW
if new.backed_amount < (
                            select price
                            from perk
                            where perk_id = new.perk_id
                        )
then set new.backed_amount = (
                                select price
                                from perk
                                where perk_id = new.perk_id
                            );
                            END IF;

create TRIGGER Backed_amount_update_check
Before update on backed_project
for each ROW
if new.backed_amount < (
                            select price
                            from perk
                            where perk_id = new.perk_id
                        )
then set new.backed_amount = (
                                select price
                                from perk
                                where perk_id = new.perk_id
                            );
                            END IF;

create TRIGGER Backed_project_insertion_check
Before insert on backed_project
for each ROW
if new.project_id != (
                            select project_id
                            from perk
                            where perk_id = new.perk_id
                        )
then set new.project_id = (
                                select project_id
                                from perk
                                where perk_id = new.perk_id
                            );
END IF;

create TRIGGER Backed_project_update_check
Before update on backed_project
for each ROW
if new.project_id != (
                            select project_id
                            from perk
                            where perk_id = new.perk_id
                        )
then set new.project_id = (
                                select project_id
                                from perk
                                where perk_id = new.perk_id
                            );
END IF;

-- admin
create table admin
(
    admin_id                int             not null    auto_increment,
    name                    varchar(50)     not null,
    password_hash           varchar(128)    not null,
    salt                    VARCHAR(512)    NOT NULL,
    email                   varchar(40)     not null,
    unique(name, email),
    primary key(admin_id)
);

