FROM migrate/migrate:v4.10.0

USER root
RUN apk update && apk add unzip && apk add bash && apk add jq

# Terraform 0.14.4
ADD https://releases.hashicorp.com/terraform/0.14.4/terraform_0.14.4_linux_amd64.zip /usr/local/bin
RUN unzip /usr/local/bin/terraform_0.14.4_linux_amd64.zip -d /usr/local/bin/ && rm /usr/local/bin/terraform_0.14.4_linux_amd64.zip

# Cloudsql proxy
ADD https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 /usr/local/bin
RUN mv /usr/local/bin/cloud_sql_proxy.linux.amd64 /usr/local/bin/cloud-sql-proxy && chmod +x /usr/local/bin/cloud-sql-proxy
