
=begin
module Webpacker
  module OneTimeCompiler
    def compile
      @compiled ||= super
    end
  end

  Compiler.prepend(OneTimeCompiler) if Webpacker.config.compile?
end
=end
Webpacker::Compiler.class_eval do
  def compile
    if stale?
      run_webpack.tap do |success|
        record_compilation_digest
      end
    else
      true
    end
  end
end