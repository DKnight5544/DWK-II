
CREATE PROCEDURE [org].[AddSampleData]
AS



truncate table [org].[User]
insert into org.[User] (UserName, SponsorName, OwnerName)
select '@GoodKnightQuilts', '@GoodKnightQuilts','@GoodKnightQuilts'
;






