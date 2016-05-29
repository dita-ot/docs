#!/usr/bin/env ruby

changed = `git diff --name-only`.split("\n")
changed.each do |file|
  diff = `git diff -U0 #{file}`.split("\n")
  if (diff.length == 7 && diff[5].start_with?("-commit:") && diff[6].start_with?("+commit:"))
    puts "Reset #{file}"
    `git checkout -- #{file}`
  end
end
