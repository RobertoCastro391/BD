USE pubs;
GO


--Ex 6.1

--a)
-- SELECT *
--    FROM authors

--b)

-- SELECT au_fname, au_lname, phone 
--    FROM authors

--c)
   -- SELECT au_fname, au_lname, phone 
   --    FROM authors
   --    ORDER BY au_fname,au_lname ASC

--d)
   -- SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone
   --    FROM authors
   --    ORDER BY au_fname,au_lname ASC

--e)
   -- SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone
   --    FROM authors
   --    WHERE state='CA' and au_lname!='Ringer'
   --    ORDER BY au_fname,au_lname ASC

--f)
   -- SELECT *
   --    FROM publishers 
   --    WHERE pub_name LIKE '%Bo%'

--g)
   -- SELECT DISTINCT pub_name
   --    FROM publishers, titles
   --    WHERE type='Business' and publishers.pub_id=titles.pub_id

--h)
   -- SELECT publishers.pub_name, SUM(sales.qty) AS TotalVendas
   --    FROM sales
   --       INNER JOIN titles ON sales.title_id = titles.title_id
   --       INNER JOIN publishers ON titles.pub_id = publishers.pub_id
   --    GROUP BY publishers.pub_name

--i)
   -- SELECT publishers.pub_name, titles.title, SUM(sales.qty) AS TotalVendas
   --    FROM sales
   --       INNER JOIN titles ON sales.title_id = titles.title_id
   --       INNER JOIN publishers ON titles.pub_id = publishers.pub_id
   --    GROUP BY publishers.pub_name, titles.title
   --    ORDER BY publishers.pub_name, titles.title

--j)
   -- SELECT title
   --    FROM titles
   --       INNER JOIN sales ON titles.title_id=sales.title_id
   --       INNER JOIN stores ON sales.stor_id=stores.stor_id
   --       WHERE stor_name = 'Bookbeat';

--k)
   --SELECT au_fname,au_lname
   --   FROM ((authors JOIN titleauthor ON authors.au_id=titleauthor.au_id) JOIN titles ON titles.title_id=titleauthor.title_id)
   --   GROUP BY au_fname,au_lname
   --   HAVING COUNT(DISTINCT type)>1

--l)
   -- SELECT titles.type, publishers.pub_id, AVG(titles.price) as precoMedio, SUM(sales.qty) as NumTotalVendas
   --    FROM ((sales JOIN titles ON titles.title_id=sales.title_id) JOIN publishers ON publishers.pub_id=titles.pub_id)
   --    GROUP BY titles.type, publishers.pub_id
   --    ORDER BY titles.type, publishers.pub_id

--m)
   -- SELECT type
   --    FROM titles
   --    GROUP BY type
   --    HAVING MAX(advance)>1.5*AVG(advance)

--n)
   --SELECT titles.title, authors.au_fname + ' ' + authors.au_lname AS name, titles.price * titles.royalty * titleauthor.royaltyper * titles.ytd_sales / 100 / 100 AS profit
   --   FROM ((authors JOIN titleauthor ON titleauthor.au_id=authors.au_id) JOIN titles ON titles.title_id=titleauthor.title_id)

--o)
   -- SELECT titles.title, titles.ytd_sales, titles.ytd_sales*titles.price AS FaturacaoTotal, 
   --    titles.ytd_sales*titles.price * titles.royalty/100 AS FaturacaoAutores,
   --    titles.ytd_sales*titles.price-titles.price*titles.ytd_sales*titles.royalty/100 AS FaturacaoEditora
   --    FROM titles
   --    ORDER BY titles.title

--p)
   -- SELECT titles.title, titles.ytd_sales, authors.au_fname + ' ' + authors.au_lname as author,
   --    titles.ytd_sales*titles.price * titles.royalty*titleauthor.royaltyper/100/100 AS auth_revenue,
   --    titles.ytd_sales*titles.price-titles.price*titles.ytd_sales*titles.royalty/100 AS publisher_revenue
   --    FROM ((titles JOIN titleauthor ON titleauthor.title_id=titles.title_id) JOIN authors ON authors.au_id=titleauthor.au_id)
   --    ORDER BY titles.title

--q)
   -- SELECT stores.stor_name
   --    FROM ((stores JOIN sales ON sales.stor_id=stores.stor_id) JOIN titles ON titles.title_id=sales.title_id)
   --    GROUP BY stores.stor_name
   --    HAVING COUNT(titles.title)=(SELECT COUNT(titles.id) FROM titles)

--r)
   -- SELECT stores.stor_name, SUM(sales.qty)
   --    FROM ((stores JOIN sales ON sales.stor_id=stores.stor_id) JOIN titles ON titles.title_id=sales.title_id)
   --    GROUP BY stores.stor_name
   --    HAVING SUM(sales.qty)>(SELECT SUM(sales.qty)/COUNT(stor_id) FROM sales);

--s)
   -- SELECT titles.title
   --    FROM titles
   --    WHERE titles.title_id NOT IN (SELECT title_id FROM (sales JOIN stores ON stores.stor_id=sales.stor_id) WHERE stores.stor_name!='Bookbeat')

--t)
   -- (SELECT pub_name, stor_name
   --    FROM publishers, stores
   --    GROUP BY pub_name, stor_name)
   -- EXCEPT
   -- (SELECT pub_name, stor_name
   --    FROM (((publishers	JOIN titles ON publishers.pub_id=titles.pub_id) JOIN sales  ON titles.title_id=sales.title_id) JOIN stores ON sales.stor_id=stores.stor_id)
   --    GROUP BY pub_name, stor_name)


