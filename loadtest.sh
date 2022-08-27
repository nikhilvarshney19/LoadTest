#!/bin/bash
echo "Enter your Aggregate Report Name"
read Aggregatereportname
echo "Enter your Response code Report Name"
read ResponseCodereportname
cd /usr/bin/Performance/CMD/apache-jmeter-5.4.3/bin
rm -rf test.csv
nohup sh jmeter.sh -n -t /usr/bin/Jmeter/leapx-backstage-docs/LoadTest/LoadTest.jmx

cd /usr/bin/Performance/CMD/apache-jmeter-5.4.3/lib
java -jar cmdrunner-2.2.jar  --tool Reporter --generate-csv /usr/bin/Performance/CMD/apache-jmeter-5.4.3/bin/AggregateReport.csv --input-jtl /usr/bin/Performance/CMD/apache-jmeter-5.4.3/bin/test.csv --plugin-type AggregateReport
python3 /usr/bin/Performance/csvconverter.py
cd /usr/bin/Performance/CMD/apache-jmeter-5.4.3/bin
mv Aggregatereport.json /usr/bin/Jmeter/leapx-backstage-docs/reports/${Aggregatereportname}.json
tail -n +2 test.csv | cut -d ',' -f3 | sort -r | sed 's/ /@/g' | uniq -c | sort -r | awk '{print $2,$1}' | sed 's/ /":/g;s/^/"/g;' | sed 's/@/ /g' | sed ':a;N;$!ba;s/\n/,/g' | sed 's/^/{/g;s/$/}/g;' > rc.json
mv rc.json /usr/bin/Jmeter/leapx-backstage-docs/reports/${ResponseCodereportname}.json
