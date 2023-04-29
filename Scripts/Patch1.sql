USE TestDB
GO

CREATE PROCEDURE test.Report
AS
BEGIN
    SELECT
        p.Name,
        p.Colour,
        s.Count
    FROM
        test.Products p
    JOIN test.Stock s ON p.Id = s.ProductId
    ORDER BY
        p.Name ASC
END
