create user 'sqlteacher'@'localhost' identified by '123456';
grant select on library.*
to 'sqlteacher'@'localhost';
grant insert,delete,update on library.book
to 'sqlteacher'@'localhost';

alter user 'sqlteacher'@'localhost' identified by 't123';

revoke select on library.*
from 'sqlteacher'@'localhost';

create role 'librrole'@'localhost';
grant 'librrole'@'localhost' to 'sqlteacher'@'localhost';

grant select on library.* 
to 'librrole'@'localhost';

set global activate_all_roles_on_login = on;

revoke select on library.* from 'librrole'@'localhost';

drop user 'sqladmin'@'localhost';

drop role 'librrole'@'localhost';

drop user 'sqlteacher'@'localhost';
