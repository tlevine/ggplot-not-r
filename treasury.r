# -----------------------------------------
# Ignore everything until the line that
# says "Ignore everything above this line."
# -----------------------------------------

# Check that the database file is there.
if (!(file.exists('treasury_data.db'))) {
  cat('You need to download the database; run this from the shell.

  wget http://api.treasury.io/cc7znvq/47d80ae900e04f2/http/treasury_data.db

')
  quit()
}

if (!(require(ggplot2) & require(sqldf))) {
  cat("You need to install some packages; run this from R.

  install.packages(c('ggplot2','sqldf'))

")
  quit()
}



# Load all of the tables into R
.tables <- sqldf('SELECT tbl_name FROM sqlite_master', dbname = 'treasury_data.db')$tbl_name
for (.table in .tables) {
  if (!(.table %in% ls())) {
    .sql <- paste('SELECT * FROM', .table)
    assign(.table, sqldf(.sql, dbname = 'treasury_data.db'))
  }
}

# ----------------------------------
# Ignore everything above this line.
# ----------------------------------







# Querying
t3a_head <- sqldf('SELECT * FROM t3a LIMIT 100;')

# Note: sqldf queries both from the SQLite3 database
# and from the current R session.

print(sqldf('SELECT sum(today) FROM t3a_head'))

# Note well: Do not create variables with the names of any of the tables.
# (If you do that, sqldf will query the table from the R session rather than
# from the SQLite3 database.)




# Plotting
#
# There are a lot of syntaxes you can use with ggplot.
# This one is probably the most verbose format you can get,
# but it makes the different components quite clear.
p1 <- ggplot(t3a_head) + aes(x = date, y = today) + geom_point()
print(p1)




sql <- '
SELECT
  "table",
  "date",
  "year_month",
  "year",
  "month",
  "day",
  "weekday",
  "account",
  "transaction_type",
  "parent_item",
  "is_total",
  "is_net",
  "item",
  "item_raw",
  "today",
  "mtd",
  "fytd",
  "url"
FROM "t2"
WHERE ("date" > \'2013-09-01\')
AND ("transaction_type" = \'deposit\' OR "transaction_type" = \'withdrawal\')
'
recent.transactions <- sqldf(sql)
recent.transactions$date <- as.Date(recent.transactions$date)
p2 <- ggplot(subset(recent.transactions, is_total == 0)) +
  aes(x = date, group = transaction_type, color = transaction_type, y = today) +
  geom_line() + facet_wrap(~ item)
