
-- Project Title: "Quote Insights – SQL Analysis on AUTHORS Dataset"

create database BuildWeek;
USE BuildWeek;

-- 1. How many total quotes are in the dataset?

SELECT COUNT(*) AS total_quotes FROM AUTHORS;

-- Conclusion -> There are 100 Quotes that are present in dataset

-- 2. How many unique authors are there?

SELECT COUNT(DISTINCT author) AS unique_authors FROM AUTHORS;

-- Conclusion -> There are 50 Unique Authors are in Dataset

-- 3. List all unique authors.

SELECT DISTINCT author FROM AUTHORS;

-- 4. Who has the most quotes?

SELECT author, COUNT(*) AS quote_count
FROM AUTHORS
GROUP BY author
ORDER BY quote_count DESC
LIMIT 5;

-- Conclusion -> Albert Einstein has the most Quotes.

-- 5. Which quotes contain the word 'life'?

SELECT quote FROM AUTHORS
WHERE quote LIKE '%life%';

-- Conclusion -> There are 10 Quotes that contains the word 'Life'.

-- 6. How many Quotes have no tags?

SELECT COUNT(*) as without_tags FROM authors
WHERE tags = 'NA';

-- Conclusion -> There are 3 Quotes that donts have tags.

-- 7. What are the top 10 most frequently appearing tags?

SELECT tag, COUNT(*) AS tag_count FROM (
    SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(tags, ',', numbers.n), ',', -1)) AS tag
    FROM Authors
    JOIN (
        SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
        UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10
    ) numbers
    ON CHAR_LENGTH(tags) - CHAR_LENGTH(REPLACE(tags, ',', '')) >= numbers.n - 1
) tag_list
GROUP BY tag
ORDER BY tag_count DESC
LIMIT 10;

-- Conclusion -> 'Love' is the most frequently appearing tag.

-- 8. The longest Quotes with Author.

SELECT AUTHOR, QUOTE, LENGTH(QUOTE) as QUOTE_LENGTH
FROM AUTHORS
order by LENGTH(QUOTE) desc
limit 1;

-- Conclusion -> Marilyn Monroe have written the longest Quote. 

-- 9. Authors who have only one quote.

SELECT author
FROM AUTHORS
GROUP BY author
HAVING COUNT(*) = 1;

-- Conclusion -> There are 35 Authors who have only one Quote. 

-- 10. Find authors who have more than 5 quotes.

SELECT AUTHOR
FROM AUTHORS
GROUP BY AUTHOR
HAVING COUNT(*) > 5
ORDER BY COUNT(*)  DESC;

-- Conclusion -> There are 5 Authors that have Quotes more than 5. 

-- 11. Who written a shortest Quotes

SELECT AUTHOR, QUOTE, LENGTH(QUOTE) as QUOTE_LENGTH
FROM AUTHORS
order by LENGTH(QUOTE) asc
limit 1;

-- onclusion -> Stephenie Meyer written a shortest Quotes.

 

/*

                                           <--  Final Conclusion  -->

1. There are 100 Quotes that are present in dataset.
2. There are total 50 Unique Authors are present in Dataset.
3. The most quoted author on the website is Albert Einstein.

4. The most used tag is Love.
5. There are 10 Quotes that contains the word 'Life'.
6. There are 3 Quotes that donts have tags.
7. The longest quote on the website is 'This life is what you make it. No matter what, you're going to mess up sometimes, it's a universal truth. But the good part is you get to decide how you're going to mess it up. Girls will be your friends - they'll act like it anyway. But just remember, some come, some go. The ones that stay with you through everything - they're your true best friends. Don't let go of them. Also remember, sisters make the best friends in the world. As for lovers, well, they'll come and go too. And baby, I hate to say it, most of them - actually pretty much all of them are going to break your heart, but you can't give up because if you give up, you'll never find your soulmate. You'll never find that half who makes you whole and that goes for everything. Just because you fail once, doesn't mean you're gonna fail at everything. Keep trying, hold on, and always, always, always believe in yourself, because if you don't, then who will, sweetie? So keep your head high, keep your chin up, and most importantly, keep smiling, because life's a beautiful thing and there's so much to smile about.' by 'Marilyn Monroe'.
8. The shortest quote on the website is 'He's like a drug for you, Bella.' by 'Stephenie Meyer'
9.. There are 35 Authors who have only one Quote.
10. There are 5 Authors('Albert Einstein', 'J.K. Rowling', 'Marilyn Monroe', 'Dr. Seuss', 'Mark Twain') that have Quotes more than 5.

*/



 
