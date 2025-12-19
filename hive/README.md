# Environment File `/var/container/hive/env.sh`

```sh
SERVICE_OPTS=-Djavax.jdo.option.ConnectionDriverName=org.postgresql.Driver -Djavax.jdo.option.ConnectionURL=jdbc:postgresql://postgres.saoirse.home.arpa:5432/metastore_db -Djavax.jdo.option.ConnectionUserName=<username> -Djavax.jdo.option.ConnectionPassword=<password>
S3_ENDPOINT_URL=http://ozone-gateway.saoirse.home.arpa:9878
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
DEFAULT_FS=s3a://hive
HIVE_WAREHOUSE_PATH=/warehouse
HADOOP_CLASSPATH=/opt/hadoop/share/hadoop/tools/lib/*
SERVICE_NAME=metastore
DB_DRIVER=postgres
IS_RESUME=true
```

Set `IS_RESUME` to `false` when running the first time.

# Metastore config `metastore-site.xml`

```xml
<configuration>
    <property>
       <name>hive.metastore.pre.event.listeners</name>
       <value>org.apache.hadoop.hive.ql.security.authorization.AuthorizationPreEventListener</value>
    </property>
    <property>
       <name>hive.security.metastore.authorization.manager</name>
       <value>org.apache.hadoop.hive.ql.security.authorization.StorageBasedAuthorizationProvider</value>
    </property>
    <property>
        <name>metastore.thrift.uris</name>
        <value>thrift://hive-hms.saoirse.home.arpa:9083</value>
        <description>Thrift URI for the remote metastore. Used by metastore client to connect to remote metastore.</description>
    </property>

    <property>
        <name>fs.s3a.access.key</name>
        <value></value>
    </property>
    <property>
        <name>fs.s3a.secret.key</name>
        <value></value>
    </property>
    <property>
        <name>fs.s3a.endpoint</name>
        <value>http://ozone-gateway.saoirse.home.arpa:9878</value>
    </property>
    <property>
        <name>fs.s3a.path.style.access</name>
        <value>true</value>
    </property>

</configuration>
```