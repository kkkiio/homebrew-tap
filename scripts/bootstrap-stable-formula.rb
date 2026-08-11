#!/usr/bin/env ruby
# typed: strict
# frozen_string_literal: true

formula_path, url, version, sha256 = ARGV
abort "usage: bootstrap-stable-formula.rb FORMULA URL VERSION SHA256" if ARGV.length != 4
abort "formula does not exist: #{formula_path}" unless File.file?(formula_path)
abort "release URL must use HTTPS" unless url.start_with?("https://github.com/")
abort "invalid version: #{version}" unless version.match?(/\A\d+\.\d+\.\d+(?:[.-][0-9A-Za-z.-]+)?\z/)
abort "invalid SHA256" unless sha256.match?(/\A[0-9a-f]{64}\z/)

formula = File.read(formula_path)
abort "formula already has a stable URL" if formula.match?(/^  url /)
abort "formula has no HEAD specification" unless formula.match?(/^  head /)
abort "formula has no license anchor" if formula.scan(/^  license /).length != 1

stable = [
  "  url #{url.inspect}",
  "  version #{version.inspect}",
  "  sha256 #{sha256.inspect}",
  "",
  "",
].join("\n")
formula.sub!(/^  license /, "#{stable}  license ")
File.write(formula_path, formula)
