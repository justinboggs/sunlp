SELECT * FROM factsalestransaction

SELECT * FROM dimlocation

SELECT locationid, saledate, SUM(totalsaleamount), SUM(dispensed_fuel_additives_amount), SUM(dispensed_fuel_additives_quantity),
	SUM(merchandise_amount), SUM(merchandise_quantity)
FROM factsalestransaction
GROUP BY locationid, saledate

ALTER TABLE factsalestransaction
ALTER COLUMN totalsaleamount TYPE DEC

ALTER TABLE factsalestransaction
ALTER COLUMN merchandise_amount
TYPE DEC USING (TRIM(merchandise_amount)::decimal)

ALTER TABLE dimlocation
ALTER COLUMN shiptonumber
TYPE INT USING (TRIM(shiptonumber)::integer)

SELECT * FROM factsalestransaction
LEFT JOIN dimlocation
ON factsalestransaction.shipto=dimlocation.shiptonumber