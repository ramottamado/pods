# Environment File `/var/container/hive/env.sh`

```sh
S3_ENDPOINT_URL=http://s3.saoirse.home.arpa
DEFAULT_FS=s3a://<bucket_name>
HIVE_SERVER2_THRIFT_PORT=10000
HIVE_WAREHOUSE_PATH=/warehouse
HADOOP_CLASSPATH=/opt/hadoop/share/hadoop/tools/lib/*
DB_DRIVER=postgres
IS_RESUME=true
```

Set `IS_RESUME` to `false` when running the first time.

# Metastore config `metastore-site.xml`

```xml
<configuration>

    <property>
        <name>javax.jdo.option.ConnectionDriverName</name>
        <value>org.postgresql.Driver</value>
    </property>

    <property>
        <name>javax.jdo.option.ConnectionURL</name>
        <value>jdbc:postgresql://postgres.saoirse.home.arpa:5432/metastore_db</value>
    </property>

    <property>
        <name>javax.jdo.option.ConnectionUserName</name>
        <value></value>
    </property>

    <property>
        <name>javax.jdo.option.ConnectionPassword</name>
        <value></value>
    </property>

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
        <value>thrift://hive.saoirse.home.arpa:9083</value>
        <description>Thrift URI for the remote metastore. Used by metastore client to connect to remote metastore.</description>
    </property>

    <property>
        <name>fs.s3a.endpoint.region</name>
        <value>us-east-1</value>
        <description>AWS Region of the data</description>
    </property>

    <property>
        <name>fs.s3a.path.style.access</name>
        <value>true</value>
    </property>

</configuration>
```