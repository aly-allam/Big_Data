import pandas as pd
columns = ["date", "time","username","tweet","language"]
df = pd.read_csv("salah.csv",usecols=columns)
a = df[df['language'] == "en"]
data = a.drop(columns="language")
data.to_csv("salah.csv")
