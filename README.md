# euru-trans
[![Build
Status](https://travis-ci.org/schultyy/euru-trans.svg?branch=master)](https://travis-ci.org/schultyy/euru-trans)
Website for eurucamp 2014 transcriptions

# Dependencies

- Elixir 1.0
- [Phoenix](https://github.com/phoenixframework/phoenix)
- Elasticsearch

Eurucamp transcriptions checked out in `transcripts` folder. For now the
transcriptions are not publicly available

# Instructions
To start your new Phoenix application you have to:

1. Install dependencies with `mix deps.get`
2. Start Phoenix router with `mix phoenix.start`

Now you can visit `localhost:4000` from your browser.

# Transcriptions

Transcriptions are fetched from Elasticsearch.
- Elasticsearch must be available under `http://localhost:9200`.
- Transcriptions must be available in `transcripts` index.

Transcript format:
- `title`
- `text`
- `teaser`
- `id`
- `speaker`

## Notes

* If you choose to change the application's structure, you could manually start the router from your code like this `EuruTrans.Router.start`
