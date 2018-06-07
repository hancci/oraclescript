set linesize 200
set pagesize 10000
set long 3000
--set time on
set timing on
set trimspool on
set feedback 1
--set null <null>
--SET SERVEROUTPUT ON
DEFINE _EDITOR = vi

col table_name format a30
col index_name format a30
col tablespace_name format a20
col column_name format a20
col low_value format a20
col high_value format a20
col owner format a20
col username format a20
col name format a30
col tname format a30
col segment_name format a30
col partition_name format a30
col histogram format a20
col pid format a10
col host format a30
col db_link format a30
col member format a30
col action for a33

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'YYYY/MM/DD HH24:MI:SS.FF';

select s.sid, s.serial#,
    (select spid from v$process p where p.addr = s.paddr) as "PID(SPID)"
from v$session s
where sid = (select sid from v$mystat where rownum = 1);

clear buffer
--set sqlprompt '_DATE &_USER.@&_CONNECT_IDENTIFIER > '
set sqlprompt '&_USER.@&_CONNECT_IDENTIFIER > '
set echo on