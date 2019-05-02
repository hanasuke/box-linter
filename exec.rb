require File.join(File.dirname(__FILE__), 'lib', 'box-linter.rb')

target = BoxLinter::Client.search 'boxlint'

notifier = BoxLinter::Notifier.new
target.each do |t|
  result = t.check
  notifier.notify!(result)
end

