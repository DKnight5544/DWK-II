CREATE PROCEDURE [mlm].[AddSampleData]
AS



truncate table [mlm].[Users]

insert into mlm.Users ([UserName], [UplineName])
select 'TONYW', 'TOP'
;


exec [mlm].[AddUser] 'tonyw', 'sendcash';
exec [mlm].[AddUser] 'sendcash', 'davidstoler';
exec [mlm].[AddUser] 'davidstoler', 'misbehavin';
exec [mlm].[AddUser] 'misbehavin', 'johnwalla';
exec [mlm].[AddUser] 'johnwalla', 'wigiwiz';