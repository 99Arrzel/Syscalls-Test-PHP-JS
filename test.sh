#!/bin/bash
total_calls_php=0
total_calls_js=0
for i in $(seq 1 10); do
  #clear
  (sh -c "echo 3 > /proc/sys/vm/drop_caches")
  output=$(strace -c php8.3 ./php/test.php 2>&1)
  calls=$(echo "$output" | grep 'total' | awk '{print $4}')
  total_calls_php=$((total_calls_php + calls))
done  

for i in $(seq 1 10); do
  #clear
  (sh -c "echo 3 > /proc/sys/vm/drop_caches")
  output=$(strace -c /home/link/.nvm/versions/node/v22.6.0/bin/node /home/link/link/syscallstest/js/test.mjs 2>&1)
  calls=$(echo "$output" | grep 'total' | awk '{print $4}')
  total_calls_js=$((total_calls_js + calls))
done  


avg_total_calls_php=$((total_calls_php / 10))
avg_total_calls_js=$((total_calls_js / 10))

echo "AVG Total calls php: $avg_total_calls_php"
echo "AVG Total calls js: $avg_total_calls_js"