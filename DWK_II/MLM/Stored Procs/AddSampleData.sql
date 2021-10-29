CREATE PROCEDURE [dbo].[AddSampleData]
AS



truncate table [mlm].[Users]

insert into mlm.users ([UserName], [UplineName])
select 'tonyw', 'TOP'
;


exec [mlm].[AddUser] 'tonyw', 'sendcash';

exec [mlm].[AddUser] 'sendcash', 'davidstoler';
exec [mlm].[AddUser] 'davidstoler', 'misbehavin';
exec [mlm].[AddUser] 'misbehavin', 'johnwalla';
exec [mlm].[AddUser] 'johnwalla', 'wigiwiz';
exec [mlm].[AddUser] 'wigiwiz', 'joleneknight';
exec [mlm].[AddUser] 'wigiwiz', 'dougraley';
exec [mlm].[AddUser] 'wigiwiz', 'truewealth';