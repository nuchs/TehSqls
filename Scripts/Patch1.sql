USE TestDB
GO

CREATE PROCEDURE Report
AS
BEGIN
    SELECT
        p.Name,
        p.Colour,
        s.Count
    FROM
        Products p
    JOIN Stock s ON p.Id = s.ProductId
    ORDER BY
        p.Name ASC
END
