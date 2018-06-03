<img align="right" width="200" src="https://vignette.wikia.nocookie.net/project-pokemon/images/3/33/250px-252Treecko.png/revision/latest?cb=20160917051000">

# Grade Tecko

- Exam for "TG company".
- Setup: `bundle exec rake db:create db:migrate`
- CSV files can be found in `spec/fixtures/example.csv`.
- To run the tests: `bundle exec rspec spec`

- TODO:
  - Check if you have to normalize on Object Type.
  - See if you can store state/snapshot in addition to the events.
  - Add strong params or do dry-validation.
  - Possibly check out turbolinks or anything to speed up retrieving part.
