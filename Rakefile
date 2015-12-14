require 'pathname'
require 'shellwords'

def answer_file(n)
  (Pathname.new(__dir__) + 'src').tap(&:mkpath) + "#{n}.rb"
end

def input_file(n)
  n = $& if n =~ /\A\d+/
  (Pathname.new(__dir__) + 'input').tap(&:mkpath) + "#{n}.in"
end

task :run, [:problem] do |t, args|
  problem = args[:problem]
  sh %W{ruby #{answer_file(problem)} #{input_file(problem)}}.shelljoin
end
