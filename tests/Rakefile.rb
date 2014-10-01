require 'cucumber/rake/task'
require 'rake/clean'


Cucumber::Rake::Task.new(:features) do |task|
  task.cucumber_opts = [
      "-t @seed",
      "-f pretty",
      "-f html -o features/reports/cucumber_reports#{Time.new.strftime("%d-%m-%Y,%H-%M")}.html",
      "features"
  ]
end


task :create_cucumber_zip do
  `zip features/reports/cucumber_results.zip features/reports/cucumber_reports#{Time.new.strftime("%d-%m-%Y,%H-%M")}*.html`
end

task :run_tests do
  Rake::Task[:features].invoke
  # Rake::Task[:create_cucumber_zip].invoke
  # Rake::Task[:upload_to_tta].invoke
end


task :upload_to_tta, [:project_name, :sub_project_name, :ci_job_name, :test_category, :test_report_type, :os_name, :host_name, :browser, :type_of_environment, :date_of_execution, :logDirectory, :filePattern, :commit] do |t, args|
  args.with_defaults(:project_name => "TechOpsProject", :sub_project_name => "SalesForce", :ci_job_name => "sfdc_tests", :test_category => "Functional Test", :test_report_type => "Cucumber_HTML", :os_name => "MAc", :host_name => "mytwci", :browser => "Chrome", :type_of_environment => "Test", :date_of_execution => "1900-12-12", :logDirectory => "features/reports/cucumber_results.zip", :filePattern => "*.xml", :commit => "SUBMIT")
  $project_name = args.project_name
  $sub_project_name = args.sub_project_name
  $ci_job_name = args.ci_job_name
  $test_category=args.test_category
  $test_report_type=args.test_report_type
  $os_name=RUBY_PLATFORM
  $host_name=`hostname`.strip
  $browser=args.browser
  $type_of_environment=args.type_of_environment
  $log_directory=args.logDirectory
  $file_pattern=args.filePattern
  $commit=args.commit
  `curl -F 'authenticity_token=KBc5IruWAILeOOIVKoqozwSYx3eSatES/fklIGf/Cn4=' -F 'project_name=#{$project_name}' -F 'sub_project_name=#{$sub_project_name}' -F 'ci_job_name=#{$ci_job_name}' -F 'test_category=#{$test_category}' -F 'test_report_type=#{$test_report_type}' -F 'os_name=#{$os_name}' -F 'host_name=#{$host_name}' -F 'browser=#{$browser}' -F 'type_of_environment=#{$type_of_environment}' -F 'date="" ' -F 'logDirectory=@#{$log_directory}' -F 'commit=SUBMIT' 'tta.thoughtworks.com:3000/upload/automatic'`
end