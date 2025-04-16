version: 2

sources:
  - name: external_data
  loader: gcloud storage
    tables:
      - name: binance_ext
        description: 'This is an external table based on all files in the GCS bucket'
        external:
            location: 'gs://elegant-bucket/aggtrade/binance_data/*'
            options: jsonl

        columns:
          - name: _dlt_id
            data_type: varchar(255)
            #description: "Application ID"
          - name: _dlt_load_id
            data_type: varchar(255)
            #description: "Application ID"
          - name: m
            data_type: bool
            #description: "Application ID"
          - name: t
            data_type: integer
            #description: "Application ID"
          - name: q
            data_type: float
            #description: "Application ID"
          - name: l
            data_type: integer
            #description: "Application ID"
          - name: p
            data_type: float
            #description: "Application ID"
          - name: f
            data_type: integer
            #description: "Application ID"
          - name: a
            data_type: integer
            #description: "Application ID"