import pandas as pd
csv_file = pd.DataFrame(pd.read_csv("/usr/bin/Performance/CMD/apache-jmeter-5.4.3/bin/AggregateReport.csv", sep = ",", header = 0, index_col = False))
csv_file.to_json("/usr/bin/Performance/CMD/apache-jmeter-5.4.3/bin/Aggregatereport.json", orient = "records", date_format = "epoch", double_precision = 10, force_ascii = True, date_unit = "ms", default_handler = None)
