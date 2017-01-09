FROM centos:centos6
MAINTAINER Jason Yang <jason-yang@live.ca>

# Install packages
RUN yum install -y mysql-server tar

# Remove pre-install database
RUN rm -rf /var/lib/mysql/*

# Add MYSQL configuration
RUN mkdir -p /etc/mysql/conf.d
RUN echo -e '\n!includedir /etc/mysql/conf.d'
ADD my.cnf /etc/mysql/conf.d/my.conf
ADD mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf

# Add MySQL scripts
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Expose ENV
ENV MYSQL_USER admin
ENV MYSQL_PASS **Random**

# Add VOLUMEs to allow backup of config and databases
VOLUME ["/etc/mysql","/var/lib/mysql"]

EXPOSE 3306
CMD ["/run.sh"]