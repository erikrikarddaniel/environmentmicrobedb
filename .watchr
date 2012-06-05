# put this in spec/watchr
# use with Spork
# run with `watchr spec/watchr`

# images are from Tango icon theme
# http://commons.wikimedia.org/wiki/Tango_icons#Weather

PASS_ICON = File.expand_path('../../public/images/weather-clear.png', __FILE__)
FAIL_ICON = File.expand_path('../../public/images/weather-showers.png', __FILE__)

LINUX = RUBY_PLATFORM =~ /linux/i

def notify(icon, heading, body)
  cmd = if LINUX
    "notify-send -i #{icon} --hint=int:transient:1 '#{heading}' '#{body}'"
  else
    "growlnotify --image #{icon} -m '#{body}' '#{heading}'"
  end
  system(cmd)
end
FLAGS = "--hint=int:transient:1"

def run_tests(test, force=false)
  if force || File.exist?(test)
    puts "-" * 80
    puts "Running #{test}..."
    cmd = IO.popen("rspec --color --tty --drb --format=doc #{test} 2>&1")
    result = ''
    until cmd.eof?
      line = cmd.gets
      result << line
      print line
    end
    if result =~ /(\d+) failure/ and (failures = $1.to_i) > 0
      notify(FAIL_ICON, 'Test Failure', "#{failures} test#{failures == 1 ? ' has' : 's have'} failed!")
    else
      notify(PASS_ICON, 'Test Success', 'All tests passing.')
    end
    $stdout.write(result)
  else
    puts "#{test} does not exist."
  end
end

watch('spec/(.*/*)_spec\.rb') { |m| run_tests("spec/#{m[1]}_spec.rb") }
watch('app/(.*)\.rb' ) { |m| run_tests("spec/#{m[1]}_spec.rb") }

@interrupt_received = false
Signal.trap 'INT' do
  if @interrupt_received
    exit 0
  else
    @interrupt_received = true
    puts "\nInterrupt a second time to quit"
    Kernel.sleep 1
    @interrupt_received = false
    run_tests('spec/**/*_spec.rb', :force)
  end
end