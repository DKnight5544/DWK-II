CREATE PROCEDURE [org].[AddSampleData]
AS



truncate table [org].[User]


insert into org.[User] (UserName, SponsorName, OwnerName)
select 'AAA', 'AAA','AAA'
;


exec [org].[AddUser] 'AAA', 'BBB';
exec [org].[AddUser] 'AAA', 'CCC';
exec [org].[AddUser] 'AAA', 'DDD';

exec [org].[AddUser] 'BBB', 'EEE';
exec [org].[AddUser] 'BBB', 'FFF';
exec [org].[AddUser] 'BBB', 'GGG';

exec [org].[AddUser] 'CCC', 'HHH';
exec [org].[AddUser] 'CCC', 'III';
exec [org].[AddUser] 'CCC', 'JJJ';


exec [org].[AddUser] 'DDD', 'KKK';
exec [org].[AddUser] 'DDD', 'LLL';
exec [org].[AddUser] 'DDD', 'MMM';


exec [org].[AddUser] 'EEE', 'NNN';
exec [org].[AddUser] 'EEE', 'OOO';
exec [org].[AddUser] 'EEE', 'PPP';




