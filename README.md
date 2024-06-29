# ElasticSearch-Stack
### Step by Step to set up the ELK stack:
# Elasticsearch, Kibana, and Logstash Installation Guide

## Step 1: Install

Download Elasticsearch, Kibana, and Logstash from the following links:

- [Elasticsearch 8.3.2](https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.3.2-windows-x86_64.zip)
- [Kibana 8.3.2](https://artifacts.elastic.co/downloads/kibana/kibana-8.3.2-windows-x86_64.zip)
- [Logstash 8.3.2](https://artifacts.elastic.co/downloads/logstash/logstash-8.3.2-windows-x86_64.zip)

---

## Step 2: Unzip

Unzip the downloaded files and create folders for each unzipped file.

---

## Step 3: Installation Steps

Refer to the official guide for installing Elasticsearch on Windows:

[Elasticsearch Installation Guide](https://www.elastic.co/guide/en/elasticsearch/reference/current/zip-windows.html)

---

## Step 4: Configuration After Unzipping

1. Open Command Prompt (cmd).
2. Navigate to the directory where Elasticsearch is located and change directory to the `bin` folder.
3. Edit the `elasticsearch.yml` file located in the `config` folder and add the following line:

    ```yaml
    action.auto_create_index: .monitoring*,.watches,.triggered_watches,.watcher-history*,.ml*
    ```

---

## Step 5: Get the Token

1. Start Elasticsearch in Command Prompt by running:

    ```sh
    elasticsearch.bat
    ```

2. Once you see the token, press `CTRL + C` to stop it, and copy and paste the token.
3. Open the `elasticsearch.yml` file again and set the following to false:

    ```yaml
    xpack.security.enabled: false
    ```

4. Start Elasticsearch again:

    ```sh
    elasticsearch.bat
    ```

5. Add the following lines to `elasticsearch.yml`:

    ```yaml
    xpack.security.http.ssl:
        enabled: false
        keystore.path: certs/http.p12

    xpack.security.transport.ssl:
        enabled: false
        verification_mode: certificate
        keystore.path: certs/transport.p12
        truststore.path: certs/transport.p12
    ```

---

## Step 6: Reset Passwords for Elastic User and Kibana System

1. Go to the `bin` directory in Command Prompt.
2. Run the following commands and note down the passwords:

    ```sh
    elasticsearch-reset-password -u elastic
    elasticsearch-reset-password -u kibana_system
    ```

---

## Step 7: Uncomment Settings in Kibana

1. Open the `kibana.yml` file.
2. Uncomment and set the following lines:

    ```yaml
    server.port: 5601
    server.host: "localhost"
    elasticsearch.hosts: ["http://localhost:9200"]
    elasticsearch.username: "kibana_system"
    elasticsearch.password: "Password"  # Add the password for kibana_system
    ```

3. Save the file.

---

## Step 8: Create Logstash Configuration File
Create a Logstash configuration file (e.g., `logstash.conf`) with the following content:

```yaml
input {
  stdin { }
}

output {
  stdout {
    codec => rubydebug
  }
  elasticsearch {
    hosts => ["http://localhost:9200"]
    index => "test.logstash"
    user => "elastic"
    password => "YourElasticPassword"  # Use the password for Elasticsearch noted down earlier
  }
} 
```




## Step 9: Open Elasticsearch and Kibana in Browser

1. Run Elasticsearch, then open Chrome and navigate to [http://localhost:9200](http://localhost:9200) or [https://localhost:9200](https://localhost:9200).

2. Run Kibana by navigating to the `bin` directory in Command Prompt and running:

    ```sh
    kibana.bat
    ```

3. Open a new tab in Chrome and navigate to [http://localhost:5601](http://localhost:5601) or [https://localhost:5601](https://localhost:5601).

---

## Step 10: Create Sample Logstash Configuration File

1. Create a file named `sample.conf` inside `XXXXX\LogStash\logstash-8.2.3\config`.
2. Add the following content to `sample.conf`:

    ```yaml
    input {
      stdin { }
    }

    output {
      elasticsearch {
        hosts => ["http://localhost:9200"]
        index => "hellodb"
      }
    }
    ```

---

## Step 11: Run Logstash

1. Open Command Prompt.
2. Navigate to the Logstash directory and change directory to `bin`.
3. Run the following command:

    ```sh
    logstash.bat -f .\config\sample.conf
    ```

---

This Markdown document is now structured and formatted for clarity, making it easier to follow the installation and configuration steps.





