-- practice
SELECT users.first_name, users.last_name, user2.first_name AS friend_first_name, user2.last_name AS friend_last_name
FROM users 
JOIN friendships ON friendships.friend_1_id = users.id 
JOIN users as user2 ON user2.id = friendships.friend_2_id
WHERE users.first_name != 'Kermit';

-- 1. Return all users who are friends with Kermit, make sure their names are displayed in results.

-- call users who are friends with Kermit on column friend_id_1
SELECT users.first_name, users.last_name
FROM users
LEFT JOIN friendships ON friendships.friend_1_id = users.id
WHERE friendships.friend_2_id = 4
UNION ALL
-- call users who are friends with Kermit on column friend_id_2
SELECT users.first_name, users.last_name
FROM users
LEFT JOIN friendships ON friendships.friend_2_id = users.id
WHERE friendships.friend_1_id = 4

-- 2. Return the count of all friendships.
SELECT users.first_name, last_name, COUNT(users.id) AS friend_number
FROM users
-- Join all friend_1/2_id number to user id
LEFT JOIN friendships ON friendships.friend_1_id = users.id OR friendships.friend_2_id = users.id
-- count by first name and group by id/(first name works too).
GROUP BY users.id

-- 3.Find out who has the most friends and return the count of their friends.
SELECT users.first_name, last_name, COUNT(users.id) AS friend_number
FROM users
LEFT JOIN friendships ON friendships.friend_1_id = users.id OR friendships.friend_2_id = users.id
GROUP BY users.id
ORDER BY friend_number DESC

-- 4. Create a new user and make them friends with Eli Byers, Kermit The Frog, and Marky Mark.
INSERT INTO users (id, first_name, last_name) 
VALUES(6, 'new', 'user');
INSERT INTO friendships (friend_id_1, friend_id_2) 
VALUES(6, 2);
INSERT INTO friendships (friend_id_1, friend_id_2) 
VALUES(6, 4);
INSERT INTO friendships (friend_id_1, friend_id_2) 
VALUES(6, 5);
-- 5.Return the friends of Eli in alphabetical order.
SELECT users.first_name, users.last_name
FROM users
LEFT JOIN friendships ON friendships.friend_1_id = users.id
WHERE friendships.friend_2_id = 2
UNION ALL
SELECT users.first_name, users.last_name
FROM users
LEFT JOIN friendships ON friendships.friend_2_id = users.id
WHERE friendships.friend_1_id = 2
ORDER BY first_name ASC

-- 6. Remove Marky Marky from Eli’s friends.
DELETE FROM friendships WHERE friendships.friend_id_1 = 2 AND friendships.friend_id_2 = 5

-- 7. Return all friendships, displaying just the first and last name of both friends.
SELECT users.first_name, users.last_name, user2.first_name AS friend_first_name, user2.last_name AS friend_last_name
FROM users 
JOIN friendships ON friendships.friend_1_id = users.id 
JOIN users as user2 ON user2.id = friendships.friend_2_id

