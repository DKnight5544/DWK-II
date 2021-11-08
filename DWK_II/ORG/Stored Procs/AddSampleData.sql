
CREATE PROCEDURE [org].[AddSampleData]
AS



truncate table [org].[User]
insert into org.[User] (UserName, SponsorName, OwnerName)
select 'WIGIWIZ', 'WIGIWIZ','WIGIWIZ'
;


exec [org].[AddUser] 'WIGIWIZ', 'DOUGRALEY';
exec [org].[AddUser] 'WIGIWIZ', 'JOLENEKNIGHT';




