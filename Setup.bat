@echo off
REM Step 1: Start Elasticsearch
cd path\to\elasticsearch\bin
start elasticsearch.bat

REM Step 2: Start Kibana
cd path\to\kibana\bin
start kibana.bat

REM Step 3: Start Logstash with sample configuration
cd path\to\logstash\bin
logstash.bat -f ..\config\sample.conf
