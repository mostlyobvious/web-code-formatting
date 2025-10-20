# frozen_string_literal: true

TARGET = "content/ruby.wasm"

file TARGET => %w[Gemfile.lock] do
  `BUNDLE_GEMFILE=Gemfile.wasm bundle exec rbwasm build -o #{TARGET} --build-profile full --ruby-version 3.4`
end

task default: [TARGET]
