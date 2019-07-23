# 创建privilege.sql文件
cat > /entrypoint/privileges.sql << EOF
use mysql;
grant all privileges on *.* to 'root'@'%' identified by '${MYSQL_USER_PASSWORD}' with grant option;
flush privileges;
EOF
# mysql初始化
mysql_install_db --user=mysql
mysqld_safe &
sleep 10s
mysql < /entrypoint/privileges.sql
mysql -u root -p ${MYSQL_USER_PASSWORD} -e "select version();"
if [[ $? == 0 ]];then
    echo "running..."
    sleep 10s
else:
    echo "stoped..."
fi