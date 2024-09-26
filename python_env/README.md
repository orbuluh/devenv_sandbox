# Data science sandbox

- polars
- xgboost
- kaggle


## side note: kaggle

Need to generate kaggle.json on the website and put it into `/home/${USER}/.config/kaggle/kaggle.json`

- `WA_Fn-UseC_-Telco-Customer-Churn.csv` dataset from:

```bash
# params from url: https://www.kaggle.com/datasets/blastchar/telco-customer-churn
kaggle datasets  download -d blastchar/telco-customer-churn
unzip telco-customer-churn.zip
rm telco-customer-churn.zip
```