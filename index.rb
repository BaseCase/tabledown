#!/usr/bin/env ruby

require_relative 'lib/tabledown'

def main
  input = STDIN.read
  STDOUT.write(TableDown.of(input).format)
end

main
