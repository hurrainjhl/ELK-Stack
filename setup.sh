#!/bin/bash

# Step 1: Start Elasticsearch
cd path/to/elasticsearch/bin
./elasticsearch &

# Step 2: Start Kibana
cd path/to/kibana/bin
./kibana &

# Step 3: Start Logstash with sample configuration
cd path/to/logstash/bin
./logstash -f ../config/sample.conf
