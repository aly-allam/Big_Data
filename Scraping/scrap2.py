import twint
t = twint.Config()
keyword = "mo salah"
t.Lang = "en"
t.Search = keyword
t.Store_object = True
t.Limit = 30000
t.Store_csv = True
t.Output ="salah.csv"
twint.run.Search(t)