require 'rake/testtask'

task default: :test

Rake::TestTask.new do |t|
  t.libs << '.'
  t.pattern = 'arrays_test.rb'
  t.verbose = true
  t.test_files = FileList['/*_test.rb']
end

task :test do
  mkdir_p 'test/reports'
  ENV['TESTOPTS'] = '--verbose'
  ENV['TEST_REPORTER'] = 'junit'
  ENV['TEST_REPORTS_DIR'] = 'test/reports'
  Rake::Task['test'].invoke
end