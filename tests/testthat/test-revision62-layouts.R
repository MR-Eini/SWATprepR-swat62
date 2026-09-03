test_that('table reader retains newly named trailing fields', {
  dir <- tempfile()
  dir.create(dir)
  writeLines(c('title', 'id old new_field', '1 value future'), file.path(dir, 'input.tbl'))
  read <- getFromNamespace('read_tbl', 'SWATprepR')
  x <- read('input.tbl', dir)
  expect_named(x, c('id','old','new_field'))
  expect_identical(x$new_field, 'future')
})
